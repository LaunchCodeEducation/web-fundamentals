---
title: "Displaying and Processing Forms in Flask"
currentMenu: videos
---

<div class="youtube-wrapper"><iframe width="776" height="437" src="https://www.youtube-nocookie.com/embed/Tr5IU5CpJho?rel=0" frameborder="0" allowfullscreen></iframe></div>

## Notes

As always, when staring to work on a Flask application, activate an appropriate virtual environment. Here, we do:

```nohighlight
$ source activate hello-flask
```

### Working with forms

- To create a form in a Python file, to be returned by a handler function in Flask, use triple-quotes `"""` to enclose strings that break across lines. This allows us to write large amounts of text (e.g. HTML) within a Python file.
- If this form is a global variable (i.e. it is defined outside of any function) then it can be used by multiple handler functions.
- By default, the `action` of a form is the same URL that the form is displayed at.
- By default, the `method` of a form is `GET`.
- The `name` attribute of a form element determines the key that will be used to pass the parameter to the server in the HTTP request. Thus, if an element has `name='first_name'` then the string `'first_name'` must be used to access the value of the form element on the server.

### Accessing request data

Accessing both `GET` and `POST` parameters within Flask requires the `request` object provided by Flask:

```python
from flask import request
```

#### Accessing GET request parameters

A query (or `GET` request) parameter can be accessed via `request.args`:

```python
form_value = request.args.get('param_name')
```

`GET` parameters are passed in the HTTP request as part of the URL. More specifically, they make up the query string--the portion after `?`--which looked like this in the lesson:

```nohighlight
http://localhost:5000/hello?first_name=Chris
```

Here, the query string is `?first_name=Chris`. If there were multiple query parameters, they would be separated by the `&` (ampersand) character.

```nohighlight
http://localhost:5000/hello?first_name=Chris&last_name=Bay
```

#### Accessing POST request parameters

To enable a handler function to receive `POST` requests, we must add a `methods` parameter to the `@app.route` decorator:

```python
@app.route('/path', methods=['POST'])
def my_handler():
    # request handling code
```

A `POST` parameter can be accessed via `request.form`:

```python
form_value = request.form['param_name']
```

### 405 - Method Not Allowed

An HTTP status of 405 - Method Not Allowed will be received if a resource/path is requested that doesn't accept requests using the given method (usually, `GET` or `POST`). This can be a common mistake when setting up a form to `POST` to a given path, but failing to configure the handler function to accept `POST` requests.

## Code

View the [final code](https://github.com/LaunchCodeEducation/hello-flask/tree/0b248600afdd34648c8b37ec866b0ca54dec9282) from this lesson
