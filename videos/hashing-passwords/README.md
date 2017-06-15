---
title: "Hashing Passwords"
currentMenu: videos
---

<div class="youtube-wrapper"><iframe width="776" height="437" src="https://www.youtube-nocookie.com/embed/222M0TXXMIw?rel=0" frameborder="0" allowfullscreen></iframe></div>

## Notes

In this video lesson we discuss how to hash passwords in our Flask application.

First a shell demo:

```nohighlight
>>> import hashlib
>>> pwd = 'LaunchCode'
>>> hashlib.sha256(str.encode(pwd)).hexdigest()
```

In the code example above we import the `hashlib` and create a sample password string. Then we call the `hashlib.sha256()` function on the password string after first converting it into a set of bytes using `str.encode()`. Then we get a string to store in the database, rather than an object, from the hash function using `.hexdigest()`.

You can create two functions and store them in a reusable file named `hashutils.py` for your application's password hashing needs: 

```python
import hashlib

def make_pw_hash(password):
    return hashlib.sha256(str.encode(password)).hexdigest()

def check_pw_hash(password, hash):
    if make_pw_hash(password) == hash:
        return True

    return False
```

Next, after importing the above functions into `main.py`, you'll want to modify your `User` class so that you are storing password hashes instead of the password itself:

```python
class User(db.Model):

    id = db.Column(db.Integer, primary_key=True)
    email = db.Column(db.String(120), unique=True)
    pw_hash = db.Column(db.String(120))
    tasks = db.relationship('Task', backref='owner')

    def __init__(self, email, password):
        self.email = email
        self.pw_hash = make_pw_hash(password)
```

Now you'll need to update your database to get this to work since you've changed a model class (table) by dropping and re-creating the tables in a Python session.

And then you'll need to modify the `login` function so that it compares two hashes rather than two password strings:

```python
if user and check_pw_hash(password, user.pw_hash):
```

## Code

View the [final code](https://github.com/LaunchCodeEducation/get-it-done/tree/ed8d0accc20f71497e6e941d5e950ce802df4226) from this lesson.

## References

- [`hashlib` documentation](https://docs.python.org/3/library/hashlib.html)
