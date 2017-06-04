---
title: "Get It Done! Part 4: Changing a Model Class"
currentMenu: videos
---

<div class="youtube-wrapper"><iframe width="776" height="437" src="https://www.youtube-nocookie.com/embed/UmCRcjKIqps?rel=0" frameborder="0" allowfullscreen></iframe></div>

## Notes

In this lesson we'll improve the delete functionality of our app so that it uses a boolean flag to determine whether a task is completed or not, thus leaving the task in our database. This will allow us to also add a display for completed tasks.

### Improve Delete Functionality

Add a boolean property to the `Task` class and set it to `False` in the constructor:

```python
    completed = db.Column(db.Boolean)

    def __init__(self, name):
        self.name = name
        self.completed = False
```
Now fire up the Python shell in your terminal. You're going to drop and then re-create the table. **Note:** you will lose the data in the table:

```nohighlight
>>> db.drop_all()
>>> db.create_all()
```

<aside class="aside-pro-tip" markdown="1">
If you want to make a change to your model class and database structure without losing all your data, you can use [Flask-Migrate](https://flask-migrate.readthedocs.io/en/latest/). 
</aside>

Back in `main.py` remove the code that deleted a task, and instead set its boolean value to `True`:

```python
@app.route('/delete-task', methods=['POST'])
def delete_task():

    task_id = int(request.form['task-id'])
    task = Task.query.get(task_id)
    task.completed = True
    db.session.add(task)
    db.session.commit()

    return redirect('/')
```

Amend the `index` function so that it only gets tasks where the property `completed` has a value of `False`:

```python
    tasks = Task.query.filter_by(completed=False).all()
```

### Display Completed Tasks

Add a variable to hold the completed tasks and pass this into the template:

```python
    completed_tasks = Task.query.filter_by(completed=True).all()
    return render_template('todos.html', title="Get It Done!", 
        tasks=tasks, completed_tasks=completed_tasks)
```

Create the HTML in the `todos.html` template to display the list of completed tasks:

```HTML
    <hr />
    <h2>Completed</h2>
    <ul>
        {% for task in completed_tasks %}
        <li>{{task.name}}</li>
        {% endfor %}
    </ul>
```

## Code

View the [final code](https://github.com/LaunchCodeEducation/get-it-done/tree/52ec146dc2f9943a011dd46d4a546b75703c226f) for this lesson.
