---
title: 'Studio: FlickList 9'
currentMenu: studios
---

## Walkthrough

We've added all of the main user-facing features to the Flicklist
application. One aspect of the application that users typically don't
think about is security. That doesn't mean that as developers we
shouldn't prioritize it. We must treat our users' data carefully, and
do everything we can to prevent sensitive data from being
exposed. We'll make our passwords secure in this studio using
hashing. 

We'll also clean up our code a bit and make it less complicated
through a technique called *refactoring*.

There's no presentation - let's get started!

## Studio

### Checking Out the Studio code

Follow the [instructions for getting the code][get-the-code] in
order to get the starter code for `studio9`.

### Hashing passwords

Passwords should be hashed when creating a new user account so that in
the event of a security breach -- for example, a database break-in --
it will be extremely difficult for anybody to unmask the passwords.

Recall that hashing uses one of many available algorithms to turn a
string into a hexadecimal number. For example, with the *sha256
algorithm*, "LaunchCode" becomes `fd433b1435c24ea70f918e6236d4185c18fa708754cec1dab86d931eb1273c71`.

A hashing algorithm is useful for security purposes if it would be
difficult to reverse the process and retrieve the original string.

Generating a hash for a string is easy. Turning a hash back into the
string that it came from should be very, very, very hard. The harder
this reverse process is, the better the hash algorithm. Algorithms
with this property are known as *one-way hash functions*.

<aside class="aside-question" markdown="1"> 
  Would either of the Caesar or Vigenere ciphers make good hashing
  algorithms? Why or why not?
</aside>

#### Encrypting passwords: hash_password

Our first step is to create a layer on top of sha256 that's
appropriate for our User model. 

Create a new file in the top directory of the `flicklist-python`
project named `hashutils.py`. Define a new function:

```python
def hash_password(name, pw, salt):
    # Not yet implemented
```

We'll need a few modules to complete this method, so add these imports
at the top of the file:

```python
import random
import string
import hashlib
import hmac
```

The function `hash_password` should return a hash value for the given
information. Recall from the prep work lessons that a good approach to
creating a password hash is to incorporate additional data in the
string to be hashed. In other words, we'll hash the result of
concatenating each of the inputs to our function: `name + pw +
salt`. Here, `name` will be the user's username, `pw` will be the
password, and `salt` will be a random string of characters. Hashing
this longer string makes it even harder for somebody to reconstruct a
password from a hash, since they'd need to know the username and salt
as well. Here's our first try:

```python
def hash_password(name, pw, salt):
    unencrypted_string = name + pw + salt
    return hashlib.sha256(unencrypted_string).hexdigest()
```

Let's understand what's being done. First, we ask `hashlib` to use the
sha256 algorithm to hash the string `name + pw + salt`. That returns a
python instance, which we can't store in the database. Calling
`hexdigest()` turns it into a series of hexidecimal digits
(0123456789abcdef) which is great for storing in database string
columns.

<aside class="aside-question" markdown="1"> 
You may have heard that hash values are essentially large
integers. Why are we storing these huge strings when databases can
just as easily store integers?

SQL integerss are typically just 31 bits, or below
2,147,483,648. We need more, so we store them in long strings. So
we go through all this rigamarole to convert hash keys
(essentially huge integers) into strings. To be honest, it's a way
to work around the limitations of SQL's int type. 
</aside>

So in short, we've taken the variable `unencrypted_string`, typically
something like "dave@gmail.comMySecretPasswordjakkl", and hashed it to
a longer gibberish string like
`b52be2340e7627468f911dc6f552864eb8b2025a663263a21cb0f813e7353387`. 

Let's try it out:

```nohighlight

>>> hashlib.sha256('foo').hexdigest()
Traceback (most recent call last):
  File "<stdin>", line 1, in <module>
TypeError: Unicode-objects must be encoded before hashing
>>>

```

Uniwhat? 

Without thinking too hard, we google "python3 encode unicode for
hash", and thanks to the [top-ranked StackOverflow response](http://stackoverflow.com/a/5292360/5158597), we add one
more method call:

