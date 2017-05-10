---
title: 'Studio: FlickList 10'
currentMenu: studios
---

Like Flicklist 8, this studio has a different structure than most Flicklist studios. Once again, you will work through a guided tutorial to add some new features to the application.

## Studio

We've added all of the main user-facing features to the Flicklist application. One aspect of the application that users typically don't think about is security. That doesn't mean that as developers we shouldn't prioritize it. We must treat our users' data carefully, and do everything we can to prevent sensitive data from being exposed. We'll make our passwords and cookies secure in this studio using hashing.

### Checking Out the Studio code

Before getting the starter code for this studio, fetch updates from the main repository:

```nohighlight
$ git fetch origin
```

This will pull down any updates made by the LaunchCodeEducation team.

Then, follow the [instructions for getting the code][get-the-code] in order to get the starter code for `studio10`.

### Your tasks

There are two types of data that we'll make more secure today: passwords and cookies.

#### Hashing passwords

Passwords should be hashed when creating a new user account so that in the event of a security breach -- for example, a database break-in -- it will be extremely difficult for anybody to unmask the passwords.

Recall that hashing uses one of many available algorithms to turn a string into a hexadecimal number. For example, with the sha256 algorithm, "LaunchCode" becomes:

```nohighlight
fd433b1435c24ea70f918e6236d4185c18fa708754cec1dab86d931eb1273c71
```

The key concept that makes a given hashing algorithm useful for security purposes is that it is structured such that it is extremely difficult, and would take an incredibly large amount of time, to reverse the process and retrieve the original string.

Generating a hash for a string is easy. Turning a hash back into the string that it came from should be very, very, very hard. The hard this reverse process is, the better the hash algorithm. Algorithms with this property are known as *one-way hash functions**.

<aside class="aside-question" markdown="1">
Would either of the Caesar or Vigenere ciphers make good hashing algorithms? Why or why not?
</aside>

##### Encrypting passwords: make_pw_hash

Our first step is to enable hashing for new passwords.

Create a new file in the top directory of the `flicklist-python` project named `hashutils.py`. Define a new function:

```python
def make_pw_hash(name, pw, salt = None):
    # Not yet implemented
```

We'll need a few modules to complete this method, so add these imports at the top of the file:

```python
import random
import string
import hashlib
import hmac
```

The function `make_pw_hash` should return a hash value for the given information. Recall from the prep work lessons that a good approach to creating a password hash is to incorporate additional data in the string to be hashed. In other words, we'll hash the result of concatenating each of the inputs to our function: `name + pw + salt`. Here, `name` will be the user's username, and `salt` will be a random string of characters. Hashing this longer string makes it even harder for somebody to reconstruct a password from a hash, since they'd need to know the username and salt as well.

For each new user account, we will create a new salt. In such cases, the function will be called without the `salt` parameter. (Why we would pass in a salt will become clear in a bit.) So, the first thing to do is create a salt if one hasn't been provided:

```python
if not salt:
    salt = ''.join(random.choice(string.letters) for x in xrange(5))
```

This code generates a string of five random letters to use as a salt.

Once we have a salt, we can use `hashlib` to create and return the hash:

```python
h = hashlib.sha256(name + pw + salt).hexdigest()
return '%s,%s' % (h, salt)
```

The complete function is:

```python
def make_pw_hash(name, pw, salt = None):
    if not salt:
        salt = ''.join(random.choice(string.letters) for x in xrange(5))

    h = hashlib.sha256(name + pw + salt).hexdigest()
    return '%s,%s' % (h, salt)
```

Let's pause here to make sure we understand what's being done in the last two lines. First, we ask `hashlib` to use the sha256 algorithm to hash the string `name + pw + salt`. We then get the hexadecimal value of the hash and store it in `h`.

Finally, we return a string that contains both the hash and the salt, separated by a comma. Here's an example of what that might look like for the username "jenny" with password "coding is great!" and salt "fYnmA":

```nohighlight
"0cc3f792d89237146075c655cad7c56c84108f1d8cc58fb2be127316fb53fe9c,fYnmA"
```

To get this value, we first joined the three strings to get "jennycoding is great!fYnmA", and then passed this value to the hash function. Storing the salt in the database alongside the hash in this way will allow us to verify a user's password. We will write the code to do that in a moment.

First, however, let's start using `make_pw_hash` in our application!

##### Hashing passwords for new users

Back in `main.py`, import your `hashutils` module by adding this to the list of imports at the top: `import hashutils`.

Within the `post` method of the `Register` handler, find the line where we create a new `User` object. It looks like this:

```python
user = User(username=username, password=password)
```

Make a new line above this one, and create a hash from the user's data:

```python
pw_hash = hashutils.make_pw_hash(username, password)
```

Then, use `pw_hash` in place of `password` when creating the user:

```python
user = User(username=username, password=pw_hash)
```

That's it! New users will now have their passwords hashed. If you tried to create and use a new account at this point, you'd be able to register, but you wouldn't be able to log in because there is no means of checking a hashed password. That's our next task.

#### Validating hashed passwords

##### valid_pw

In `hashutils.py`, let's add a new function that we can use to verify a user's password against a hash, to use when logging in. The function will need to:

