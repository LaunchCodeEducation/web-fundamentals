---
title: 'FlickList 1 Walkthrough'
currentMenu: studios
---

[< Back to Overview Page](..)

## Hello, Movies!

In class, we'll walk through the [setup](#project-setup) steps below, and discuss the core concepts of web applications:
* How is a dynamic web application different form a static website, and what can a dynamic web app do that a static site cannot?
* What exactly is the application, and how does it "run"?
* How do HTTP requests and responses work?
* GET and POST requests types
* Review of Python class syntax, and the `self` parameter
* Routes in a web application (i.e. how does a specific request get matched with a specific handler class based on the URL?)

We'll also add a bit of code to display a new heading and a "Movie of the Day", which is really just a hard-coded string. You will make this more interesting during the studio.

---

## Project setup

Let's do some setup work to get our project ready. We'll only have to do this once.

### Clone the repository

The starter code for today's studio (and all the future FlickList studios) is contained within our [FlickList repository page on GitHub](https://github.com/LaunchCodeEducation/flicklist-python). You will need to `clone` this repository in order to obtain your own copy on your local machine.

First, make sure you are in your `lc101/` folder. Then, clone our repository:

```nohighlight
cd YOUR/PATH/TO/lc101
git clone https://github.com/LaunchCodeEducation/flicklist-python.git
```

This creates a copy of the repository on your laptop. You should now have a new folder in your directory called `flicklist-python/`.

### Create new App Engine app

Now, open the Google App Engine Launcher. Create a new app using the app ID `flicklist-python`. The application directory should be *one level above* the repository directory that was just created by cloning the repository. So, if your copy of the repository is in `/home/student/code-projects/flicklist-python`, then you would set the application directory to `/home/student/code-projects/`. In previous usage of Google App Engine Launcher, the tool created a new directory for us using the specified project ID. In this case, however, we want to use the directory that is already there. If we get the application ID and directory settings correct, Google App Engine will do this just like we want.

![flicklist-python in GAE](../images/flicklist-gae.png)

Recall that you can set the port settings in the dialog to almost anything you like, as long as you know to access your app in the browser using the correct port. Here, we use 8000 and 8080 for admin and application ports, respectively.


[get-the-code]: ../getting-the-code/