```python
def hash_password(name, pw, salt):
    unencrypted_string = name + pw + salt
    return hashlib.sha256(unencrypted_string.encode('utf-8')).hexdigest()
```

We smoke-test this and it works. 

```nohighlight
>>> import hashutils
>>> hashutils.hash_password("dave@gmail.com", "MySecretPassword", hashutils.make_salt())
'b52be2340e7627468f911dc6f552864eb8b2025a663263a21cb0f813e7353387'

```

Great. Let's keep moving. 

Next up, let's talk about how we make our salts - random 5-letter
strings. This is straight python using a list comprehension and the
system constant `string.ascii_lowercase`:

Add to `hashutils.py`:
```python
SALT_SIZE = 5

def make_salt():
    random_letters = [random.choice(string.ascii_lowercase) for i in range(SALT_SIZE)]
    return ''.join(random_letters)
```

`''.join(...)` takes an array of strings and concatenates the
results, returning a string. 

We test our function `make_salt`, and see that it correclty returns a list of five random letters:

```nohighlight
>>> import hashutils
>>> hashutils.make_salt()
'cmigu'
>>> hashutils.make_salt()
'ohzef'
>>> hashutils.make_salt()
'loqfe'
>>> hashutils.make_salt()
'nlgzf'
```
Great! We've got the tools we need. Now it's time to use them.

#### Hashing passwords for new users

For each new user account, we will create a new salt. We'll store the
salt in our database. We'll change `register` to also write the salt
column, as well as storing a hashed password. Tab back into `main.py`
and alter `register`:

```python
def register():
    [...]
        salt = hashutils.make_salt()
        pw_hash = hashutils.hash_password(email, password, salt)
        user = User(email=email, password=pw_hash, salt=salt)
        db.session.add(user)
    [...]
```

Once we drop and recreate the database, new users will now have their
passwords hashed. If you tried to create and use a new account at this
point, you'd be able to register, but you wouldn't be able to log in
because there is no means of checking a hashed password. That's our
next task.

### Validating hashed passwords

#### authenticate

In `hashutils.py`, let's add a new function that we can use to verify
a user's password against a hash, to use when logging in. The function
will need to:

1. Accept `name` and `password` parameters, representing the info submitted via the login form.
2. Accept `salt` and `hashed_password` straight out of the database.
that user. 
3. Use the name, password, and salt to create a new hashed value, say
`trial_hash`.
4. Compare the stored hashed password with `trail_hash`. If they are equal, we'll be able to say with very, very, very high probability that the user's credentials are valid.

<aside class="aside-question" markdown="1">
Why might we not be able to be 100%, without-a-shadow-of-a-doubt, absolutely certain that the user's credentials are valid? And why is it okay for us to not be absolutely sure?
</aside>

Type (not paste!) this function into `hashutils.py`:

```python
def authenticate(name, pw, salt, hashed_pw):
    trial_hash = hash_password(name, pw, salt)
    return trial_hash == hashed_pw
```

#### Using authenticate

Back in `main.py`, find the `login` function. Then focus in on the
line where we check the user's password against the value stored under
their username in the database. It looks like this:

```python
  if password == user.password:
```

We need to modify this to use our fancy new `authenticate` function. Replace this check with the following:

```python
  if hashutils.authenticate(username, password, user.salt, user.password):
```

We offload the more complex test to our hashutils library. 

Make sure you understand how the two 'passwords' interact. The second
parameter, `password` comes from the value they just typed into the
form. It'll be something the user can remember, perhaps 
'I love Lucy 6/31/2007'. The fourth parameter, `user.password` is the hashed string
retrieved from the database, it'll look like
'b52be2340e7627468f911dc6f552864eb8b2025a663263a21cb0f813e7353387'.

### Test user registration and login

All of the code needed to work with password hashes instead of
plain-text passwords is now in place. Fire up your application and
test that you can register a new user, and log that user in.

When we tested it, we hit a bug:

```
File "/home/dm/miniconda3/envs/flicklist/lib/python3.6/site-packages/sqlalchemy/orm/query.py", line 2755, in one
raise orm_exc.NoResultFound("No row was found for one()")
sqlalchemy.orm.exc.NoResultFound: No row was found for one()
```
What's happening here is that the browser still stores the session
from the old version of the database. Flicklist sees that the user has
a session, even if the session is nonsense for the current
database. Theoretically at least, we wouldn't have this problem in
production, but that seems risky. Let's solve it.