1. Accept `name` and `password` parameters, representing the info submitted via the login form.
2. Accept a hash `h`, representing the hash from the database stored under the record for the user with username `name`.
3. Use `name`, `password`, and the salt portion of `h` -- recall that `h` will hold both the salt and the hash created during registration -- to create a new hash, say, `test_hash`.
4. Compare `h` with `test_hash`. If they are equal, we'll be able to say with very, very, very high probability that the user's credentials are valid.

<aside class="aside-question" markdown="1">
Why might we not be able to be 100%, without-a-shadow-of-a-doubt, absolutely certain that the user's credentials are valid? And why is it okay for us to know be absolutely sure?
</aside>

Type (not paste!) this function into `hashutils.py`:

```python
def valid_pw(name, pw, h):
    salt = h.split(',')[1]
    test_hash = make_pw_hash(name, pw, salt)
    return h == test_hash
```

Go over each line of this function, and make sure that you understand how it accomplishes the steps outlined above.

##### Using valid_pw

Back in `main.py`, find the `post` method of the `Login` handler. Then focus in on the line where we check the user's password against the value stored under their username in the database. It looks like this:

```python
elif submitted_password != user.password:
```

We need to modify this to use our fancy new `valid_pw` function. Replace this check with the following:

```python
elif not hashutils.valid_pw(submitted_username, submitted_password, user.password):
```

This check now uses `hashutils.valid_pw` to check whether or not the submitted info hashes to the same value retrieved from the database in `user.password`.

#### Test user registration and login

All of the code needed to work with password hashes instead of plain-text passwords is now in place. Fire up your application and test that you can register a new user, and log that user in.

From the GAE Launcher, open the SDK Console and select *Datastore Viewer*. There, you'll see your new user with a password hash stored in place

<aside class="aside-warning" markdown="1">
Any user accounts created before this point will no longer be able to log in! If you experience issues with such accounts and associated user data, an easy fix is to delete all data from the datastore and start over.
</aside>

#### Hashing cookies

Recall from the lesson on cookies that a mischievous individual can change the values of cookies in their browser, effectively allowing them to log in as another user if they can guess the `user_id` correctly. Currently, the `user_id` cookie is stored in an un-hashed fashion, and looks something like this in the browser:

![Un-hashed cookie](images/unhashed-cookie.png)

Note that numeric value of the cookie is the actual ID of the given user. This isn't good. Let's fix it by hashing our cookies!

##### Some utility functions

The functions that we need to enable hashing of cookies were written in lessons you've completed, so let's grab them from there:

```python
SECRET = 'czUv86iAN9GXA3MT'
def hash_str(s):
    return hmac.new(SECRET,s).hexdigest()

def make_secure_val(s):
    return '%s|%s' % (s, hash_str(s))

def check_secure_val(h):
    s = h.split('|')[0]
    if h == make_secure_val(s):
        return s
```

Let's look at what's happening here:

- `SECRET` - This variable is a random string that will be used as the salt for hashing each one of our cookies. You can change this to another value, if you like. In fact, that would be much safer than leaving it as-is, since this secret value is publicly stored in the LaunchCodeEducation GitHub account!
- `hash_str` - This function takes a string and uses the `hmac` library to create a hash of the string using the value of `SECRET`. We could have used `hashlib` here as we did with passwords, but as was noted in the lesson, using `hmac` is a bit more secure for the situation in which we're using the same salt to hash each value.
- `make_secure_val` - This function takes a string and creates a new string, consisting of the string passed in alongside its hash (generated from `hash_str`), separated by `|`. This combined value is the value that we'll store in the actual cookie, and having both the raw string and its hash will allow us to verify the value of the cookie in the future.
- `check_secure_val` - This function uses a technique similar to `valid_pw` to ensure that the value of a cookie is valid. In other words, it checks that when we have a cookie value like `val|hash_val`, the result of hashing `val` is the string `hash_val`. This ensures that nobody has changed `val`. If the check fails, then there is no return value, effectively returning `None`.

<aside class="aside-pro-tip" markdown="1">
If you were writing code for a real-world system, you'd store `SECRET` somewhere else that was less accessible, such as in an environment variable on the server.
</aside>

Add these functions to `hashutils.py`.

##### Setting and verifying hashed cookies

We now need to update precisely two pieces of code to enable secure cookies in our application.

Back in `main.py`, find the `set_cookie` method of the `Handler` class. Use `make_secure_val` to generate a new, secure value/hash pair for the value that you're about to set in the cookie:

```python
cookie_val = hashutils.make_secure_val(val)
```

Then update the code that sets the cookie in the response headers. The final method should look like this:

```python
def set_cookie(self, name, val):
    cookie_val = hashutils.make_secure_val(val)
    self.response.headers.add('Set-Cookie', '%s=%s; Path=/' % (name, cookie_val))
```

Now, in `read_cookie`, update the return statement to use `check_secure_val`:

```python
return hashutils.check_secure_val(cookie_val)
```

Recall that if the cookie fails the check, meaning it has been tampered with, this will return `None`. In effect, this will be the same as if there was no such cookie at all.

##### Test setting secure cookies

If you're logged in to the application, log out. Then try to log in again. If you're able to do so, then you know your updated code works because logging in uses setting and reading of cookie. If not, back up to the steps above to find where you went astray.

Once the code is working, you'll see that cookie values are stored in a format like this:

![Hashed cookie](images/hashed-cookie.png)

Congratulations! You have just finished making your web application data secure.

[get-the-code]: ../getting-the-code/
