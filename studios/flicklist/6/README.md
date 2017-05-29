---
title: 'Studio: FlickList 6'
currentMenu: studios
---

In this studio we will build persistence into our app. Finally, our hypothetical user will be able to add a new movie to the list, close the window and go eat a sandwich, forget what movie she wanted to watch, and then come running back to our site, and the same movie will still be faithfully sitting in her list so she can go stream it on our other awesome website, FlicksNet.

We'll start using a term and associated acronym that is common when connecting applications to databases: **object-relational mapping (ORM)**. Applications store information in the form of *objects* and databases store data in the form of *relational data* (tables). An ORM library or module will often do much of the heavy lifting for us, when it comes to translating back and forth between these differing contexts.

## Walkthrough

Our first batch of changes will add code support our chosen ORM implementation, called SQLAlchemy. It'll teach SQLAlchemy about a new class we're making, called `Movie`, and lastly we'll hack our application so it can also be run as a type of library. This first branch of changes is in the branch `walkthrough6a`, and you can see the differences from last time in the shell by typing `git diff walkthrough6 walkthrough6a`, or by [viewing them on github](https://github.com/LaunchCodeEducation/flicklist-flask/compare/walkthrough6...walkthrough6a).

The most powerful line in this whole batch of changes is this:
```
def getCurrentWatchlist():
    return [movie.name for movie in Movie.query.all()]

```
In order to make this work, we've got to have a movie table in our database. We'll do this through the python shell. We've trotted out the Python idiom of `if __name__ == "__main__":` to prevent `app.run()` from running when we load `main.py` as a module, now we can now safely import symbols from `main.py`:
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

- Adding movies to the watchlist isn't *persistent* - if we type in a name and click *Add it*, then go back and reload, nothing has changed.
- Clicking on *I Watched It!* makes no persistent changes, either.
- Rating movies isn't persistent.

Today we will change all these to be persistent. We'll walk through the first two together, then you'll handle the last one on your own.

### A List of Movie Instances

Our next change is going to be a massive breaking change to our application. Up until now, we've been representing movies as strings of their names. The time has come to represent movies as instances of Movie. This will rip through our application, breaking lots of stuff. We'll rename lots of variables so it's clear when we're talking about Movies, and when we're talking about movie names. Follow along by either doing `git diff walkthrough6a walkthrough6b` or by [viewing the diffs on github](https://github.com/LaunchCodeEducation/flicklist-flask/compare/walkthrough6a...walkthrough6b)

```python
def getCurrentWatchlist():
    # old: list of strings
    return [movie.name for movie in Movie.query.all()]

def getCurrentWatchlist():
    # new: list of Movie instances
    return Movie.query.all()
```

Notice how we have to rework templates to call `movie.name` when we want a human-readable version of the movie name, and `movie.id` when we want to reference a specific row in our movie table.

In this batch of changes, we've changed our most important data structure - movies - and we've made it possible to add movies to the watch list from the web browser. Hooray! Cool stuff! The world is our oyster.

### Watching Movies

In the next batch of changes, we'll modify the *I Watched It!* button to change the database, and truly cross off the movie in the database, persistently. You can view them by running the command `git diff walkthrough6b walkthrough6-solution` or by [viewing the diffs on github](https://github.com/LaunchCodeEducation/flicklist-flask/compare/walkthrough6b...walkthrough6-solution). We also finish our transition from strings to Movies by modifying the ratings templates.


## Studio

Now that we have some database functionality wired into our application, let's continue to convert our app to use the database. Our next task is to implement persistent ratings, so a user can rate a movie and the information is stored in the database for later.

### Checking out the Studio code

Follow the [instructions for getting the code][get-the-code] in order to get the starter code for `studio6`.

You should have already installed MAMP locally but if you need a refresher it is in [Class 8 Prep Work](/class-prep/8).

### Your Tasks

1. Create mysql user and database
2. Install conda packages
3. Initialize your database
4. Run the existing flicklist
5. Modify flicklist to store movie ratings

### Create mysql user and database

Now we will need to create a database locally (on your computer). We will use the same names as we did in the walkthrough. Go to phpMyAdmin in your browser and create a user named *flicklist* with the password *MyNewPass*. Check the box that says *Create database with same name and grant all privileges* then press the *Go* button in the bottom right-hand corner.

![Create User And Database in phpMyAdin](phpMyAdminCreateUserAndDatabase.png)

### Install conda packages

Make sure your flask environment is activated before installing.

```nohighlight
(flicklist) $ conda install -c conda-forge flask-sqlalchemy
(flicklist) $ conda install pymysql
```

### Initialize your database

Reenact the python shell session from the walkthrough. Here it is again:
```
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

### Run the existing flicklist

Make sure your flask environment is activated and fire up your server first `$ python main.py`. In your browser, add one movie then cross it off.

### Modify flicklist to store movie ratings

- Change `main.py`'s Movie model to have a ratings column.
- Drop the table through phpMyAdmin, so you can make an incompatible change
- Reinitialize your database by reenacting the python shell session from the walkthrough again
- Change `main.py`s behavior when a user rates a movie - actually store the rating
- Display the ratings on the ratings page by pre-populating the select box with their old rating

### Give yourself a hand

If you made it this far, you've completed a challenging studio. Congratulations!  And if you don't get it right away, don't give up. Keep on trying: be *persistent*!


<aside class="aside-note" markdown="1">
If you want to test your queries in the mysql console, you can do so in the phpMyAdmin interface. Go to the left tab and click on the database name *flicklist* then on the second-to-top row tab click *SQL*.
<br/>
For those of you accustomed to accessing this via the command line, you will need to specify which mysql to use with a command like:
```
/Applications/MAMP/Library/bin/mysql -uflicklist -p
```
</aside>

[get-the-code]: ../getting-the-code/
