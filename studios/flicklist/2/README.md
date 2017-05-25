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
    - the `id` attribute
  - the `<label>` tag
  - the `action` attribute
  - the `method` attribute
    - GET vs POST

**Responding to a form submission:**
  - map the request to a route on our app
    - this should match the `action` attribute on our form
  - accessing the data in the incoming request
  - sending an appropriate response

Our app won't *really* be able to keep track of the user's movie list at this point. We will need a database to do that (coming up in a few weeks!). But for now, we'll just *pretend* the stored list exists.

Go ahead and get ready to code along with the instructor by checking out the `walkthrough2` branch. First check if you have any uncommitted changes in the `studio1` branch, and if you do, `add` and `commit` them.

```nohighlight
$ git status
On branch studio1
Your branch is ahead of 'origin/studio1' by 3 commits.
  (use "git push" to publish your local commits)
nothing to commit, working tree clean

```

<aside class="aside-note" markdown="1">
If you have added and committed code in your local repository, you will see a recommendation to `git push` your local commits. *Do not do this.* Normally, when you have your own remote repository set up, you will want to `push` your changes, but in this case, it would just try to `push` to the main repository owned by LaunchCode. The permission settings are such that you should not be able to `push`, so just know that you do not need to do so.
</aside>

## Studio

For the studio, your job is to provide another form that allows the user to "cross off" an item from her Watchlist.

### Checking out the Studio code

For this studio (and all subsequent studios), you will want to start at the exact place where your instructor left off at the end of the Walkthrough. But don't worry--you do not need to have finished the previous studio, nor do you need to have frantically copied each line of code that your instructor wrote just now. Thanks to the magic of Git branches, we have a system in place that will allow you start each studio with the correct starter code no matter what. Here's how:

1. First, check your status and make sure you do not have any uncommitted changes. If you *do* have uncommitted changes, make sure you `add` and `commit` them **right now**, before moving on.

2. The start-point for today's studio is saved in its own separate branch. More generally, we have created one branch for *each and every* FlickList studio. Currently, you are on the `walkthrough2` branch. To obtain today's starter code, you must switch to the `studio2` branch, using the `git checkout` command:

    ```nohighlight
    $ git checkout studio2
    Branch studio2 set up to track remote branch studio2 from origin.
    Switched to a new branch 'studio2'
    ```

    After switching, if you type `git branch` at the terminal, you will now see that there are four local branches, and you are currently on the `studio2` branch:

    ```nohighlight
    $ git branch
      studio1
    * studio2
      walkthrough1
      walkthrough2
    ```

    And if you look again at your code in your text editor, you will see that the code has changed! You have been transported to the parallel universe of Studio 2.

    <aside class="aside-note" markdown="1">
    Branches are generally not used this way. More typically, you would have one `master` branch that represents the most stable or "official" version of your project. Then you would create small, temporary branches to fix a bug or work on a new feature, and upon finishing the feature or bug-fix, you would `merge` back into the master branch and delete the temporary branch.
    </aside>

### Your Task

As mentioned above, your task is to implement a new feature for "crossing off" movies from the user's watchlist.

Open up `main.py` in your text editor. You should see 3 `# TODO` comments in the code:

1. **Add a form**. Fill in the HTML string for `crossoff_form` so that it displays something like:

    > I want to cross off ___ from my Watchlist.

    where the blank is an input text field in which the user can specify the movie she wants to cross off.

2. **Handle the form submission.** Fill in the function called `crossoff_movie` with the necessary code to handle incoming submissions and respond appropriately. You should display a confirmation message like:

  > <strike>Star Wars</strike> has been crossed off your Watchlist.

  You can use the `<strike>` tag to get that cool <strike>Strikethrough</strike> style of text.  
  Directly above the function definition, you will need to add a new url route for your app that should respond to incoming requests at `/crossoff`.

3. **Use a dropdown instead of an input text field.** For deleting a movie from a pre-existing list, an input field does not really make sense, because the user could theoretically type anything, even something that is not on her watchlist in the first place. A more sensible UI component would be a dropdown, which only allows the user to choose from among a limited set of choices.

  Use the `<select>` and `<option>` tags to create a dropdown component where the only available choices are the movies that are currently in the user's Watchlist. See [w3schools](https://www.w3schools.com/html/html_form_elements.asp) for more about this form element.

  Thus far, of course, there is no such thing as the user's "real" Watchlist, so you can just pretend. Simply hard-code a few of your favorite movies into the dropdown *as if* those movies make up the user's current watchlist.

### Check in Your Changes

Before you leave, as always, you should `add` and `commit` your changes:

```nohighlight
$ git add .
$ git commit -m "implemented TODOs"
```

Obviously your commit message might be something different. The goal of the commit message is just to provide a useful description of the changes you have made. This will make it easier for collaborators and/or your future self to understand your project's development progress.


[get-the-code]: ../getting-the-code/
