---
title: "Using HTTP Redirects"
currentMenu: videos
---

<div class="youtube-wrapper"><iframe width="776" height="437" src="https://www.youtube-nocookie.com/embed/XPzRfb2Ky5s?rel=0" frameborder="0" allowfullscreen></iframe></div>

## Notes

Instead of merely providing a success message, web apps typically redirect users to a different page after they successfully submit information (e.g., login). In this video, we will add this functionality to our app to see how it works.

The main difference from our previous code will be to replace our success message with `return redirect(url-path)` where the url-path is a handler that we create to display the HTML for a response to valid inputs. We can then proceed to give specific info back to the user using query paramaters.

## Code

View the [final code](https://github.com/LaunchCodeEducation/hello-flask/blob/9a7a311c11e7a6da59e45edfa9d074e0e710667e/main.py) from this lesson.
