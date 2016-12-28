---
title: 'Studio: FlickList 8'
currentMenu: studios
---


## Walkthrough

Our app at this point has user accounts and login, but users are still collaboratively editing the same list of movies. We need to fix that:
    - We'll add a `.owner` field to the `Movie` class, so that each movie "belongs to" a specific user.
    - We will update the `/ratings` page so that a user only sees a list of movies of which she is the owner.
- We will also start to implement a new page, `/recently-watched`, where users can see a list of "trending" movies, showing the most recent movies that people have been watching. Unlike the other page, this will not be individualized. It will be the same for everyone, showing the most recently watched movies by *any* user.


## Studio

Your task today is to fill a few of the small holes we have left, and to finish implementing the new "recently watched movies" page that we started during Walkthrough.

### Checking out the Studio code

Follow the [instructions for getting the code][get-the-code] in order to get the starter code for `studio8`.

### Your Tasks

Below are 5 tasks. Most are just one or two lines of code, but the last one is a bit more involved.

1. **Fix the Index handler**. When the user visits the home page, she still sees *everybody's* unwatched movies. Fix it so that she only sees her own movies. Instead of a `GqlQuery`, you will need to use ORM methods like `all` and `filter`. For an example to reference, look at what we did during Walkthrough in `MovieRatings.get`.

2. **Add a Logout link**. The user needs a way of logging out when she is logged in. Simply add another link to our "navigation menu" at the top of `base.html`

3. **Add a route for recently watched movies**. This is the first of three tasks involved in finishing the implementation of the "recently watched movies" page. First, simply add to our app another route that hooks up to the `RecentlyWatchedMovies` handler we started during Walkthrough.

4. **Render the template**. Our current implementation simply responds with a raw string containing the titles of all the movies. Let's return some real HTML. Notice that we have created a new template called `recently-watched.html`. Edit the `RecentlyWatchedMovies.get` method so that it renders that template. Make sure you pass the list of movies into the template.

5. **Implement the template**. Currently the template simply renders a header. Use your Jinja ninja skills to show the list of movies. Each list item should look something like this:
    <ul><li>
        <strong>Jesse</strong> watched <strong>The Big Green</strong> and gave it a rating of <strong>*****</strong> stars.
    </li></ul>

[get-the-code]: ../getting-the-code/
