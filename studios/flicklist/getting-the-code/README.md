---
title: 'Getting Flicklist Code'
currentMenu: studios
---

Flicklist is a progressive studio, with each set of tasks building on previous work. To that end, we provide the starter code for you to begin each studio with. Before each studio, you'll need to get the appropriate starter code from GitHub via the process outlined here.

### Checking Out the Code

For the examples below, we use `M` to indicate the previous studio number and `N` to indicate the current studio number. So if you were about to work on studio 4, you would substitute `studio4` for `studioN` in the examples below.

**Don't forget to replace `N` with the appropriate studio number!**

Navigate to your `flicklist-python` directory.

Hopefully, you do not currently have any uncommitted changes--you should have committed them at the end of the day last time--but check just to make sure:

```nohighlight
$ git status
On branch studioM
nothing to commit, working directory clean
```

If you do have uncommitted changes, then make sure you commit them now, before moving on.

Finally, checkout a new branch from the remote `origin/studioN` branch:

```nohighlight
$ git checkout studioN
Branch studioN set up to track remote branch studioN from origin.
Switched to a new branch 'studioN'
```

This checks out a specific version of the code (called a **branch**) from the remote origin repository. The remote branch is named `studioN`, and we are checking it out into a new, local branch, also named `studioN`.

Think of a branch as a parallel version of the main codebase in the repository. We can work here, make changes, and check them in without affecting the main codebase (usually called the `master` branch).
