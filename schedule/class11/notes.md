# Class 11 Notes

## Before Walkthrough 11

- a ton of new stuff, infrastructure for user accounts
  - `User` model
    - just two fields, username and password hash
  - `hashutils.py`, a bunch of helper functions for hashing and salting stuff
  - Add more methods to the base `Handler` class
    - helpers for logging in and out and managing cookies
    - the `initialize` method, which comes from the parent class `webapp2.RequestHandler`. We use it to create a login wall around any pages that require login.
  - Registration
    - `/registration` route and `Registration` handler
    - the handler is kind of complicated, has a bunch of helpers for veryifying password and such
  - Login / Logout
    - `/login` route and `Login` handler
    - `/logout` route and `Logout` handler

## During Walkthrough 11
  - First, we definitely do want to spend a little time going over the changes listed above.
  - Integrate "user accounts" concept into the the rest of the app
    - Add `owner` field to the `Movie` class
    - Update the `AddMovie` handler 
      - When the new movie object is created, set its `.owner` to the current user
    - Update the `MovieRatings` handler
      - When querying for watched movies, we need to filter for only the movies that belong to the currently logged-in user. We switch from using `GqlQuery("SELECT ... ")` to using ORM methods `all()` and `filter()`. I chained a few such method calls together into one line, but you might want to break it up into a few lines for clarity.
    - Update `Index` handler
      - Actually, don't. Talk about how we are leaving a small hole for the students to fill during studio: namely, don't update the database query. So visiting `/` will still show a list of *everyone's* movies combined. The student will need to filter the query so that the user only sees their own movie list. 
  - Start to create another page at `/recently-watched` which will show the most recent ratings of *everyone* combined
    - Add `datetime_watched` field to `Movie` object
      - Need to do an import: `from datetime import datetime`
    - Update the `WatchedMovie` handler:
      - A movie has been watched, so set its `datetime_watched` field to `datetime.now()`
    - Create new handler `RecentlyWatchedMovies`
      - Implement `RecentlyWatchedMovies.get`. Query for all the watched movies, and sort by `datetime_watched`. Then run the query, but limit the result-set to 20 items.
      - Display the titles of the movies in a rudimentary way, without using a template (student will have to do that).
      - Leave a few other holes: 
        - Dont wire in the new `/recently-watched` route
        - Don't implement the template
  
## During Studio 11
  1. Fill the hole from walkthrough on the `Index` handler: replace the old GQL query with a new ORM query that only gives back the unwatched movies of *the current user*.
  2. Add a navigation link in `base.html` so that a logged-in user can log out.
  3. Add the `/recently-watched` route to your app
  4. In `RecentlyWatchedMovies.get` render the `recently-watched.html` template.
  5. Actually implement the `recently-watched.html` template.
