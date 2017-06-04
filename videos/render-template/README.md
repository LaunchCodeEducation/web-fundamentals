---
title: "Using render_template"
currentMenu: videos
---

<div class="youtube-wrapper"><iframe width="776" height="437" src="https://www.youtube.com/embed/Q9XQlGmLkOw" frameborder="0" allowfullscreen></iframe></div>

In this lesson we introduce a shortcut to rendering Jinja2 templates, using Flask's `render_template` function. When you use this, you can eliminate a lot of the code that we have been using. This function works when you have a few common setup options in place, including putting your templates in the `templates/` directory and setting `autoescape=True`.

Here are the steps to using `render_template`:
1. Import it:
    ```python
    from flask import Flask, request, redirect, render_template
    ```
    This import of `render_template` *replaces* the need to construct the `template_dir` variable and create a template loader, as we did with the following code:
    ```python
    template_dir = os.path.join(os.path.dirname(__file__),
        'templates')
    jinja_env = jinja2.Environment(
        loader = jinja2.FileSystemLoader(template_dir), autoescape=True)
    ```
    Note that using `render_template` requires you to put your templates in a directory named `templates`, while our initial, more hands-on approach allowed us to specify where our templates are located.
2. Call `render_template`:
    ```python
    return render_template('hello_greeting.html', name=first_name)
    ```
    This call to `render_template` *replaces* the two calls below (using the `hello` function as an example):
    ```python
    template = jinja_env.get_template('hello_greeting.html')
    return template.render(name=first_name)
    ```

## References

- [flask.render_template](http://flask.pocoo.org/docs/0.12/api/#flask.render_template)
