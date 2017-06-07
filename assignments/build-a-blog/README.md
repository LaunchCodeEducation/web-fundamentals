---
title: 'Assignment: Build-a-blog'
currentMenu: assignments
---


In this assignment, we will build a web app that displays blog posts on a main page and allows users to add new blog posts on a form page. After submitting a new blog entry on the form page, the user is redirected to a page that displays only that blog (rather than returning to the form page or to the main page). Each blog post has a title and a body. To get an idea what the finished project should look like and how it should function, check out this [video]:

<div class="youtube-wrapper"><iframe width="560" height="315" src="https://www.youtube-nocookie.com/embed/xXuWBPSVd2U?rel=0" frameborder="0" allowfullscreen></iframe></div>

We'll build this app incrementally and refactor as needed along the way. The general steps we'll follow are:

- [Project Setup](#project-setup)
- [List and Create Blog Posts](#list-and-create-blog-posts)
- [Display Individual Entries](#display-individual-entries)
    - [Use Case 1](#use-case-1)
    - [Use Case 2](#use-case-2)
- [Bonus Missions](#bonus-missions)

## Project Setup

Create a new directory called `build-a-blog`, and then set up a local Git repository and a remote repository on GitHub. See the [Web Caesar setup instructions](../web-caesar/#git-repository-setup) if you need to review that process. Then set up a user and database in *phpMyAdmin* for this project. We recommend you use the name `build-a-blog`, but the password is up to you. Just remember that you will need to put all of that info into your database connection string. For refreshers on these parts of the process, re-visit [FlickList 6](../../studios/flicklist/6/#create-mysql-user-and-database) and [Database Configuration](../../videos/get-it-done/db-configuration). You'll also want to activate your `flask-env` virtual environment.

## List and Create Blog Posts

If you think about it for a minute, the behavior of creating a blog post, saving it to the database, and displaying blog posts is essentially what we did with tasks in the *Get It Done!* example app. The main difference between the two is that the blog post submission form and blog post listings will be on separate pages in our *Build-a-Blog* app. Go back to your code for *Get It Done!*, or use [ours](https://github.com/LaunchCodeEducation/get-it-done/tree/52ec146dc2f9943a011dd46d4a546b75703c226f), and use it as a model to set up the beginnings of your blog app.

First, set up the blog so that the "add a new post" form and the blog listings are on the same page, as with *Get It Done!*, and then separate those portions into separate routes, handler classes, and templates. For the moment, when a user submits a new post, redirect them to the main blog page.

Make sure you can say the following about your app:

- The `/blog` route displays all the blog posts.

- You're able to submit a new post at the `/newpost` route. After submitting a new post, your app displays the main blog page. 

- You have two templates, one each for the `/blog` (main blog listings) and `/newpost` (post new blog entry) views. Your templates should extend a `base.html` template which includes some boilerplate HTML that will be used on each page.

- In your `base.html` template, you have some [navigation links](https://www.w3schools.com/tags/tag_nav.asp) that link to the blog home, and the add new blog page.

- If either the **blog title** or **blog body** is left empty in the new post form, the form is rendered again, with a helpful error message and any previously-entered content in the same form inputs.

By the time you've checked off each of these, you're app should behave like this: 

<div class="youtube-wrapper"><iframe width="560" height="315" src="https://www.youtube-nocookie.com/embed/2m-hp1oy7NI?rel=0" frameborder="0" allowfullscreen></iframe></div>

Now you're ready to dive in to the next step. Nice work!

## Display Individual Entries

Let's add the ability to view each blog all by itself on a webpage. Instead of creating multiple HTML files, one for each new blog post we create, we can use a single template to display a given blog's title and body. We'll designate which blog's data we want displayed by using a query param containing the id for that blog in the url. Then the request handler can dynamically grab the blog that corresponds to that id from the database and pass it to the template to generate the desired page.

There are two use cases for this functionality:

- **Use Case 1:** We click on a blog entry's title on the main page and go to a blog's individual entry page.

- **Use Case 2:** After adding a new blog post, instead of going back to the main page, we go to that blog post's individual entry page.

For both use cases we need to create the template for the page that will display an individual blog, so start by making that. All it need do is display a blog title and blog body. Next, we'll tackle the use cases one at a time. 

But first, a reminder! It's been a little while since we used query params and `GET` requests, so it will be a useful reference and review to look at the lesson [Forms in Flask](../../videos/forms-in-flask), especially the section [Accessing Get Request Parameters](../../videos/forms-in-flask/#accessing-get-request-parameters).

### Use Case 1 

One of the first and easiest changes is to make the header for the blog title on the home page be a link. But what url do we want it to link to? Well, this is the format that we want the url of a single blog entry to have: `./blog?id=6` (Here *6* is just one example of an id number for a blog post.) So using jinja2 templating syntax, how can you make sure that each blog entry that is generated on the main page has an `href` with a query parameter corresponding to its id?

The next thing we need to determine is how we are going to handle an additional `GET` request on our homepage since we are already handling a `GET` request there. Of course, the difference is that in this use case it's a `GET` request *with query parameters*. So we'll want to handle the `GET` requests differently, returning a different template, depending on the contents (or lack thereof) of the dictionary `request.args`. 

Finally, we need to think about how the template is going to know which blog's data to display. The blog object will be passed into the template via `render_template`. What are the steps we need to take to get the right blog object (the one that has the id we'll get from the url) from the database and into the `render_template` function call?

### Use Case 2 

After solving Use Case 1, you should have the confidence to take on Use Case 2. For this use case, it's all in the timing. You've got to create a new database record for the blog entry that has just been submitted, but before redirecting, you need to grab the id for the record you just created. That way you'll know what url (i.e., what number to put on the right side of `?id=`) to redirect the user to after they submit their new entry. At the risk of spoiling all your fun, here's a [stack overflow post](https://stackoverflow.com/questions/8551952/how-to-get-last-record) you may find helpful if you get stuck.

At this point, your web app should display the functionality in the demo video below:

<div class="youtube-wrapper"><iframe width="560" height="315" src="https://www.youtube-nocookie.com/embed/xXuWBPSVd2U?rel=0" frameborder="0" allowfullscreen></iframe></div>

## Bonus Missions

Note: Be sure to commit and push your changes before proceeding to these extra tasks. That way you have a snapshot of your code when it met all the criteria above.

1. Add a CSS stylesheet to improve the style of your app. You can read about how to do so [here](https://stackoverflow.com/questions/22259847/application-not-picking-up-css-file-flask-python). And know that clearing your browsing data (especially your cached images and files) can help if you run into problems with your display not reflecting changes you make to your CSS stylesheet.

2. Display the posts in order of most recent to the oldest (the opposite of the current order).

## Submit

To turn in your assignment and get credit, follow the [submission instructions](../)


