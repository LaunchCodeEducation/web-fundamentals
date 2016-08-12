# Assignment: Hello Google App Engine

You do not have to submit this assignment on Vocareum, or demo it to a TF. But if you get stuck, you should make sure to ask for help in class and get the problem resolved. You will need to know how to go through this process for all your future assignments using Google App Engine.

### Step A: Create a Google App Engine app.

1. Open up Google App Engine, and click the little `+` button to create a new app.
1. Under "Application Directory", choose the place where you keep your coding projects for this class.
1. Under "Application ID", name your project `hello-google-app-engine`.
1. Click "Create".
1. In your terminal, navigate to the `hello-google-app-engine` folder. If you type the `ls` command, you should see that GAE has created some "boilerplate" files for you:
    ```
    $ ls
    app.yaml     favicon.ico     index.yaml      main.py
    ```

### Step B: Initialize your project as a local Git repo, and sync it to a remote repo on GitHub.

Just follow [these instructions][github-instructions] from GitHub. Essentially, what you will do is:
- Initialize your project as a Git repository
- Make an initial commit so that your 4 files are checked in.
- Create a remote repository with the same name on GitHub
- Tell your local repository that its "origin" is the one you just created on GitHub
- Push your changes so that the remote repo is synced with the local one


**What's the difference between this process and the *Getting Started* assignment I already did?**

Good question. The only difference is that this time, you create your local repository using `git init`, and then add the GitHub.com repository as a remote by using the `git remote add` command; whereas previously, in the *Getting Started* assignment, you created your local repository by cloning the remote repo, using the `git clone` command. We switched to this new way because it works better with the Google App Engine workflow-- you can let GAE create your project for you, with all the boilerplate files, and then convert that project to a Git repo.

[github-instructions]: https://help.github.com/articles/adding-an-existing-project-to-github-using-the-command-line/
