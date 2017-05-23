---
title: "Server-Side Validation"
currentMenu: videos
---

<div class="youtube-wrapper"><iframe width="776" height="437" src="https://www.youtube-nocookie.com/embed/Wze7C_N4s5Y?rel=0" frameborder="0" allowfullscreen></iframe></div>

## Notes

Refer to the lesson notes for [Forms in Flask](../forms-in-flask) if you need reminders on basic set up steps for creating Flask forms.

In this lesson we'll create a form where a user can enter a time in hours and minutes, and then we'll validate the input and tell the user whether that is a valid time.

The steps we'll follow to accomplish this are:

1. Create an HTML form with placeholders that will be filled with values using `str.format` and create a route for it
2. Write the code to process the form and provide feedback to the user: 
    1. Get the data from the request
    2. Provide error message to the user if input is invalid *or* provide success message if the input is valid:
        * Use a Try/Except block to test the input for whether it consists of integers
        * Provide unique error messages based on how the input was invalid (not an integer vs. out of range)
        * Create a message to display if input is valid (if the error messages are empty)
        * Leave valid values in place in the input fields, but remove invalid values

## Code

View the [final code](https://github.com/LaunchCodeEducation/hello-flask/blob/08ad402cb901433d32879135f091a085fa9d25a0/main.py) from this lesson.
