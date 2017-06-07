---
title: "Get It Done! Part 7: Managing Login Using the Session"
currentMenu: videos
---

<div class="youtube-wrapper"><iframe width="776" height="437" src="https://www.youtube-nocookie.com/embed/QjJ_pTZoWw0?rel=0" frameborder="0" allowfullscreen></iframe></div>

## Notes

In this video lesson we learn how to enable our application to "remember" users via Flask's `session` object. A session is an object (specifically, a dictionary) that you can use to store data that is associated with a specific user so that it is available for use across multiple requests. We'll also learn how to "forget" a user using `session` and a logout route.

Additionally, we'll learn how to create special functions that are not route-specific using the decorator `@app.before_request`. This allows us to do checks before handling incoming requests. 

Finally we'll add a `secret_key` to enable us to use the `session` object: `app.secret_key = "#secretStringHere"`.

## Code

View the [final code](https://github.com/LaunchCodeEducation/get-it-done/tree/5e700d1c821c946f5d630cc5795a6c6354280824) for this lesson.

## References

- [Sessions in Flask](http://flask.pocoo.org/docs/0.12/quickstart/#sessions)
