---
title: 'Studio: FlickList 1'
currentMenu: studios
---


This studio marks the beginning of our exploration of the mechanics and ideas involved in building full-stack web applications. The term **full-stack** simply means that we'll look at every aspect of web applications, from the pages that a user views and interacts with, to the Python code that decides how to handle user submissions and requests, to the database that stores information.

Starting today, the majority of in-class sessions will revolve around building a class project together. Each day of class, we will add a little bit more onto the project: your instructor will live-code some new feature, and then for Studio you will be asked to add a little more.

The mechanics of how you will work on Studios will be the same for nearly every class going forward, so we'll cover them in a bit more detail this time, as a proper introduction to this strategy.

Our app will be called *FlickList*, as in: a list of "flicks" or movies. It'll start out small, but within a few weeks it will have a lot of useful functionality that will allow users to create a list of movies they want to see, edit the list, mark movies as watched, and rate the movies they have watched.

---

## Walkthrough

During lecture, we will start the project, and talk about concepts along the way.

### Hello, Movies!

In class, we'll walk through the [Project Setup](#project-setup) steps (see below), and discuss the core concepts of web applications:
* How is a dynamic web application different form a static website, and what can a dynamic web app do that a static site cannot?
* What exactly is the application, and how does it "run"?
* How do HTTP requests and responses work?
* GET and POST requests types
* Review of Python class syntax
* Routes in a web application (i.e. how does a specific request get matched with a specific method)

We'll also add a bit of code to display a new heading and a "Movie of the Day", which is really just a hard-coded string. You will make this more interesting during the studio.


### Project setup

Let's do some setup work to get our project ready. We'll only have to do this once, today. Subsequent FlickList studios will require very little setup work.

#### Clone the repository

The starter code for today's studio (and all the future FlickList studios) is contained within our [FlickList repository page on GitHub](https://github.com/LaunchCodeEducation/flicklist-flask). You will need to `clone` this repository in order to obtain your own copy on your local machine.

First, make sure you are in your `lc101/` folder. Then, clone our repository:

```nohighlight
cd YOUR/PATH/TO/lc101
git clone https://github.com/LaunchCodeEducation/flicklist-flask.git
```

This creates a copy of the repository on your laptop. You should now have a new folder in your directory called `flicklist-flask/`. We have included a .gitignore file for you.


#### VirtualEnv

We will be using the simple framework Flask along with VirtualEnv just like we did in the `Hello-Flask` exercise. You can go [Back to Hello Flask Page](../../tutorials/hello-flask/) to review those materials if needed.

---

## Studio

After lecture, you will work on your own (or with a classmate) to extend the project and pick up where lecture left off.

Before you get started, fire up the FlickList app using `python main.py` and visit the home page in a browser. You should see a page that looks like this. (The port number may be different.)

![Walkthrough 1 Solution in Browser](walkthrough1-flicklist.png)

If you don't see something like the above, make sure the venv is running and check the URL and port.

### Your Task: Movie of the Day

Currently, this app is kind of boring, because the movie of the day is always *The Big Lebowski*. What if, each time you visit the page, it randomly surprises you with a different movie? That would be much more exciting. Your job is to implement this random movie feature.

First, let's make sure to check out the starter code we have provided for you. Navigate to your flicklist folder and then check out the current version of studio1 code:

```nohighlight
cd YOUR/PATH/TO/lc101/flicklist-flask/
git checkout studio1
git pull origin studio1
```

In Atom, open up the `flicklist-flask` folder, and then the `main.py` file. Notice that you have a couple of TODOs, noted by comments. Completing these will upgrade our app so that rather than displaying the same movie each time, instead it displays a random movie from a list. Here are some more details on what you need to do:

1. If you have not already cloned our starter-code repository and created a Flask project as outlined in the Walkthrough [Project Setup](#project-setup) instructions, go and do that now.

2. Inside the `getRandomMovie` method, create a Python list that contains at least 5 movie title strings.

3. In the same method, choose one of the titles randomly, and modify the return statement so that instead of the hard-coded value "The Big Lebowski", it returns the randomly selected title. Here are some tips:
    * Recall that we can generate random numbers in Python with [the `random` module](https://docs.python.org/2/library/random.html). Add `import random` to the top of `main.py` to make this module available to our code. Read the module documentation to determine which method within the module is best for the task at hand.
    * Write your code so that if you were to add or remove some movies from your list, it will still randomly choose one, no matter how many items are in the list. In other words, your code should not contain a "magic number" like `5`.

4. In addition to today's movie, add another section of the page that informs people what tomorrow's movie will be. Back in your `get` method, add another chunk of HTML to your response string. You can do the same basic thing again: an `<h1>` element, with an unordered list and list item elements underneath it.

    If the two randomly chosen movies happen to be the same, that is okay. You do not need to write extra code to ensure they are distinct. (But if you finish early and want an additional challenge, go for it.)

If you complete the steps above, you should see that the "movie of the day" changes each time you refresh the page!

Hopefully this gives you some sense for the difference between a static web site and a dynamic web app running on a server. Even something as simple as our "random movie of the day" page would be impossible to implement as a static site. In order to dynamically build HTML content "on the fly", like we did here, you need a programming language like Python running on the back-end.

### Commit Your Changes

We recommend you commit often. Commit when you're done with your studio code, before you pack up your computer, or even if you just take a break.

```nohighlight
$ git add .
$ git commit -m "USEFUL MESSAGE"
```

