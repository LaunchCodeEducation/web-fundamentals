---
title: 'Studio: FlickList 2'
currentMenu: studios
---

In this studio we will talk about incorporating forms into your app, so that users can provide input and your app can respond to their input.

## Walkthrough

In our FlickList app, we will delete much of the previous "Movie of the Day" code, and start something new. Remember that ultimately our goal is to allow the user to keep a running "watchlist" of movies she plans on seeing. Today, we will create an app with a form that allows the user to "add a movie" to her watchlist. In the process, we will talk about:

**Creating an HTML form**
  - the `<input>` tag
    - the `type` attribute
    - the `name` attribute
  - the `action` attribute
  - the `method` attribute
    - GET vs POST
  - the `<label>` tag

**Responding to a form submission:**
  - making a new `RequestHandler` subclass
  - mapping it to a route on our app
    - this should match the `action` attribute on our form
    - tuples
  - accessing the data in the incoming request
  - sending an appropriate response

Our app won't *really* be able to keep track of the user's movie list at this point. We will need a database to do that (coming up in a few weeks!). But for now, we'll just *pretend* the list exists.

## Studio

For Studio, your job is to provide another form that allows the user to "cross off" an item from her Watchlist.

### Checking out the Studio code

For this studio (and all subsequent studios), you will want to start at the exact place where your instructor left off at the end of the Walkthrough. But don't worry--you do not need to have finished the previous studio, nor do you need to have frantically copied each line of code that your instructor wrote just now. Thanks to the magic of Git branches, we have a system in place that will allow you start each studio with the correct starter code no matter what. Here's how:

1. First, check your status and make sure you do not have any uncommitted changes:

    ```nohighlight
    $ git status
    On branch studio1
    Your branch is up-to-date with 'origin/studio1'.
    nothing to commit, working directory clean
    ```

    If you *do* have uncommitted changes, make sure you `add` and `commit` them **right now**, before moving on.

2. The start-point for today's studio is saved in its own separate branch. More generally, we have created one branch for *each and every* FlickList studio. Currently, you are on the `studio1` branch. To obtain today's starter code, you must switch to the `studio2` branch, using the `git checkout` command:

    ```nohighlight
    $ git checkout studio2
    Branch studio2 set up to track remote branch studio2 from origin.
    Switched to a new branch 'studio2'
    ```

    After switching, if you type `git branch` at the terminal, you will now see that there are two local branches, and you are currently on the `studio2` branch:

    ```nohighlight
    $ git branch
      studio1
    * studio2
    ```

    And if you look again at your code in your text editor, you will see that the code has changed! You have been transported to the parallel universe of Studio 2.

    > *NOTE:* This is not a typical use of branches. More normally, you would have one master branch that represents the "real" or "official" version of your project. Then you would create small, temporary branches to fix a bug work on a new feature, and upon finishing the feature or bug-fix, you would `merge` back into the master branch and delete the temporary branch.

### Your Task

As mentioned above, your task is to implement a new feature for "crossing off" movies from the user's watchlist.

Open up `main.py` in your text editor. You should see 4 `# TODO` comments in the code:

1. **Add a form**. On the `Index` handler, include another `<form>` below the previous one. It should say something like:

    > I want to cross off ___ from my Watchlist.

    where the blank is a text box in which the user can type to specify the movie she wants to cross off.

2. **Handle the form Submission.** Make another `RequestHandler` subclass called `CrossOffMovie`, and implement your subclass with the necessary code to handle incoming submissions and respond appropriately. You should display a confirmation message like:

  > <strike>Star Wars</strike> has been crossed off your Watchlist.

  You can use the `<strike>` tag to get that cool <strike>Strikethrough</strike> style of text.

3. **Register your handler with the app.** You will need to add a new url route for your app, and register your new handler as the one that should respond to incoming requests at that route.

4. **Extra Credit: Use a dropdown instead of a text box.** For deleting a movie from a pre-existing list, a text box does not really make sense, because the user could theoretically type anything, even something that is not even on her watchlist in the first place. A more sensible UI component would a dropdown, which only allows the user to choose from among a limited set of choices.

  Use the `<select>` and `<option>` tags to create a dropdown component where the only available choices are the movies that are currently in the user's Watchlist.

  Thus far, of course, there is no such thing as the user's "real" Watchlist, so you can just pretend. Simply hard-code a few of your favorite movies into the dropdown *as if* those movies make up the user's current watchlist.

### Check in Your Changes

Before you leave, as always, you should `add` and `commit` your changes:

```nohighlight
$ git add .
$ git commit -m "implemented TODOs 1 and 2"
```

Obviously your commit message might be something different. The goal of the commit message is just to provide a useful description of the changes you have made. This will make it easier for collaborators and/or your future self to understand your project's development progress.


[get-the-code]: ../getting-the-code/
