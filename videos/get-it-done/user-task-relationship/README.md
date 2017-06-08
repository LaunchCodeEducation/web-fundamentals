---
title: "Get It Done! Part 9: The User-Task Relationship"
currentMenu: videos
---

<div class="youtube-wrapper"><iframe width="776" height="437" src="https://www.youtube-nocookie.com/embed/rTUnjM7HaVg?rel=0" frameborder="0" allowfullscreen></iframe></div>

## Notes

In this lesson we make the connection between user objects and task objects. Each user has (potentially) many task objects, therefore we want to think about this relationship in terms of one-to-many. To move our application in this direction, we'll take the following steps:

- Refactor the `Task` class so that it has an `owner_id` property and takes an `owner` as an argument to its constructor:

    ```python
    class Task(db.Model):

    id = db.Column(db.Integer, primary_key=True)
    name = db.Column(db.String(120))
    completed = db.Column(db.Boolean)
    owner_id = db.Column(db.Integer, db.ForeignKey('user.id'))

    def __init__(self, name, owner):
        self.name = name
        self.completed = False
        self.owner = owner
    ``` 

- Specify that a user has many tasks and you want SQLAlchemy to look for matches between the two by adding this line in the `User` class:
   
    ```python
     tasks = `db.relationship('Task', backref='owner')`
     ```

- Since we've changed our model classes, we'll need to drop and create our tables again (using the Python shell commmands that should be familiar by now). Then create a user and a task object/record in the shell. If you need a reminder of this process, review the second and third bullet items [here](../../../studios/flicklist/6/#modify-flicklist-to-store-movie-ratings).

- In the `POST` handler of the `index` function, add code to get the owner of the task so that you can pass that into the `Task` constructor. Also, you'll want to modify the code so that it only grabs tasks from the database that belong to the current user:

    ```python
    @app.route('/', methods=['POST', 'GET'])
    def index():

        owner = User.query.filter_by(email=session['email']).first()

        if request.method == 'POST':
            task_name = request.form['task']   
            new_task = Task(task_name, owner)
            db.session.add(new_task)
            db.session.commit()

        tasks = Task.query.filter_by(completed=False,owner=owner).all()
        completed_tasks = Task.query.filter_by(completed=True,owner=owner).all()
        return render_template('todos.html', title="Get It Done!", 
            tasks=tasks, completed_tasks=completed_tasks)
     ```

Congratulations! You've learned the basics of creating web apps! What you've learned so far will allow you to write many cool programs. And as we add more skills to our coding repertoire in the next few classes, you'll take your web dev skills to the level of a beginning professional.

## Code

View the [final code](https://github.com/LaunchCodeEducation/get-it-done/tree/d979a9991347431023d41abdd93891aedafc1f93) for this lesson.

## References

- [One-to-Many Relationship in Flask-SQLAlchemy](http://flask-sqlalchemy.pocoo.org/2.1/models/#one-to-many-relationships)
- [Creating and Dropping Tables](http://flask-sqlalchemy.pocoo.org/2.1/binds/#creating-and-dropping-tables)
