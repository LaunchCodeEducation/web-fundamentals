---
title: 'Studio: Flicklist 5'
currentMenu: studios
---

You have started to learn about databases, but you haven't yet seen how to incorporate them into an app. So today, we'll simply add a few features onto our project, and get everything teed up for next class, when we will finally start persisting user data in a database.

Today we will expand our project so that users can actually view their list of movies. We will also introduce a second list view, representing the movies that the user has watched (crossed off). In this second view, users will be able to give each movie a rating between 1 and 5 stars.

## Walkthrough

Between the last studio and this one, we have modified our application in a few minor ways.

- Responding to bad requests with a 400 error
	- We don't bother giving a nice error message to a malicious user that submits a bad request, such as a request to cross off a movie that doesn't exist in our system. Instead, we send back an [HTTP 400 status code][400errors] and a very brief error message. We'll use this pattern going forward, only resonding to errors with helpful messages when it's the case that a well-meaning user made a mistake.
- We have changed "cross off" semantics to "watched it" semantics. Instead of "crossing off a movie from your list", user is reporting that they "finished watching" that movie
	- Rename `CrossOffMovie` handler to `WatchedMovie`, change route to `"/watched-it"`
	- Change a bunch of variable names in `WatchedMovie.post` method and the `edit.html` template
	- Change the confirmation template to `watched-it-confirmation.html`
	- Change name of `getCurrentWatchlist()` function to `getUnwatwchedMovies()`

During the walkthrough, we will implement these features:

* A listing on the main page to display all unwatched movies.
* Modify the "wathced-it" form so that instead of a dropdown, a button on each list item is displayed. Clicking the button will result in a confirmation message that the movie has been watched.
* New list view for movies that have been watched. This will require us to create a new method `getWatchedMovies()` to return a (for now) hard-coded list of watched movies.

## Studio

### Checking out the Studio code

Follow the [instructions for getting the code][get-the-code] in order to get the starter code for `studio5`.

### Your Task

Implement the feature where users can rate the movies they have watched.

1. Make a confirmation template, to be displayed when the user rates a movie.
2. Add a handler for form submission so that it renders the template. This should got in a `post` method in the `MovieRatings` handler class.
3. Add forms for rating movies, one on each list item in the `ratings.html` template

[400errors]: https://en.wikipedia.org/wiki/List_of_HTTP_status_codes#4xx_Client_Error
[get-the-code]: ../getting-the-code/
