---
title: "Get It Done! Part 2: Database Configuration"
currentMenu: videos
---

<div class="youtube-wrapper"><iframe width="776" height="437" src="https://www.youtube-nocookie.com/embed/-bvlj_3Im6s?rel=0" frameborder="0" allowfullscreen></iframe></div>

## Notes

Begin by starting MAMP, starting the servers, and going to phpMyAdmin.

Now we'll create a new user and database for our *Get It Done!* application. A good design principle is that for each application you have one database, for each database, one user. This keeps privileges and permissions separated across applications. You can review the basic steps in written form [here](../../../studios/databases/2/#database-setup).

If you don't already have `flask-env` activated, activate it now. Then run:

```nohighlight
conda install -c conda-forge flask-sqlalchemy
```

After this installation completes, run the following:

<aside class="aside-warning" markdown="1">
Windows Git Bash users will need to deactivate `flask-env` and close their terminal, then open a new Git Bash terminal, navigate to this directory, and activate `flask-env` again before proceeding to use the install command below.    
</aside>

```nohighlight
conda install pymysql
```

<aside class="aside-warning" markdown="1">
And again it is advisable for Windows Git Bash to close their terminal, then open a new Git Bash terminal, navigate to this directory and activate `flask-env` before continuing.  
</aside>

Now, amend your `main.py` by adding the following four lines:

```python
from flask_sqlalchemy import SQLAlchemy 
```

```python
# Note: the connection string after :// contains the following info:
# user:password@server:portNumber/databaseName

app.config['SQLALCHEMY_DATABASE_URI'] = 'mysql+pymysql://get-it-done:beproductive@localhost:8889/get-it-done'
```

<aside class="aside-pro-tip" markdown="1">
Two primary sources of bugs when running an application using a database are:
1. The database is not running.
2. The connection string is not correct.

So if your application isn't working, be sure to check that you've started the MySQL server and that you have the correct information (especially port number, user and password) in the connection string!    
</aside>

```python
app.config['SQLALCHEMY_ECHO'] = True
```

```python
db = SQLAlchemy(app)
```

Next we'll continue modifying `main.py` and create a persistent class for database data: 

```python
class Task(db.Model):

    id = db.Column(db.Integer, primary_key=True)
    name = db.Column(db.String(120))

    def __init__(self, name):
        self.name = name
```

Be sure to shield `app.run` by enclosing it in an `if` condition:

```python
if __name__ == '__main__':
    app.run()
```

Back in the terminal, start a python shell by running the command `python`. Then import `db` and create the tables:

```nohighlight
> from main import db,Task
> db.create_all()
```

Now run the following commands one at a time to add data to the database:

```nohighlight
>>> new_task = Task('finish ORM lesson 2')
>>> db.session.add(new_task)
>>> another_task = Task('post lesson video')
>>> db.session.add(another_task)
>>> db.session.commit()
```

To get data from the database, run the following:
```nohighlight
>>> tasks = Task.query.all()
>>> tasks[0].name
```

## Code

View the [final code](https://github.com/LaunchCodeEducation/get-it-done/tree/7e8a99b421e8c1564c65de1ef30865c64e708e6d) for this lesson.

## References

- [SQLAlchemy](http://www.sqlalchemy.org/)
- [Flask SQLAlchemy](http://flask-sqlalchemy.pocoo.org/2.1/)
