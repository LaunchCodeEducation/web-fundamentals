---
title: 'FlickList 1 Studio'
currentMenu: studios
---

[< Back to Overview Page](..)

Before you get started, fire up the FlickList app using Google App Engine Launcher and visit the home page in a browser. You should see a page that looks like this.

![Walkthrough 1 version of FlickList](images/walkthrough1-flicklist.png)

If you don't see something like the above, make sure the app is running and check the URL.

### Your Task: Movie of the Day

Currently, this app is kind of boring, because the movie of the day is always *The Big Lebowski*. What if, each time you visit the page, it randomly surprises you with a different movie? That would be much more exciting. Your job is to implement this random movie feature.

In Atom, open up the `flicklist-python` folder, and then the `main.py` file. Notice that you have a couple of TODOs, noted by comments. Completing these will upgrade our app so that rather than displaying the same movie each time, instead it displays a random movie from a list. Here are some more details on what you need to do.

1. If you have not already cloned our starter-code repository and created a GAE project as outlined in the [Walkthrough Setup](../walkthrough) instructions, go and do that now.
1. Inside the `getRandomMovie` method, create a Python list that contains at least 5 movie title strings.
1. In the same method, choose one of the titles randomly, and modify the return statement so that instead of the hard-coded value "The Big Lebowski", it returns the randomly selected title. Here are some tips:
    * Recall that we can generate random numbers in Python with [the `random` module](https://docs.python.org/2/library/random.html). Add `import random` to the top of `main.py` to make this module available to our code. Read the module documentation to determine which method within the module is best for the task at hand.
    * Write your code so that if you were to add or remove some movies from your list, it will still randomly choose one, no matter how many items are in the list. In other words, your code should not contain a "magic number" like `5`.
1. In addition to today's movie, add another section of the page that informs people what tomorrow's movie will be. Back in your `get` method, add another chunk of HTML to your response string. You can do the same basic thing again: an `<h1>` element, with a `<p>` element underneath it.

If you complete the steps above, you should see that the "movie of the day" changes each time you refresh the page!

Hopefully this gives you some sense for the difference between a static web site and a dynamic web app running on a server. Even something as simple as our "random movie of the day" page would be impossible to implement as a static site. In order to dynamically build HTML content "on the fly", like we did here, you need a programming language like Python running on the back-end.

### Commit Your Changes

When you're done with your studio code (or even if you're not done, but you are about to pack up your computer), make sure to commit your changes:
```
$ git add .
$ git commit -m "USEFUL MESSAGE"
```
