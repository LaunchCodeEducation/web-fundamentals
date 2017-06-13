---
title: 'Studio: FlickList 8'
currentMenu: studios
---

This studio has a different structure than past Flicklist studios. Instead of watching an instructor-led walkthrough and then tackling a problem on your own, you will be given tasks to add new features to the application straightaway. This will allow you to apply more of the concepts you've learned in class on your own.

## Studio

Our app at this point has user accounts and login, but users are still collaboratively editing the same list of movies. We need to fix that:
    - We'll add relationships between the `Movie` and `User` classes, so that each movie "belongs to" a specific user.
    - We'll refactor the *model* portion of the code so that it is cleaner and more reusable.
    - We will update the `/` and `/ratings` page so that a user only sees a list of movies of which she is the owner.

### Checking Out the Studio code

Follow the [instructions for getting the code][get-the-code] in order to get the starter code for `studio8`.

### Your Tasks

Notice that we are no longer littering your studio code with `TODO`s. Your instructions for the tasks you need to fulfill will be here in this section.

1. Add a `User` class to our `main.py`. Make sure that it has a column representing its relationship to the `Movie` class. And add a property to the `Movie` class that holds the id of the owner. Review the relevant [*Get it Done!* video lesson](../../../videos/get-it-done/user-task-relationship/) if you need a reminder of the process.

2. Given what you learned about the MVC pattern, refactor your code so that the `User` and `Movie` classes are moved to a file named `models.py`. For the code you put in `models.py` to work, you will need to import `db` from `main.py`. And now, in order for `main.py` to utilize the `User` and `Movie` classes, you will need to import them.

3. When the user visits the `/` and `/ratings` pages showing the unwatched and watched movies, she still sees *everybody's* movies. Fix it so that she only sees *her own* unwatched and watched movies. 

[get-the-code]: ../getting-the-code/
