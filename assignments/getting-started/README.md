---
title: 'Assignment: Getting Started'
---

The purpose of this assignment is to provide you with more practice with Git and GitHub, as well as a dry-run through the process of using Github to turn in your assignments on Vocareum.

One of the best ways to become familiar and comfortable with Git and Github is to use the same commands repeatedly, and build Git into your coding workflow. This will develop your "muscle memory" so that you learn both the mechanics and principles at the same time.

## The Process

Work through the steps below, one by one.

1. **Open up your terminal.** (or PowerShell if you are on Windows).

    > Note that for some of the example terminal commands displayed below, we don't always included the resulting output. Output is displayed when we think it will be valuable to confirm that your output matches ours. Otherwise, we just show you the command you should type, but not the result.

1. **Create a folder for this assignment.** Navigate into the parent folder where you keep your course materials (e.g. `lc101` or `code`), and make a new subfolder for this assignment:

    ```nohighlight
    $ cd lc101
    $ mkdir getting-started
    ```

    Your directory structure should look something like:

    ```nohighlight
    lc101/
        |
        +------- using-python-locally/
        |
        +------- crypto/
        |
        +------- getting-started/
        |
        ... etc
    ```

1. **Initialize your project as a Git repository.** In your terminal, use the `git init` command to initialize your `getting-started/` folder as a Git repository:

    ```nohighlight
    $ cd getting-started/
    $ git init
    Initialized empty Git repository in /Users/johnnyappleseed/lc101/getting-started/.git/
    ```

    > Note that your name is (probably) something other than **johnnyappleseed**.

    Now your project is a Git repository, which will enable you to to do all the magic git powers:

        - using version-control to manage your changes
        - syncing your local repository with a remote repository on Github.com.

    You only ever have to do this step once, at the beginning.

1. **Do some work.** Now you are all set up to start working on the actual content of your project. This step will normally take you many hours, but in this case we are just going to do something very simple.

    In Atom, create a new file named `index.html` and save it to the `getting-started/` directory. Add to that file the minimal markup needed to make a well-formed HTML document:

    ```html
    <!DOCTYPE html>

    <html>
        <head>
            <title>My First Web Assignment</title>
        </head>
        <body>
            <!-- Page content goes here -->
        </body>
    </html>
    ```

   Next, add an `<h1>` element as a child inside the `<body>` element. Inside the `<h1>`, put your own name:

    ```html
    ...
        </head>
        <body>
            <!-- Page content goes here -->
            <h1>Johnny Appleseed!</h1>
        </body>
    </html>
    ...
    ```

    Save your file, and open the file in a browser to make sure everything looks good. You should see your name.

1. **Add your work to the repo.** You finished the assignment! Now you just have to do a few steps to submit it. First you will `add` the changes you have made.

    Back in the terminal, check your status:

    ```nohighlight
    $ git status
    Untracked files:
    (use "git add <file>..." to include in what will be committed)

        index.html

    nothing added to commit but untracked files present (use "git add" to track)
    ```
    The message indicates that you have created 1 new file, index.html. This represents a "change" since last time. We want to commit that change.

    Track the new file, using the `git add` command, so it will be staged for your next commit:

    ```nohighlight
    $ git add index.html
    ```

    > In general, on future assignments, you will want to add multiple changes at once, without having to type each file name individually. This can be achieved by using:

    > ```nohighlight
    > $ git add .
    > ```

    > The `.` here stands for "all files." When doing this, it is advised to run `git status` first, to see the current list of changes and make sure you really do want to batch all of them together into one commit.

1. **Commit.** Now you are ready to `commit` the changes you have staged. If you check your status again, you should see that your change is staged to be committed:

    ```
    $ git status
    On branch master

    Initial commit

    Changes to be committed:
      (use "git rm --cached <file>..." to unstage)

    	new file:   index.html

    ```

    Go ahead and commit your changes, with an appropriate commit message, describing what you have changed:

    ```
    $ git commit -m "Adding index.html"
    ```

    > Note that you'll be asked to authenticate with GitHub. If you get tired of this, you can [set up your computer and your GitHub account to use SSH keys](https://help.github.com/articles/generating-an-ssh-key/).

    Now that you have committed, your status should be "clean":

	```
   $ git status
   On branch gh-pages
	nothing to commit, working directory clean
   ```

1. **Create a remote repository on Github.** In the previous step, you committed your changes to the *local* Git repo on your computer.

1. **Give your local repository a reference to your Github repository.**

1. **Push to GitHub.**  Your local repo is now ahead of your remote repo (the one hosted on github.com) by 1 commit. At this point, if you go back and visit your repository page on GitHub, you will not yet see the new index.html file.

	In order to sync up your remote repo with your local one, you must *push* your local changes up to GitHub:

    ```
    $ git push origin master
    ```

    You should read this command as: "Push all of my commits to the 'origin' repository (on its master branch)". The name "origin" is typically used to refer to a remote Git repo, often on a platform such as GitHub or Bitbucket.

1. **Submit via Vocareum** Now your code is up in GitHub. Time to submit it to Vocareum! Open Vocareum and navigate to the "My Work" view for the "Getting Started" assignment.

	In the My Work environment, you should see a terminal at the bottom of your screen:

	![Vocareum Terminal](images/vocareum-terminal.png)

	This is a terminal just like the one on your computer. Clone your repo, just like you did on step 2:

	```
	$ git clone [URL]
	```

    > Note that on the Vocareum terminal you might not be able to use a keyboard shortcut (e.g. `cmd-v`) to paste your url. But you can right-click on the screen inside the terminal prompt, and paste that way.

	You should see your repo appear inside your `work/` directory on the left.

	Finally, click Submit!



## OLD STEPS (TODO incorporate these)

1. **Create a repo.** Visit your profile page on github.com and select the *Repositories* tab. Create a new repository by clicking the green "New" button. In the resulting dialogue, give your repo the name `getting-started`.

    ![New repository](images/new-repo.png)

1. **Clone the repo to your machine.** GitHub will redirect you to a new page after creating the repository. On this page, copy the repository URL for your repo:

    ![Repository URL](images/copy-url-post-create.png)

    Back in your terminal, type:
    ```
    $ git clone [URL]
    Cloning into 'getting-started'...
    warning: You appear to have cloned an empty repository.
    Checking connectivity... done.
    ```
    where you paste in your project URL in place of [URL].

    Move into your new directory:
    ```
    $ cd getting-started
    ```
    Check the status, to make sure everything is set up properly.
    ```
    $ git status
    On branch master

    Initial commit

    nothing to commit (create/copy files and use "git add" to track)
    ```




## Notes

A few other things to take note of:

* **No Auto-grader script.** This assignment -- and all assignments going forward -- will be manually graded, so you still won't have a grade after you've submitted on Vocareum. In order to receive credit, you'll need to demo your work for a TF during class time.

* **Use this page as a reference.** Except for a few minor differences here and there, you will repeat this same proccess for every assignment in Unit 2, using a unique repository and Vocareum assignment for each. We'll remind of you of the steps to take as you go, but if you need a detailed refresher at any point, revisit this walkthrough.

* **What if I want to change my code?** If you make changes to your project after cloning it into Vocareum, and you want to submit your latest version, then you will need to use one more Git command, the `pull`.

	In your Vocareum terminal, `cd` into your project folder, and then `pull` the latest changes down from your remote GitHub repo:

	```
	$ cd getting-started
	$ git pull origin master
	```
