---
title: 'Studio: FlickList 6'
currentMenu: studios
---

In this studio we will build persistence into our app. Finally, our hypothetical user will be able to add a new movie to the list, close the window and go eat a sandwich, forget what movie she wanted to watch, and then come running back to our site, and the same movie will still be faithfully sitting in her list so she can go stream it on our other awesome website, FlicksNet.

We'll start using a term and associated acronym that is common when connecting applications to databases: **object-relational mapping (ORM)**. Applications store information in the form of *objects* and databases store data in the form of *relational data* (tables). An ORM library or module will often so much of the heavy lifting for us, when it comes to translating back and forth between these differing contexts.

## Walkthrough

Our first batch of changes will add code support our chosen ORM implementation, called SQLAlchemy. It'll teach SQLAlchemy about a new class we're making, called 'Movie', and lastly we'll hack our application so it can also be run as a type of library. This first bratch of changes is in the branch `walkthrough6a`, and you can see the differences from last time in the shell by typing `git diff walkthrough6 walkthrough6a`, or by [viewing them on github](https://github.com/LaunchCodeEducation/flicklist-flask/compare/walkthrough6...walkthrough6a).

The most powerful line in this whole batch of changes is this:
```
def getCurrentWatchlist():
    return [movie.name for movie in Movie.query.all()]

```
In order to make this work, we've got to have a movie table in our database. We'll do this through the python repl. We've trotted out the Python idiom of `if __name__ == "__main__":` to prevent `app.run()` from running when we load `main.py` as a module, now we can now safely import symbols from `main.py`:
```nohighlight
(flicklist) $ python
>>> from main import db, Movie
/home/dm/miniconda3/envs/flicklist/lib/python3.6/site-packages/flask_sqlalchemy/__init__.py:839: FSADeprecationWarning: SQLALCHEMY_TRACK_MODIFICATIONS adds significant overhead and will be disabled by default in the future.  Set it to True or False to suppress this warning.
>>> db.create_all()
>>> db.session.add(Movie('Mulan'))
>>> db.session.add(Movie('Rushmore'))
>>> db.session.add(Movie('Damsels in Distress'))
>>> db.session.commit()
>>> Movie.query.all()
[<Movie 'Mulan'>, <Movie 'Rushmore'>, <Movie 'Damsels in Distress'>]
 		 
```

Now if we fire up our app and view it, we see those movies in our watchlist! Yeah!

Let's play with the app though and inventory what needs to be done. 

- If we click on *I Watched It!*, and the return to the root and reload, that movie is still on our watchlist. The change isn't *persistent*
- Similarly, adding movies to watchlist isn't persistent
- Lastly, rating movies isn't persistent.

We'll walk through the first two together, then you'll handle the last one on your own. 


__________

During the walkthrough, we will lay the groundwork for storing data, and begin to adapt our app to use data from the database. Here are some of the tasks that will be carried out.

- Import the `db` class from the `google.appengine.ext` module
- Create `Movie` model object
  - with `db` properties `title`, `watched`, `rating` and `created` (actually not creating rating and created - save rating for their half)
- On `AddMovie` handler, create a movie object, and use `put` ORM method to save it to the datastore
  - From the admin panel, observe that it was indeed saved
  - By hitting Reload on the main page, observe that it was indeed saved

- On `Index` handler, don't use `getUnwatchedMovies()` function. Instead use a GqlQuery on the database
  - Result should be one item in the list, but with no title. Why not? Gotta go to the `frontpage.html` template and adjust to use `movie.title` instead of just `movie`.
- Implement persistant "watching"
  - In the `WatchedMovie` handler, update `movie.watched` property to `True`
  - On the `frontpage.html` template, use `movie.key().id()` as the value for each hidden input


Build some movies in the table:

```
(flicklist) dm@black walkthrough6 ~/edu/flicklist-flask$ python
Python 3.6.1 |Continuum Analytics, Inc.| (default, Mar 22 2017, 19:54:23) 
[GCC 4.4.7 20120313 (Red Hat 4.4.7-1)] on linux
Type "help", "copyright", "credits" or "license" for more information.
>>> from main import db, Movie
/home/dm/miniconda3/envs/flicklist/lib/python3.6/site-packages/flask_sqlalchemy/__init__.py:839: FSADeprecationWarning: SQLALCHEMY_TRACK_MODIFICATIONS adds significant overhead and will be disabled by default in the future.  Set it to True or False to suppress this warning.
  'SQLALCHEMY_TRACK_MODIFICATIONS adds significant overhead and '
>>> db.session.add(Movie('Mulan'))
>>> db.session.add(Movie('Rushmore'))
>>> db.session.add(Movie('Damsels in Distress'))
>>> db.session.commit()
>>>
```


## Studio

Now that we have some database functionality wired into our application, let's continue to convert our app to use the database. Our next task is to implement persistent ratings, so a user can rate a movie and the information is stored in the database for later.

### Checking out the Studio code

Follow the [instructions for getting the code][get-the-code] in order to get the starter code for `studio6`.

### Your Tasks

1. In `MovieRatings.get` write a GQL query to select all the movies that have been watched
  - Extra credit: sort by creation date (most recent first).
2. In `MovieRatings.post`, use the `Movie.get_by_id` ORM method to find the movie with the id specified by the form submission.
3. In `MovieRatings.post`, update the movie's rating to the new rating specified by the form submission.
4. In `rating-confirmation.html`, update the code so that it still works now that it is being given a movie *object*.

<aside class="aside-note" markdown="1">
If you want to test your queries in the mysql console, you can do so in the phpmyadmin interface. Go to the left tab and click on the database name *flicklist* then on the second-to-top row tab click *SQL*.
<br/>
For those of you accustomed to accessing this via the command line, you will need to specify which mysql to use with a command like:
```
/Applications/MAMP/Library/bin/mysql -uflicklist -p
```
</aside>

[get-the-code]: ../getting-the-code/