We'd like invalid sessions to be treated as no session at all. Let's
modify our requireLogin function to require more logins - specifically
requiring it for users with bad sessions.

Right now we have:

```
def requireLogin():
    if not ('user' in session or request.endpoint in endpoints_without_login):
        return redirect("/register")
```


In english, this if test is saying 'If they have a session or if
they're going to an endpoint that doesn't require login'. Let's change
that to be 'If they have a session that *refers to a real user* or if
they're going to an endpoint that doesn't require login'.

How do we know if they're a real user? They are a real user if there's
at least one user in the DB with their email address. After some
thought, our second try looks like:

```
def requireLogin():
    if not (('user' in session and User.query.filter_by(email=session['user']).count() > 0) or request.endpoint in endpoints_without_login):
        return redirect("/register")
```

We try this out and it works. Hooray! But now this expression is
getting quite hard to read. 


## Refactoring

When code gets hard to read, it gets hard to think about. When code
gets hard to think about, it's hard to get right, and it's hard to
change. 

A programmer is speaking to the machine, but they're also speaking to
programmers. Making this easy makes for better code.

A *refactor* of code doesn't change what it does, but it changes how
it reads. Here's a classic example:

``` 
function isred(s):
    if s == 'red':
        return True
    else:
        return False

```
The key insight is that the expression `s == 'red'` already returns
True and False in the same circumstances as the whole function. So we
can refactor the function thusly:

```
function isred(s):
    return s == 'red'
```

We've taken a five line function down to two lines. It's easier to
read and faster to read.  

Let's refactor requireLogin to make the code easier to
understand. Right now our test looks like:

``` 
if not (... or ...):
```

We'll not peek inside the dots yet, but let's give the dots
descriptive names in the form of local variables:

#### Before:

```
def requireLogin():
    if not (('user' in session and User.query.filter_by(email=session['user']).count() > 0) or request.endpoint in endpoints_without_login):
        return redirect("/register")
```
#### After:

```
def requireLogin():
    user_has_a_valid_session = 'user' in session and User.query.filter_by(email=session['user']).count() > 0
    login_not_required = request.endpoint in endpoints_without_login
    if not (user_has_a_valid_session or login_not_required):
        return redirect("/register")
```

Although this is longer, we argue it is a little better. We've
introduced some local variables with some rather long names. The
variable names have the force of a comment. They're actually better
than a comment, because future programmers are more likely to read
them.

We still have a way to go though to making this code readable,
though. Let's keep our focus on the `if` test:

#### Before:

```
    if not (user_has_a_valid_session or login_not_required):
```

De Morgan's Laws from formal logic that say that `not (... or ...)` is
eqivalent to `(not ...) and (not ...)`. We're going to apply that to
our test:

#### After:

```
    if (not user_has_a_valid_session) and (not login_not_required):
```

This is still not clear. In fact, it seems like 
`(not login_not_required)` is taunting us!  But just by saying this
aloud in english, we realize that what we want is to invert
`login_not_required` into `login_required`:

#### Before:

```
    login_not_required = request.endpoint in endpoints_without_login
    if (not user_has_a_valid_session) and (not login_not_required):
```

#### After:

```
    login_required = request.endpoint not in endpoints_without_login
    if (not user_has_a_valid_session) and login_required:
```

This is coming along. Let's see if we can try the same thing on the
first half of the `and`, replacing `(not user_has_a_valid_session)`
with `user_has_no_valid_session`:

#### Before:

```
def requireLogin():
    user_has_no_valid_session = 'user' in session and User.query.filter_by(email=session['user']).count() > 0
    login_required = request.endpoint not in endpoints_without_login
    if (not user_has_no_valid_session) and login_required:
        return redirect("/register")
```

#### After:

```
def requireLogin():
    user_has_no_valid_session = not ('user' in session and User.query.filter_by(email=session['user']).count() > 0)
    login_required = request.endpoint not in endpoints_without_login
    if user_has_no_valid_session and login_required:
        return redirect("/register")
```

