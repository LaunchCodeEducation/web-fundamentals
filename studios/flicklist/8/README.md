---
title: 'Studio: FlickList 8'
currentMenu: studios
---

This studio has a different structure than past Flicklist studios. Instead of watching an instructor-led walkthrough and then talking a problem on your own, you will work through a guided tutorial to add some new features to the application. This will allow us to work through some new components in a more structured way, learning as we go.

## Studio

In [Flickslist 7](../7/), we added registration and login functionality to the Flicklist app. However, that functionality wasn't very useful because our server-side application had no way to determine if a user had already logged in. We were only able to verify login credentials upon submission of the login form.

Today, we'll enable a persistent logged-in state. In other words, once a user logs in, we'll have a way to "remember" that they were previously authenticated. We'll do this with cookies.

### Checking out the Studio code

Follow the [instructions for getting the code][get-the-code] in order to get the starter code for `studio8`.

Since last class featured on a walkthrough and no studio, spend a few minutes with the starter code to remind yourself what was added. That way, you'll be ready to jump right in.

### Your Tasks

The entire set of functionality that we'll add today centers around cookies. In particular, we need to be able to easily read and set cookies. To that end, let's make this easy for each of our handlers.

<aside class="aside-warning" markdown="1">
We give you snippets of code throughout this activity. The point in doing so is *not* so that you can copy/paste them into your application. Doing so will result in the concepts going right in, and then right out of, your brain.

Write each snippet, line, and character of code in this activity yourself, and think about what they're doing as you do so. You'll retain the concepts, and thank us later! And after all, how hard is it to type something that you've been given?
</aside>

#### Reading and Setting Cookies

Let's create two methods, `read_cookie(self, name)` and `set_cookie(self, name, val)`, that will read and set cookie data.

Where should they go? The ability to read and set cookies is something that should be accessible to every handler class. While we'll use cookies in a limited capacity in this studio, web applications should generally be able to use them in a wide variety of settings. So it seems like a good idea to put these methods in the `Handler` class that we created last time, and which all of our other handler classes now extend.

##### Reading Cookies

We learned in the course prep work that we read cookies out of an incoming HTTP request. Furthermore, cookies consist of key/value pairs, and to read the cookie, we must ask for it by value, like this:

```python
val = self.request.cookies.get('my_cookie')
```

Here, `'my_cookie'` is the key of the cookie, and the value is stored in the variable `val`. If there is no cookie with that key, `val` will be `None`. Knowing this is enough to write `read_cookie`.

**Task #1**: Find the `Handler` class definition in `main.py` and add this method:

```python
def read_cookie(self, name):
    return self.request.cookies.get(name)
```

#### Setting Cookies

Setting a cookie is only slightly more involved than reading one. There are a couple of major differences. First is that we'll need both the name and value of a cookie to set it. Second is that we set a cookie in the HTTP response headers, rather than working with an HTTP request. This is because cookies are stored in the user's browser, and our response header will function as an instruction to the browser to hold onto the piece of data for future requests.

In general, to set the value of a cookie in a `Webapp2` handler class, we can do the following:

```python
self.response.headers.add('Set-Cookie', '%s=%s; Path=/' % (name, val))
```

This asks the user's browser to set a cookie with the key/value pair of `name`/`val`, and to send it to us on all future requests below the root path `/` of the application.

**Task #2**: With this knowledge, add a method `set_cookie(self, name, val)` in the `Handler` class that sets such a response header. The method should not return anything.

### Logging In a User

Now that we're able to read and write cookies within each of our handler classes, let's use this functionality to store a cookie that we'll be able to use later to check that the user has already logged in.

On each incoming request, we want to be able to look for a cookie that will tell us that the person sending the request has already logged in. Furthermore, we'll want to know who that person is. In other words, we need to be able to easily determine which `User` object in the database represents their account.

The best way to do this is by storing the ID associated with a given `User` object in a cookie. That way, when we retrieve the cookie we'll know exactly who they are.

**Task #3**: Within the `Handler` class, let's add a `login_user` method. Here are the steps to do so:

1. Define the method as: `def login_user(self, user):`. The `user` parameter will be a `User` object.
2. In the first line of the method, retrieve the ID of the user: `user_id = user.key().id()`
3. Set a new cookie with name `'user_id'` and value equal to the `user_id`, converted to a string. Do this by calling the method to created in the previous task.

At this point, you can set a `user_id` cookie by calling `login_user`. But as of yet, we're not actually using this method.

**Task #4**: In the `Login` class, add a call to `self.login_user` in the `post` method, at the point at which you know a user has submitted the correct credentials.

Now, a user that submits the correct login credentials will have a cookie set containing their `user_id`. Next, we'll look for this cookie in an incoming request to see if the request is from a logged-in user.

### Verifying a User's Login Status

We'll want to check for a user's login status in nearly every request. There will some pages -- the Login and Register pages, for example -- that a user should not have to be logged in to view, but the majority of our pages will require users to log in. For now, let's look at how we can restrict access to *every* page on the site, and we'll open up access to a select few pages in the next task. So our basic problem is: How can we check, on every request, for a user's login cookie?

