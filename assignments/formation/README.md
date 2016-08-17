# Assignment: Formation

This assignment is all about incorporating forms into your web apps.

We will mostly build off of CS253's [Problem Set 2][pset2], but we will add onto it a little bit.

Are you excited, Beyonce?

![beyonce-nodding](https://media.giphy.com/media/xT0BKqoyyaL7YBbyUM/giphy.gif)

Me too!

## Part 1: Caesar

This part is an extension of the *Rot13* quiz from Problem Set 2 on CS253.

If you did the *Crypto* problem set from the ThinkPython Unit 1, then the words "caesar" and "rot13" should look very familiar. In fact, you are encouraged to reuse your `caesar.py` file from your previous work. The point of this assignment is to get your comfortable handling and responding to form submissions in a web app, not to rehash how to do the Caesar cipher.

> NOTE: If you did not do the Crypto problem set, don't worry. Your instructor will provide you with a working `caesar.py` file that you can use.

#### Setting up

Create a new Google App Engine app called `caesar`, and then set up a local Git repository and a remote repository on GitHub. See [Hello Google App Engine][hello-gae] for a refresher on that process.

#### Part 1a: Rot13

First, go ahead and implement the Rot13 web app as specified on on the quiz.

> Remember that you should ignore any Udacity instructions about hosting your app out on the internet and posting the link so they can grade it. You don't have to submit your work to Udacity, you just have to submit to LaunchCode on Vocareum.

#### Part 1b: Caesar

Rotating by 13 all the time is fine, but let's spice it up and let the user rotate by any amount they want.

Add another input field so the user can choose how much they want to rotate by.

Here is [an example][caesar-example] of what you're trying to build. Your page doesn't have to look exactly the same, but it must have the same functionality: the user should be able to choose a rotation amount, and then your program should encrypt their using that amount.

Notice that in our example, if the user types a rotation amount that is not a number, the app crashes! This is obviously not ideal. Below, in Part 2, you will build an app with server-side validation, so bad things like this can't happen. But for this assignment, it's okay if your app crashes on invalid inputs.

## Part 2: User Signup

#### Setting Up

Create a new Google App Engine app called `signup`, and then set up a local Git repository and a remote repository on GitHub. See [Hello Google App Engine][hello-gae] for a refresher on that process.

#### Doin Work

This one has no extra extension work-- just do the assignment described on Udacity for the item called [Quiz: User Signup][user-signup].

Again, your page does not have to look exactly the same as their example (here's [ours][signup-example], by the way), but you must have all the same functionality. The notes underneath the video spell out exactly what is required, but here's a summary:
1. If the user's form submission is not valid, you should reject it and display some feedback to inform them of what they did wrong.
1. The following things should trigger an error:
  - The user does not enter a username
  - The user's username is not valid -- for example, contains a space character. Full spec is included in the notes underneath the video.
  - The user's password and password-confirmation do not match
  - The user provides an email, but it's not a valid email.
1. Each feedback message should be next to the field that it refers to.
1. For the username and email fields, you should preserve what the user typed, so they don't have to retype it. With the password fields, you should clear them, for security.

> Remember that you should ignore any Udacity instructions about hosting your app out on the internet and posting the link so they can grade it. You don't have to submit your work to Udacity, you just have to submit to LaunchCode on Vocareum.


## Submitting Your Work

When you are ready to submit, make sure you `add`, `commit` and `push` all the changes you have made, so that your remote repo is up to date with the work you have done locally.

On Vocareum, you will see that this assignment has two sections. For each section, clone your repository into your `work/` folder and then Click submit.

When demoing for a TF, please wait until you have submitted both assignments, and then demo both at once.

> Remember that you should ignore any Udacity instructions about hosting your app out on the internet and posting the link so they can grade it. You don't have to submit your work to Udacity, you just have to submit to LaunchCode on Vocareum.


[pset2]: https://classroom.udacity.com/courses/cs253/lessons/48756009/concepts/485384170923#
[user-signup]: https://classroom.udacity.com/courses/cs253/lessons/48756009/concepts/485384170923#
[caesar-example]: https://launchcode-demos.appspot.com/caesar
[signup-example]: https://launchcode-demos.appspot.com/signup
[hello-gae]: ../../assignments/hello-google-app-engine
