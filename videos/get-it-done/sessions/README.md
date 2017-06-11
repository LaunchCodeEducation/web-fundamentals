---
title: "Get It Done! Part 7: Managing Login Using the Session"
currentMenu: videos
---

<div class="youtube-wrapper"><iframe width="776" height="437" src="https://www.youtube-nocookie.com/embed/QjJ_pTZoWw0?rel=0" frameborder="0" allowfullscreen></iframe></div>

## Notes

In this video lesson we learn how to enable our application to "remember" users via Flask's `session` object. A session is an object (specifically, a dictionary) that you can use to store data that is associated with a specific user so that it is available for use across multiple requests. We'll also learn how to "forget" a user using `session` and a logout route. 

Additionally, we'll learn how to create special functions that are not route-specific using the decorator `@app.before_request`. This allows us to do checks before handling incoming requests. 

Finally we'll add a `secret_key` to enable us to use the `session` object. 

- To begin, import the `session` object from Flask

- Use the session object with this syntax in the `login` and `register` functions: `session['email'] = email`. This creates a key called `email` that has a value of the user's email.

- Next we'll create a simple logout handler to delete this session key:

    ```python
    @app.route('/logout', methods=['GET'])
    def logout():
        del session['email']
        return redirect('/')
    ```

- Now we can check for whether this key is in the `session` object (and therefore if the user is logged in):

    ```python
    @app.before_request
    def require_login():
        allowed_routes = ['login', 'register']
        if request.endpoint not in allowed_routes and 'email' not in session:
            return redirect('/login')
    ``` 
- We'll also need to add a secret key to our app in order to use the `session` object:

    ```python
    app.secret_key = "#someSecretString"
    ```
- And finally we'll add a logout link to the body of our `base.html`:

    ```HTML
        <div>
            <a href="./logout">log out</a>
        </div>
    ```

## Code

View the [final code](https://github.com/LaunchCodeEducation/get-it-done/tree/5e700d1c821c946f5d630cc5795a6c6354280824) for this lesson.

## References

- [Sessions in Flask](http://flask.pocoo.org/docs/0.12/quickstart/#sessions)
