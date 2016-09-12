# Class 11

Thus far, our webapp does not have a concept of user accounts built in. As a result, there is only one communal movie list, and all the users who visit our site work collaboratively on that list. That's kind of cool maybe, but our goal is a site where each user manages her own list, without interference from other users. That is exactly what we will do today!

## Walkthrough 11

Today's Walkthrough starts with a significant amount of new code already written. At a high level, what the new code does is implement the existence of user accounts and registration, and ensure that users cannot see the main pages of the site unless they are logged in.

That's a lot! We would have liked to write this code during the Walkthrough itself, but there is not enough time. Luckily, your upcoming Assignment will give you a similar chunk of starter code, so you won't be expected to write all this code yourself. 

Here is the agenda:

- We will spend a little time going over the new pieces of code:
    - a `User` class to represent and save users in our database
    - new routes and handlers: `Login`, `Logout`, and `Registration`
    - some new helper functions in our base parent `Handler` class
    - some more lower-level helper functions in a separate file called `hashutils.py`
- Next we will start coding. Our app at this point has user accounts and login, but users are still collaboratively editing the same list of movies. We need to fix that:
    - We'll add a `.owner` field to the `Movie` class, so that each movie "belongs to" a specific user.
    - We will update the `/ratings` page so that a user only sees a list of movies of which she is the owner.
- We will also start to implement a new page, `/recently-watched`, where users can see a list of "trending" movies, showing the most recent movies that people have been watching. Unlike the other page, this will not be individualized. It will be the same for everyone, showing the most recently watched movies by *any* user.


## Studio 11 

Your task today is to fill a few of the small holes we have left, and to finish implementing the new "recently watched movies" page that we started during Walkthrough.

Below are 5 tasks. Most are just one or two lines of code, but the last one is a bit more involved.

1. **Fix the Index handler**. When the user visits the home page, she still sees *everybody's* unwatched movies. Fix it so that she only sees her own movies. Instead of a `GqlQuery`, you will need to use ORM methods like `all` and `filter`. For an example to reference, look at what we did during Walkthrough in `MovieRatings.get`.

2. **Add a Logout link**. The user needs a way of logging out when she is logged in. Simply add another link to our "navigation menu" at the top of `base.html`

3. **Add a route for recently watched movies**. This is the first of three tasks involved in finishing the implementation of the "recently watched movies" page. First, simply add to our app another route that hooks up to the `RecentlyWatchedMovies` handler we started during Walkthrough.

4. **Render the template**. Our current implementation simply responds with a raw string containing the titles of all the movies. Let's return some real HTML. Notice that we have created a new template called `recently-watched.html`. Edit the `RecentlyWatchedMovies.get` method so that it renders that template. Make sure you pass the list of movies into the template.

5. **Implement the template**. Currently the template simply renders a header. Use your `Jinja` ninja skills to show the list of movies. Each list item should look something like this:
    <ul><li>
        <strong>Jesse</strong> watched <strong>The Big Green</strong> and gave it a rating of <strong>*****</strong> stars.
    </li></ul>
