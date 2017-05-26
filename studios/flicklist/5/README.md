---
title: 'Studio: FlickList 5'
currentMenu: studios
---

You have started to learn about databases, but you haven't yet seen how to incorporate them into an app. So today, we'll simply add a few features onto our project, and get everything teed up for the next studio, when we will finally start persisting user data in a database.

Today we will introduce a second list view, representing the movies that the user has watched (crossed off). In this second view, users will be able to give each movie a rating between 1 and 5 stars.

There is no walkthrough portion of this studio. We leave each of these features to you to add.

## Studio

### Checking out the Studio code

Follow the [instructions for getting the code][get-the-code] in order to get the starter code for `studio5`.

### Your Tasks

* Modify "My Watchlist" so that you eliminate the need for the "crossoff" form in `edit.html`. Now, next to every list item/movie listed in "My Watchlist" you should display a button that says "I Watched it!". Clicking the button will result in a confirmation message that the movie has been watched. So you'll need to add a form within the `<li>` tags of "My Watchlist":
  ```html
  <form action="/crossoff" method="post">
    {{ movie }}
    <input type="hidden" name="crossed-off-movie" value="{{ movie }}"/>
    <input type="submit" value="I Watched it!"/>
  </form>
  ```
Be sure to delete the "crossoff" form from `edit.hmtl` when you have completed this particular task.

* Implement the feature where users can rate the movies they have watched.

  1. Make a `ratings.html` template which is an index of all movies that have been watched and are available to rate. Add forms for rating movies, one on each list item in the `ratings.html` template. This will also require you to create:
    - A handler function, `movie_ratings`, to handle a `get` request and render the template at `/ratings`
    - A function, `get_watched_movies`, to get the list of crossed off movies. For now, create a hard-coded list with a few movie titles. We'll update this to pull from a database in the next studio.
  2. Make a `rating-confirmation.html` template, to be displayed when the user rates a movie they have crossed off.
    - You will also need to create a `rate_movie` function that handles a post request on `/rating-confirmation` and renders the `rating-confirmation` template.

[400errors]: https://en.wikipedia.org/wiki/List_of_HTTP_status_codes#4xx_Client_Error
[get-the-code]: ../getting-the-code/