Now our `if` test is so easy to read, even your boss can do it: 

#### Good Work:

```
  if user_has_no_valid_session and login_required:
```

But we still have an issue with our `user_has_no_valid_session`
variable. It's pretty hard to read. In fact, we just made it harder to
read by adding the `not`. What to do?

#### Before:

```
    user_has_no_valid_session = not ('user' in session and User.query.filter_by(email=session['user']).count() > 0)
```

We try applying the *other* version of De Morgan's laws - 
`not (... and ...)` is the same as `(not ...) or (not ...)`, and have
this:

#### Middle:
```
    user_has_no_valid_session = (not 'user' in session) or (not User.query.filter_by(email=session['user']).count() > 0)
```

We smash the `not`'s down into each side of the `or`. For the left this
looks like `(not 'user' in session)` => `('user' not in session)`. For
the right we realize that the only count that's not greater than zero
is zero, and so `(not (...) > 0)` => `(...) == 0`. 

#### After:
```
    user_has_no_valid_session = 'user' not in session or User.query.filter_by(email=session['user']).count() == 0
```

And now we look at this and realize it's still hard to
read. Sometimes, these algebraic refactors can only take us so far,
and we have to actually reason about what the code is doing. 

Stepping back, we would like to ditch the left hand side of the `or`
entirely, but we need it to guard the right side, otherwise evaluating
`session['user']` will throw an error when there's no user in session.

We'd also like to store the right hand side in a local variable, but
then we'd evaluate the unguarded expression `session['user']` and get an
error when the user wasn't logged in. When local variables aren't good
enough, it's time to consider making helper functions.

We stare at this expression for a while. We also look at our other
similar code. Eventually we decide to write this helper function:

```
def logged_in_user():
    return 'user' in session and User.query.filter_by(email=session['user']).first()
```

This function returns a User instance, or None if there is none. It
looks inside the session and the DB both to make that
determination. Recall that the `.first()` method returns the first
element from a bunch of SQLAlchemy query api results, or None if there
were zero. Equipped with that knowledge, we rewrite thusly:

```
def requireLogin():
    user_has_no_valid_session = not logged_in_user()
    login_required = request.endpoint not in endpoints_without_login
    if user_has_no_valid_session and login_required:
        return redirect("/register")
```

This is great! But now the variable `user_has_no_valid_session` starts
to look redundant. We erase it and inline it's value:


```
def requireLogin():
    login_required = request.endpoint not in endpoints_without_login
    if not logged_in_user() and login_required:
        return redirect("/register")
```

Lastly, we rearrage the order of the arguments to `and`, because it
reads a little better:


#### The Grand Finish:

```
def requireLogin():
    login_required = request.endpoint not in endpoints_without_login
    if login_required and not logged_in_user():
        return redirect("/register")
```

Let's sit back and reflect on how far we've come. When we started this
refactor this is the code we had:

#### The Bad Old Days:

```
def requireLogin():
    if not (('user' in session and User.query.filter_by(email=session['user']).count() > 0) or request.endpoint in endpoints_without_login):
        return redirect("/register")
```
Which code do you understand better?

Additionally we've written this `logged_in_user` function, and we can
go on a refactoring rampage through `main.py`, replacing three
somewhat-hard-to-read occurrences of occurences of
`User.query.filter_by(email=session['user']).one().id` with
`logged_in_user().id`. The latter is much easier to read. So much so,
we can do away with the local variables named `current_user_id`. For
example, MovieRatings can go from:

```
def MovieRatings():
    current_user_id = User.query.filter_by(email=session['user']).one().id
    return render_template('ratings.html', movies = getWatchedMovies(current_user_id))
```
to:

```
def MovieRatings():
    return render_template('ratings.html', movies = getWatchedMovies(logged_in_user().id))
```

There are entire books on refactoring and writing more readable
code. It's a valuable skill to have, and it makes better software.

## What we've done

Our site appears to have no new features today, but we've improved it
in two major ways

1. Our security risks are lower
2. Our code is easier to read

We have finished the Python features of Flicklist. Congratulations!

[get-the-code]: ../getting-the-code/
