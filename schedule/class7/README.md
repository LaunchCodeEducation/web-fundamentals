# Class 7

Welcome to Class 7!

Today we will finally cast aside those cumbersome, error-prone HTML strings that are littering our `main.py` file.

Instead, we will refactor our code to use templates.

## Walkthrough

In today's walkthrough, we will do most of the work of switching our project to use templates:

- We will import a new library called `jinja2`, a templating engine.

- We will create a bunch of `.html` files to hold our content.

- In our request handlers, we will render those templates into our HTTP response!

In the process, we will talk about:

    - How to leave a "blank space" in your template for data to be inserted dynamically (e.g. the name of the movie the user wants to add).

    - How to insert the data once we know what it is.

    - We will also see the Jinja syntax for doing a few additional fancy (but important) things:

        - How to loop over a list of items in a template.

        - How to use a conditional (if / else) in a template.

    - Finally, it is important to note that we will be doing all this in a manner somewhat different from the technique employed in the Udacity class's examples. They make heavy use of Python's `*args` and `**keyword_args` feature, which is very cool, and allows them to write somewhat slicker, more concise code for rendering templates.... BUT we don't want any of that to make templates seem unnecessarily complicated or confusing, so we will elect to write code that is slightly more repetitive here, in the interest of making it simpler to understand the essential concept for today: how to use a templating engine.


## Studio

For studio, you will finish up our refactoring so that we have fully migrated our entire web-app away from using ugly strings of HTML, and into the bright, shiny era of using templates instead.

#### Checking Out the Code

Follow [the same process][checkout-process] as usual to checkout the `studio7` branch of the repo.

#### Your Task

If you visit the web-app in your browser, you will find that the `/add` route is broken! Try typing in a movie and submitting the form, and you will encounter an "Under construction..." message.

Your job is to get this page back up and running. The user should still see the same confirmation message as before:

> The Matrix has been added to your Watchlist.

Of course, there is one caveat: you are required to use a template. Your `main.py` file should not contain any HTML at all!

1. Create a `.html` file inside your `/templates` directory, and add whatever HTML content needs to be added.
2. In your `AddMovie` request handler class, use your template to render the response.

For reference, you can look at our code at the bottom of the `post` method in the `CrossOffMovie` class, which renders the `templates/cross-off.html` template file (in addition to the header and footer templates).


[checkout-process]: ../class5/index.html#checking-out-the-code
