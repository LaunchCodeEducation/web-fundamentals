---
title: 'Studio: FlickList 8'
currentMenu: studios
---


## Walkthrough

Our app at this point has user accounts and login, but users are still collaboratively editing the same list of movies. We need to fix that:
    - We'll add a `.owner` field to the `Movie` class, so that each movie "belongs to" a specific user.
    - We will update the `/ratings` page so that a user only sees a list of movies of which she is the owner.


## Studio

Your task today is to fill a few of the small holes we have left, and to implement the a new "recently watched movies" page.

### Checking out the Studio code

Follow the [instructions for getting the code][get-the-code] in order to get the starter code for `studio8`.

### Your Tasks

Note that we are no longer littering your studio code with `TODO`s. We've still provided a branch with the walkthrough code solution in it, but from now on you will have the discretion of choosing more implementation details yourself.

1. **Fix the Index handler**. When the user visits the home page, she still sees *everybody's* unwatched movies. Fix it so that she only sees her own movies. Instead of a SQL query, you will need to use ORM methods like `filter_by`. For an example to reference, look at what we did during Walkthrough in `MovieRatings.get` or visit [the docs for SQLAlchemy](https://www.sqlalchemy.org/), the ORM we are using for this project.

2. **Implement a "recently watched movies" page**. This will be a new page at `/recently-watched` where users can see a list of "trending" movies. Your goal will be to implement this so that it is the same for everyone, showing the most recently watched movies by *any* user. Make a new method `RecentlyWatchedMovies` along with a new route and template. Use your Jinja ninja skills to show the list of movies. Each list item should look something like this:

    > <strong>Jesse</strong> watched <strong>The Big Green</strong> and gave it a rating of <strong>*****</strong> stars.

[get-the-code]: ../getting-the-code/
