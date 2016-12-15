---
title: User Signup
---

This assignment is all about incorporating forms into your web app, validating the user's input and providing useful feedback to the user when their input is rejected.


## Setting Up

Create a new Google App Engine app called `user-signup`, and then initialize a local Git repository.

## Doin Work

Your assignment is simply to complete Part 2 of CS253's Problem Set 2, specifically the item called [Quiz: User Signup][user-signup].

Your page does not have to look exactly the same as their example (here's [our version][signup-example], by the way), but you must have all the same functionality. The notes underneath the video spell out exactly what is required, but here's a summary:
1. If the user's form submission is not valid, you should reject it and display some feedback to inform them of what they did wrong. The following things should trigger an error:
  - The user does not enter a username
  - The user's username is not valid -- for example, contains a space character. Full spec is included in the notes underneath the video.
  - The user's password and password-confirmation do not match
  - The user provides an email, but it's not a valid email.
1. Each feedback message should be next to the field that it refers to.
1. For the username and email fields, you should preserve what the user typed, so they don't have to retype it. With the password fields, you should clear them, for security.

> Note that Udacity provides a "solution" to the problem... you are free to look at their solution, but obviously you should not try copy it. In any case you will not find it very helpful, as they make use of templates, which you have not learned about yet.


### Submit

To turn in your assignment and get credit, follow the [submission instructions][submission-instructions].

> Remember that you should ignore any Udacity instructions about hosting your app out on the internet and posting the link so they can grade it. You don't have to submit your work to Udacity, you just have to submit to LaunchCode on Vocareum.


[pset2]: https://classroom.udacity.com/courses/cs253/lessons/48756009/concepts/485384170923#
[user-signup]: https://classroom.udacity.com/courses/cs253/lessons/48756009/concepts/485384170923#
[caesar-example]: https://launchcode-demos.appspot.com/caesar
[signup-example]: https://launchcode-demos.appspot.com/signup
[hello-gae]: ../../assignments/hello-google-app-engine
