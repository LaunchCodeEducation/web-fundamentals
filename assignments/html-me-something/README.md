---
title: 'Assignment: HTML Me Something'
currentMenu: assignments
---

You've learned a bit of HTML and some CSS, but you have likely only used it in bits and pieces so far, adding or modifying content in exercises or pre-existing files. Here, you are going to take another step forward by building an entire page from scratch. You will also get some practice using Git.

There are two parts to this exercise, one focused on HTML and another focused on CSS. HTML makes up the *structure and content* of web pages, while CSS dictates the *visual style*.

Best practices dictate that these should be kept as separate as possible. To that end, we'll build the HTML portion of our page first, and only afterwards will we add a few styles with CSS. This will help us avoid adding HTML elements simply to change the style of our page.

### Sections:

- [Getting Started](#getting-started)
- [Getting to Work](#getting-to-work)
- [Submitting Your Work](#submitting-your-work)

## Getting started

First, follow the steps below to create a folder for your project and initialize it as a Git repository:

### Setup the Project

1. Navigate into the parent folder where you keep all your course materials (e.g. `lc101/` or `code/`). Only you know where that folder lives in your file system, but you want to do something like:

    ```nohighlight
    $ cd ~/Documents/lc101/
    ```

1. Make a new folder for this assignment:

    ```nohighlight
    $ mkdir html-me-something
    ```

    Your directory structure should now look like the below (or something similar):

    ```nohighlight
    lc101/
        |
        +------- using-python-locally/
        |
        +------- crypto/
        |
        +------- html-me-something/
        |
        ... etc
    ```

1. Within your new `html-me-something/` directory, create and save a new file called `index.html`:

    ```nohighlight
    $ touch index.html
    ```

    <aside class="aside-note" markdown="1">
    The filename `index.html` is a standard convention for the name of the root page of a website. Most web servers will treat `index.html` as the default file to load from a given directory.
    </aside>

1. Open up your new file in a text editor. Add a single line with the following HTML:

    ```html
    <p>YOUR NAME</p>
    ```

1. Save your file.

1. Finally, open up the file in a web browser. You can do this by selecting *File > Open File* in your web browser, and navigating to the location of your new HTML file. If you get stuck on this, [here's a video][open-in-browser].

    You should see a blank white page with your name in the top-left corner.

[open-in-browser]: https://www.youtube.com/watch?v=It5P1hg44MQ

### Use Git

Now let's incorporate Git into the picture.

1. #### Initialize the project as a Git repository.

	In your terminal, make sure you are inside your `html-me-something` folder, and then use the `git init` command to initialize that folder as a Git repository:

    ```nohighlight
    $ pwd
    /Users/adalovelace/lc101/html-me-something
    $ git init
    Initialized empty Git repository in /Users/adalovelace/lc101/html-me-something/.git/
    ```

    <aside class="aside-note" markdown="1">
    Your name is (probably) something other than **adalovelace**.
    </aside>

    Now your project is a Git repository, which will enable you to to do all the magic Git powers:

    - using version-control to manage your changes
    - syncing your local repository with a remote repository on Github.com.

    <aside class="aside-note" markdown="1">
    You only ever have to do the `git init` step once, at the beginning.
    </aside>

	#### 1a. Check your status

	Back in the terminal, use the `git status` command to check the status of your newly created repo:

    ```nohighlight
    $ git status
    On branch master

    Initial commit

    Untracked files:
      (use "git add <file>..." to include in what will be committed)

            index.html

    nothing added to commit but untracked files present (use "git add" to track)
    ```

    This message says a lot of things, but for now, the most important point is that `index.html` is currently "untracked". We need to `add` and then `commit` the file so that Git can help us manage its changes.

2. #### Add your work to the repo

	Use the `git add` command to track your `index.html` file so that it will be staged for your next commit:

    ```nohighlight
    $ git add index.html
    ```

	#### 2a. Check your status

	If you check your status again, you should see that your change (the creation of the new file) is staged to be committed:

    ```nohighlight
    $ git status
    On branch master

    Initial commit

    Changes to be committed:
      (use "git rm --cached <file>..." to unstage)

        new file:   index.html
    ```

3. #### Commit

	Now you are ready to `commit` the changes you have staged.

    Go ahead and commit your changes, along with an appropriate message describing what you have changed:

    ```nohighlight
    $ git commit -m "Created index.html file"
    ```

	#### 3a. Check your status

    Now that you have committed, your status should be "clean":

	```nohighlight
    $ git status
    On branch master
	nothing to commit, working directory clean
    ```

Congrats! You are officially up and running with a version-controlled project.

## Getting to Work

Now it's time to build out your page! Dive into each of the two parts below:

[Part 1: HTML](./part1-html)

[Part 2: CSS](./part2-css)

## Submitting your work

When you are ready to submit, complete the following steps:

### Github

Github.com is website that hosts Git repositories "in the cloud". A repository that is up on Github often functions as the central hub for a project, so that a developer can do work across multiple machines, or multiple developers can work collaboratively on the same project.

For the remainder of this course, you will use Github to submit your work. Here's how:

1. #### Create a repo on Github

    In a browser, visit [Github's website](http://github.com). Make sure you are logged onto your Github account (or create an account now if you have not already done so.)

    On your profile page, create a new repository by clicking the green `New` button on the right side of the screen:

    <img src="images/new-repo.png"/>

    Give your repository the same name as your folder, `html-me-something`, and toggle the rest of the options as specified here:

    <img src="images/repo-name.png"/>

    <aside class="aside-note" markdown="1">
    Instead of `LaunchCodeEducation`, you will see your own username.
    </aside>


1. #### Inform your local repo about the existence of your remote repo

	Now you have two repositories: the local one on your computer, and the remote one on Github. The next step is to sync them up.

	The first step to syncing them is to give your local repo a *reference to* the remote repo. Using the `git remote` command, you can inform your local repo about the existence of the remote one.

	Use the command below, **but (keep reading below)** :

	```nohighlight
	$ git remote add origin PASTE_REPO_URL_HERE
	```

	**...but** replace `PASTE_REPO_URL_HERE` with the actual url for your remote Github repo, which you can obtain by clicking the `Clone or Download` button and then copying and pasting the associated url:

	![GitHub Clone Url](./images/github-clone-url.png)

	<aside class="aside-note" markdown="1">
	Alternatively, you can just type out `https://github.com/YOURUSERNAME/html-me-something.git` at the terminal.
	</aside>

	By running this `git remote add ...` command on the terminal, you are basically saying:

    > "Hey local repo. Please meet your new friend, `origin`, a remote repo, whose url is `https://github.com/...`"

	Note that the name "origin" is simply a standard naming convention for the main remote repo associated with a local repo.


1. #### Push your local changes up to the remote

	Your local repo is currently *ahead of* your remote repo by a few commits. Locally, you have added and edited a few files, and committed all those changes, whereas your remote repo is still entirely empty.

	Use the `git push` command to "push" all your local changes up to the remote:

	```nohighlight
	$ git push origin master
	```

	This command says:

    > "Hey Git, please push all my local changes to the remote repo called `origin` (specifically, to its `master` branch)."

	If you now refresh the browser window on your Github page, you should see that your HTML and CSS files have appeared!

### Submit

To finishing submitting and receive credit, follow steps 3 and 4 of the [submission instructions][submission-instructions] on the *Assignments List* page.

### Extra Credit: Host your Page using Github Pages

If you want to show off your hard work to all your friends, Github has a cool feature called *Github Pages* that makes this really easy.

Github provides free hosting for any "static" web content (like this project). All you have to do is change a setting on your GitHub repository.

1. In a browser, go to the Github page for your repository.
1. Click on the *Settings* tab
1. Scroll down to the *GitHub Pages* section and enable the feature by choosing your `master` branch from the dropdown. Hit *Save*.
    ![Set GitHub Pages Branch](images/gh-pages-set-branch.png)
1. In any browser, you should now be able to visit `YOUR_USERNAME.github.io/html-me-something` and see your web page!


[submission-instructions]: ../
[open-in-browser]: https://www.youtube.com/watch?v=It5P1hg44MQ
