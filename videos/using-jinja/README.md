---
title: "Using Jinja2 Templates in Flask"
currentMenu: videos
---

<div class="youtube-wrapper"><iframe width="776" height="437" src="https://www.youtube-nocookie.com/embed/exR1kxpd1cY?rel=0" frameborder="0" allowfullscreen></iframe></div>

## Notes

In this video we learn how to make our code more maintainable and encapsulated by removing the long strings of HTML from our `main.py` and putting them into templates. We will do this using a Python templating engine called [Jinja2](http://jinja.pocoo.org/docs/2.9/). Here are the steps we'll follow: 

1. `import os` and `import jinja2` in `main.py`
2. Create a directory named `templates` and then use `os` to make a new file system path to it that Jinja will use:
```python
template_dir = os.path.join(os.path.dirname(__file__), 'templates')
```
3. Initialize the Jinja templating environment: 
```python
jinja_env = jinja2.Environment(loader = jinja2.FileSystemLoader(template_dir))
```
4. Extract the HTML string in the variable `form` and put it in a newly created `hello_form.html` file in the `templates` directory.
5. In the `index` function, create a `template` variable that holds the template returned from Jinja's `get_template` function and then return the string that `template.render()` returns:
```python
def index():
    template = jinja_env.get_template('hello_form.html')
    return template.render()
```
6. Extract the HTML string that `hello` returns from `main.py` and put it in a newly created `hello_greeting.html` file in the `templates` directory. Be sure to add the proper doctype and head/body tags.
7. Repeat step 5 for the `hello` function, but this time pass an argument to `template.render` that matches a placeholder called `name` in the template itself:
```python
def hello():
    first_name = request.form['first_name']
    template = jinja_env.get_template('hello_greeting.html')
    return template.render(name=first_name)
```
8. Protect your code from malicious users by adding HTML escaping via Jinja's `autoescape=True` option:
```python
jinja_env = jinja2.Environment(loader = jinja2.FileSystemLoader(template_dir), autoescape=True)
```

<aside class="aside-note" markdown="1">
There is another, simpler way you can use Jinja2 in your Flask app. We wanted to show you first what goes on "behind the scenes" when you incorporate templates before showing you a shortcut. The shortcut is to use Flask's `render_template` function. When you use this, you can eliminate a lot of the code above. Here are the steps to using it:
1. Import it:
```python
from flask import Flask, request, redirect, render_template
```
This import statement *replaces* the code below:
```python
template_dir = os.path.join(os.path.dirname(__file__), 'templates')
jinja_env = jinja2.Environment(loader = jinja2.FileSystemLoader(template_dir))
```
2. Call `render_template`:
```python
return render_template('hello_greeting.html', name=first_name)
```
This call to `render_template` *replaces* these two calls (using the `hello` function as an example):
```python
template = jinja_env.get_template('hello_greeting.html')
return template.render(name=first_name)
```
</aside>

## Code

View the [final code](https://github.com/LaunchCodeEducation/hello-flask/blob/3ed07a3ff5fa8e90ae8aa3f6f28acc4a97e99afa/main.py) from this lesson.