One approach would be to write a method that checked for the cookie, and to then call that method within every `get` and `post` method. That would be very tedious, and we'd surely forget to call it at some point, exposing pages to users that aren't logged in. We can hear you exclaim, "Surely, there must be a better way!" Turns out, there is.

As part of the `Webapp2` framework, each handler class can define a method `initialize` that will be run for every request that is received by that handler, just before our `get` and `post` methods are called. Furthermore, if we put this method in the `Handler` class, all of our other handler classes will have it as well! Neat, huh?

**Task #5**: This is a larger task, so let's break it up into steps:

1. Within the `Handler` class, define an initialize method:
    ```python
    def initialize(self, *a, **kw):
        webapp2.RequestHandler.initialize(self, *a, **kw)
    ```
    This method will run for each incoming request. Since we're not totally sure what the built-in `initialize` method of `webapp2.RequestHandler` does -- if it does do anything, it's probably important -- let's make sure we call it first.
2. Read the value of a cookie named `'user_id'` and store it in a variable named `user_id`.
3. Check to see if the value read into `user_id` exists (in other words, is not `None`). If so, retrieve the `User` object that has the given id: `user = User.get_by_id(int(user_id))`. Then set `self.user = user` so that code run later on in the processing of the request will be able to access the user object as well.
4. Otherwise, `user_id` will be `None` and we should redirect to the login page: `self.redirect('/login')`. This should be an `else` clause that goes with the `if` clause from step 3.


<aside class="aside-note" markdown="1">
The `initialize` method that we've written here is sometimes referred to as a **request filter**, since it allows for a specific action to be applied to all incoming requests -- or at least those to handlers extending `Handler`.
</aside>

<aside class="aside-warning" markdown="1">
Upon completing this task, your code will be very, very broken. Don't worry, it's not your fault. We've guided down your path, and we'll fix it in a moment.

But consider what would happen were you to try to run your app:
1. You start up your app and try to request a page, say the the main page at the route `/`.
2. Our fancy new `initialize` method would be called, to check for a `user_id` cookie.
3. Upon finding such a cookie doesn't exist (we just added the code to set cookies, after all), you would be redirected to the login screen, `/login`.
4. When the redirect request is received by the app, you would go back to step 2, thus kicking off a circular and inescapable sequence of requests.
</aside>

### Allowing Access to Select Pages

Let's fix the issue that we just created. We'd like to allow *all* visitors to access the pages at `/login` and `/register`. After all, if we didn't, how could new users register? And how could existing users log in?

**Task #6**: Near the top of `main.py`, just below the definition of `terrible_movies`, define a new list named `allowed_routes` that contains the strings `'/login'` and `'/register'`. Back in the `initialize` method of the `Handler` class, modify the code that you wrote at the end of the previous task to only redirect the user to `/login` if the value of `self.request.path` is not in the `allowed_routes` list. This will require swapping your `else` for an `elif`.

Upon completing this task, users that are not logged in will be directed to `/login` when trying to access a restricted page. The pages at `/login` and `/register` will be unrestricted (i.e. all users will be able to access them). And logged in users will be able to access any page within the site.

### Our First Test

At this point, you should be able to fire up your application and test! In general, when making lots of changes to a program, we recommend testing as soon as your new code is expected to function. And we're at such a point right now. While we're not done implementing all of the features for today, the code you have now should run and work as advertised.

Start up the application, and check that:
1. When trying to access the root path `/`, you are redirected to the login screen.
2. You are able to login with an existing account.
3. If you don't have an account, or forgot your credentials, you can access `/register` to create a new one.
4. After logging in, you are redirected to the root path `/`, with a welcome message (the code to do this was added in Studio 7).
5. If you then access another page, such as `/ratings`, you are not asked to login, and are allowed to directly access the page.

### Logging Out a User

So far, we can log a user in, but not out. This turns out to be much simpler than the rest of the tasks we've taken on so far.

**Task #7**

1. In the `Handler` class, create a method `logout_user` that takes only one argument, `self`, and has only one line: `self.set_cookie('user_id', '')`. This will set the `user_id` cookie to be empty, so that the next time the user requests a page they are not recognized by our `initialize` method.
2. Add a new route at the bottom of `main.py`: `('/logout', Logout)`.
3. Create the handler class, `Logout`, referenced by the route from 2. It should extend `Handler`, just as our other handler classes do.
4. Create a `get` method in the `Logout` class. It should look like this:
    ```python
    def get(self):
        self.logout_user()
        self.redirect('/login')
    ```
5. In the `base.html` template, add a third `<li>` element to the list of links:
    ```html
    <li><a href="/logout">Log Out</a></li>
    ```

When you're done, test the change! You should be able to log in, click on the logout page, and then be forced to log in again before accessing `/`, `/add`, or other restricted pages.

## Conclusion

Congratulations! You implemented code that allows for user login status to be managed with cookies. That's no small task for a new web programmer.

You may notice one fatal issue with our application. While we can log in and log out, movie data is still being shared among all users. Furthermore, if you're even more astute, you've noticed that user passwords are being stored in plain text in the database. We'll tackle both of these issues in the next two studios.

[get-the-code]: ../getting-the-code/
