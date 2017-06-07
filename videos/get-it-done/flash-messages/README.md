---
title: "Get It Done! Part 8: Flash Messages"
currentMenu: videos
---

<div class="youtube-wrapper"><iframe width="776" height="437" src="https://www.youtube-nocookie.com/embed/51SAZysvff4?rel=0" frameborder="0" allowfullscreen></iframe></div>

## Notes

In this video lesson we learn to use flash messages to flexibly display messages to users based on their actions. Among other benefits, message flashing allows you to display messages to the user when you are redirecting them (i.e., not rendering a template). To use flash messages, we'll need to:

- Import the `flash` function from Flask

- Create a `flash` function call in `main.py`, e.g., `flash("Logged In")`

- Access the flash message in your `base.html` using jinja2 syntax, including the newly-introduced "with" block: 

    ```HTML
    {% with messages = get_flashed_messages() %}
        <ul>
        {% for message in messages %}
            <li>{{message}}</li>
        {% endfor %}
        </ul>
    {% endwith %}
    ```
- Add categories to your `flash` function call so that you can add styling to your flash messages, e.g. `flash("Logged In", "success")`. You'll also need to modify your base template as follows: 

    ```HTML
    {% with messages = get_flashed_messages(with_categories=True) %}
        <ul>
        {% for category,message in messages %}
            <li class="{{category}}">{{message}}</li>
        {% endfor %}
        </ul>
    {% endwith %}
    ```
- Then add whatever CSS style rules you wish for those categories in a `<style>` tag in the `head` of the base template.


## Code

View the [final code](https://github.com/LaunchCodeEducation/get-it-done/tree/bb96f8ea76df9e57c92574abc7286243693675b8) for this lesson.

## References

- [Message Flashing in Flask](http://flask.pocoo.org/docs/0.12/quickstart/#message-flashing)
