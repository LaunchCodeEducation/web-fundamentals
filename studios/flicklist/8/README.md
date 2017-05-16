---
title: 'Studio: FlickList 8'
currentMenu: studios
---

This studio has a different structure than past Flicklist studios. Instead of watching an instructor-led walkthrough and then talking a problem on your own, you will work through a guided tutorial to add some new features to the application. This will allow us to work through some new components in a more structured way, learning as we go.

## Studio

Our app at this point has user accounts and login, but users are still collaboratively editing the same list of movies. We need to fix that:
    - We'll add an `.owner` relationship to the `Movie` class, so that each movie "belongs to" a specific user.
    - We will update the `/ratings` page so that a user only sees a list of movies of which she is the owner.

Today, we'll enable a persistent logged-in state. In other words, once a user logs in, we'll have a way to "remember" that they were previously authenticated. We'll do this with cookies.

### Checking Out the Studio code

Before getting the starter code for this studio, fetch updates from the main repository:

```nohighlight
$ git fetch origin
```

Your task today is to fill a few of the small holes we have left, and to implement the a new "recently watched movies" page.

Then, follow the [instructions for getting the code][get-the-code] in order to get the starter code for `studio8`.

Since last class featured on a walkthrough and no studio, spend a few minutes with the starter code to remind yourself what was added. That way, you'll be ready to jump right in.

### Your Tasks

Note that we are no longer littering your studio code with `TODO`s. We've still provided a branch with the walkthrough code solution in it, but from now on you will have the discretion of choosing more implementation details yourself.

1. **Fix the Index method**. When the user visits the home page, she still sees *everybody's* unwatched movies. Fix it so that she only sees her own movies. Instead of a SQL query, you will need to use ORM methods like `filter_by`. For an example to reference, look at what we did during Walkthrough in `MovieRatings.get` or visit [the docs for SQLAlchemy](https://www.sqlalchemy.org/), the ORM we are using for this project.

2. **Implement a "recently watched movies" page**. This will be a new page at `/recently-watched` where users can see a list of "trending" movies. Your goal will be to implement this so that it is the same for everyone, showing the most recently watched movies by *any* user. Make a new method `RecentlyWatchedMovies` along with a new route and template. Use your Jinja ninja skills to show the list of movies. Don't forget to add a link so users know how to find the page. Each list item should look something like this:

You may notice one fatal issue with our application. While we can log in and log out, movie data is still being shared among all users. Furthermore, if you're even more astute, you've noticed that user passwords are being stored in plain text in the database. We'll tackle both of these issues in the next two studios.

[get-the-code]: ../getting-the-code/
