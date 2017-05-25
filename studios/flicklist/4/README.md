---
title: 'Studio: FlickList 4'
currentMenu: studios
---

In this studio we will finally cast aside those cumbersome, error-prone HTML strings that are littering our `main.py` file, refactoring our code to use templates.

## Walkthrough

In today's walkthrough, we will do most of the work of switching our project to use templates:

- We will import `render_template` which will allow us to use `jinja2`, a templating engine.
- We will create a bunch of `.html` files to hold our content.
- In our request methods, we will render those templates into our HTTP response!

In the process, we will talk about:

- How to leave a "blank space" in your template for data to be inserted dynamically (e.g. the name of the movie the user wants to add).
- How to insert the data once we know what it is.
- We will also see the Jinja syntax for doing a few additional, important things:
    - How to loop over a list of items in a template.
    - How to write a conditional statement in a template.

## Studio

For studio, you will finish up our refactoring so that we have fully migrated our entire web-app away from using ugly strings of HTML, and into the bright, shiny era of using templates instead.

### Checking out the Studio code

Follow the [instructions for getting the code][get-the-code] in order to get the starter code for `studio4`.

### Your Task

If you visit the web-app in your browser, you will find that the `/add` route is broken! Try typing in a movie and submitting the form, and you will encounter a "Confirmation Message Under Construction..." message.

Your job is to get this page back up and running. The user should still see the same confirmation message as before:

> The Matrix has been added to your Watchlist.

Of course, there is one caveat: you are required to use a template. Your `main.py` file should not contain any HTML at all!

1. Create a file named `add-confirmation.html` inside your `/templates` directory, and add whatever HTML content needs to be added.
2. In your `add_movie` function, use your template to render the response.

For reference, you can look at our code at the bottom of the `crossoff_movie` function, which renders the `templates/crossoff.html` template file (in addition to the header and footer templates).


[get-the-code]: ../getting-the-code/
