---
title: 'FlickList 1 Walkthrough'
currentMenu: studios
---

[< Back to Overview Page](..)

## Hello, Movies!

In class, we'll walk through the [Project Setup](#project-setup) steps (see below), and discuss the core concepts of web applications:
* How is a dynamic web application different form a static website, and what can a dynamic web app do that a static site cannot?
* What exactly is the application, and how does it "run"?
* How do HTTP requests and responses work?
* GET and POST requests types
* Review of Python class syntax, and the `self` parameter
* Routes in a web application (i.e. how does a specific request get matched with a specific handler class based on the URL?)

We'll also add a bit of code to display a new heading and a "Movie of the Day", which is really just a hard-coded string. You will make this more interesting during the studio.

---

## Project setup

Let's do some setup work to get our project ready. We'll only have to do this once, today. Subsequent FlickList studios will require very little setup work.

### Clone the repository

The starter code for today's studio (and all the future FlickList studios) is contained within our [FlickList repository page on GitHub](https://github.com/LaunchCodeEducation/flicklist-flask). You will need to `clone` this repository in order to obtain your own copy on your local machine.

First, make sure you are in your `lc101/` folder. Then, clone our repository:

```nohighlight
cd YOUR/PATH/TO/lc101
git clone https://github.com/LaunchCodeEducation/flicklist-flask.git
```

This creates a copy of the repository on your laptop. You should now have a new folder in your directory called `flicklist-flask/`. We have included a .gitignore file for you.

TODO

![flicklist-python in GAE](../images/flicklist-gae.png)

Recall that you can set the port settings in the dialog to almost anything you like, as long as you know to access your app in the browser using the correct port. Here, we use 8000 and 8080 for admin and application ports, respectively.


[get-the-code]: ../getting-the-code/
