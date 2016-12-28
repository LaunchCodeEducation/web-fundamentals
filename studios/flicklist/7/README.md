---
title: 'Studio: FlickList 7'
currentMenu: studios
---

Today's "studio" is unusual in that there is no activity that you, the student, must complete. The entire class will be an extended Walkthrough.

You are encouraged to code along, which, as usual, you can do by checking out the `walkthrough7` branch:

```nohighlight
$ git checkout walkthrough7
Branch walkthrough7 set up to track remote branch walkthrough7 from origin.
Switched to a new branch 'walkthrough7'
```

But as usual, if you fall behind the instructor, don't stress about it. Just sit back and watch.

### Walkthrough

Thus far, our web-app does not have a concept of user accounts built in. As a result, there is only one "communal" movie list, and all the users who visit our site work "collaboratively" on that list. That's kind of cool maybe, but our goal is a site where each user manages her own list, without interference from other users. That is exactly what we will do today!

The goal today, at a high level, is to implement the existence of user accounts and registration, and ensure that users cannot see the main pages of the site unless they are logged in.

More specifically, we will update our codebase with the following additions:

- A `User` class to represent and save users in our database.
- New routes and handlers: `Login`, `Logout`, and `Register`.
- New templates for the `Login` and `Register` pages.
- Some new helper functions in our base parent `Handler` class. These helper functions will preempt every request with a "login wall", so that certain pages (such as *My WatchList*) cannot be accessed unless the user is logged in.
- A separate file with some more helper functions, lower-level utilities to help us with hashing and salting, so that we can encrypt and decrypt passwords.

That's a lot! We would have liked to give you the chance to write some of this code yourself, but there is not enough time. Luckily, your upcoming Assignment will give you a similar chunk of starter code, so you won't be expected to write all this code on your own during the assignment.
