---
title: Class 10 Prep Review
currentMenu: classes
---

Here are some review questions for you to solidify your knowledge of the concepts covered in this class:

1. What is the special value that  will be assigned to `user` if the query didn't find a matching user in this statement:

    ```python
    user = User.query.filter_by(email=email).first()
    ```

2. What is a `session`? Why do we use it? What data type is Flask's `session` object?

3. What is the decorator `@app.before_request` used for? When is a function with that decorator called? Explain what is going on in this code snippet:

    ```python
    @app.before_request
    def require_login():
        allowed_routes = ['login', 'register']
        if request.endpoint not in allowed_routes and 'email' not in session:
            return redirect('/login')
    ```

4. Why are flash messages useful? How do they relate to the session object?

5. Describe what this line in the `User` class means:

    ```python
    tasks = db.relationship('Task', backref='owner')
    ```