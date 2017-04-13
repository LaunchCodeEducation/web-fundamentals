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

The goal today is to begin implementing user accounts and registration. This will take several steps, across the next few classes.

Today, we will update our codebase with the following additions:

- A `User` class to represent and save users in our database.
- New routes and handlers: `Login`, `Logout`, and `Register`.
- New templates for the `Login` and `Register` pages.
- Some new helper functions in our base parent `Handler` class. These will be accessible to any handler extending our base `Handler`, and we'll continue to add methods here in future studios.

Much of this code will be similar to what you completed as part of the User Signup assignment, only in the context of a larger application. You'll also employ your recently-gained skills in the area of storing objects in a database.
