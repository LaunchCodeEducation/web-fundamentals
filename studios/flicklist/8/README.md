---
title: 'Studio: FlickList 8'
currentMenu: studios
---

This studio has a different structure than past Flicklist studios. Instead of watching an instructor-led walkthrough and then tackling a problem on your own, you will be given tasks to add new features to the application straightaway. This will allow you to apply more of the concepts you've learned in class on your own.

## Studio

Our app at this point has user accounts and login, but users are still collaboratively editing the same list of movies. We need to fix that:
    - We'll add relationships between the `Movie` and `User` classes, so that each movie "belongs to" a specific user.
    - We'll refactor the code so that it is cleaner and more reusable, in line with the *MVC* pattern.
    - We will update the `/` and `/ratings` page so that a user only sees a list of movies of which she is the owner.

### Checking Out the Studio code

Follow the [instructions for getting the code][get-the-code] in order to get the starter code for `studio8`.

### Your Tasks

Notice that we are no longer littering your studio code with `TODO`s. Your instructions for the tasks you need to fulfill will be here in this section.

1. Add a column to the `User` class representing its relationship to the `Movie` class. And add a property to the `Movie` class that holds the id of the owner. Review the relevant [*Get it Done!* video lesson](../../../videos/get-it-done/user-task-relationship/) if you need a reminder of the process. Remember that you will have to drop and re-create tables after making these changes. While you're in the python session that does this, make sure to manually add a user to the database (since you lost all the records you added previously after dropping the tables).

2. Given what you learned about the MVC pattern, refactor your code accordingly:

    - **Model:**  Move the `User` and `Movie` classes to a file named `models.py`. Then refactor out the app and database configuration code to a file named `app.py`. Specifically, the `app.py` file will have these 7 lines:

    ```python
    from flask import Flask
    from flask_sqlalchemy import SQLAlchemy

    app = Flask(__name__)
    app.config['DEBUG'] = True      # displays runtime errors in the browser, too
    app.config['SQLALCHEMY_DATABASE_URI'] = 'mysql+pymysql://flicklist:MyNewPass@localhost:8889/flicklist'
    app.config['SQLALCHEMY_ECHO'] = True

    db = SQLAlchemy(app)
    ```

    - **View:** Your view code is already contained in your template files; no need to do anything further.
    - **Controller:** Now the code that remains in your `main.py` file is the controller code.
    - **Add import code:** You will need to import `db` from `app.py` in the `models.py` file in order for the code in that file to function. And now, in order for `main.py` to utilize the `User` and `Movie` classes, you will need to import them into `main.py`. Finally, you will need to import `app` and `db` from `app.py` into `main.py`.

3. When the user visits the `/` and `/ratings` pages showing the unwatched and watched movies, she still sees *everybody's* movies. Fix it so that she only sees *her own* unwatched and watched movies. Also, you'll need to change the code to add a movie to the watchlist so that you assign an `owner` to the `movie` object.

[get-the-code]: ../getting-the-code/
