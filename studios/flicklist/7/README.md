---
title: 'Studio: FlickList 7'
currentMenu: studios
---

Today we'll add *Users* to our application, and allow them to log in,
log out, and create accounts. We'll learn how to store state in a
user's session.  We'll learn about *flash messages*, which let us
overlay messages onto the next page the user visits.

You are encouraged to code along, which, as usual, you can do by
checking out the `walkthrough7` branch:

```nohighlight
$ git checkout walkthrough7
Branch walkthrough7 set up to track remote branch walkthrough7 from origin.
Switched to a new branch 'walkthrough7'
```

## Walkthrough

Thus far, our web-app does not have a concept of user accounts built
in. As a result, there is only one "communal" movie list, and all the
users who visit our site work "collaboratively" on that list. That's
kind of cool maybe, but our goal is a site where each user manages her
own list, without interference from other users.

The goal today, at a high level, is to implement the existence of user
accounts and registration, and ensure that users cannot see the main
pages of the site unless they are logged in.

More specifically, we will update our codebase with the following
additions:

- A `User` class to represent and save users in our database.
- New routes and methods: `register` and `logout`.
- A new template for the `register` page.
- We'll modify our `base` template to display the username or links to login and register.
- A 'login wall' that monitors requests of unlogged-in users, and prompts them to create an account if they're not logged in.
- We'll further modify our `base` template to display flash messages, so that we can tell the user things like "you typed the wrong password"

<aside class="aside-note" markdown='1'>For simplicity's sake, today we will just drop and re-create the database. In a later lesson, we will discuss migrations which is how to transform database schema without destroying the existing data.</aside>


## Studio

You know how annoying it is to create new accounts on websites? It
always seems like the name you want is taken, or the passowords must
have 87 digits in them, or whatever? Congratulations, now you get to
make those rules yourself.

Also, right now the only way to log is is as a side-effect of creating
a new account. It'd be neat if once users created accounts and logged
out, they could log back in using their existing email and password.

### Checking out the Studio code

Follow the [instructions for getting the code][get-the-code] in order to get the starter code for `studio7`.

### Before you begin: create the 'user' DB table locally

```nohighlight
(flicklist) $ python
>>> from main import db, User
...
>>> db.create_all()
...
>>> db.session.commit()
User.query.all()
...
[]

```

### Your Tasks

1. When a user tries to create an account, but supplies different 'password' and 'verify' fields, redirect them back to '/register' and flash them a message about why thier attempt to create an account failed.
2. Log out, and see what happens when you try to create a user that already exists. This happens because we passed the 'unique=True' keyword param to the User.email db.Column invocation. When we wear our DB Admin hats, we're happy to get this error, but when we wear our UX designer hats, we want something friendlier. Before creating an account, search the database for an existing account with that email. If it exists already, redirect them back to 'register' and tell them why their account creation failed.
3. Add a new route for '/login', that responds to GET and renders a 'login.html' template.
4. Create the 'login.html' template, with form fields for email and password.
5. Test out your new route - one problem you will notice is that you get redirected to the 'register.html' page. Change the login wall to allow this route through.


### Retrospective

We've created users and managed the login and logout process. But the
User model doesn't relate at all to our Movie model. In the next
studio, we'll 'cross the streams' and store movies on a per-user basis.

[get-the-code]: ../getting-the-code/
