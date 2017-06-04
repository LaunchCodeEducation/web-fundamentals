---
title: "Get It Done! Part 3: Using Persistent Classes in Flask"
currentMenu: videos
---

<div class="youtube-wrapper"><iframe width="776" height="437" src="https://www.youtube-nocookie.com/embed/fDFeQCE48dY?rel=0" frameborder="0" allowfullscreen></iframe></div>

## Notes

In this lesson we'll refactor the Python and HTML in our *Get It Done!* app to use the database we just set up.

### Refactor to Use `Task` Object

First remove these two lines from your `main.py`: `tasks = []` and `tasks.append(task)`. Then amend `todos.html` by changing `<li>` as follows: `<li>{{task.name}}</li>`.

Now alter the `index` function as follows:
```python
    if request.method == 'POST':
        task_name = request.form['task']
        new_task = Task(task_name)
        db.session.add(new_task)
        db.session.commit()

    tasks = Task.query.all()
```

### Delete Data from Database

Add a form under the `<li>` in `todos.html` to make a `POST` request:

```HTML
    <form action="/delete-task" method="POST" style="display:inline-block;">
        <input type="hidden" name="task-id" value="{{task.id}}" />
        <input type="submit" value="Done!" />
    </form>
```

Make a new request handler for `/delete-task`:

```python
@app.route('/delete-task', methods=['POST'])
def delete_task():

    task_id = int(request.form['task-id'])
    task = Task.query.get(task_id)
    db.session.delete(task)
    db.session.commit()

    return redirect('/')
```

## Code

View the [final code](https://github.com/LaunchCodeEducation/get-it-done/tree/14292936bd94ac16825632ee3b14ed6fa6154e64) for this lesson.
