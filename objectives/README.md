---
title: Objectives
currentMenu: objectives
---

## Learning Objectives

Listed below are the competencies you should demonstrate by the time you've completed the associated class's work.

### Class 1

#### HTML
- Identify the main type of content on the WWW
- Know what HTML stands for
- Describe the request/response flow defined by HTTP
- Describe the components of HTML tag structure
- Describe what an HTML element is, and how an element is related to a tag
- Name, describe the purpose of, and use common HTML tags: `<b>`, `<em>`, `<a>`, `<img>`, `<br>`, `<p>`, `<span>`, `<div>`, `<form>`
- Define HTML attributes and how they are used
- Describe how whitespace in HTML documents affects rendering
- Describe inline and block display; for common elements identify their default display
- Describe HTML document structure and associated elements: doctype, `<html>`, `<head>`, `<body>`, `<title>`
- Create a properly-structured document head

#### Git
- Describe the main functionality provided by a version control system (VCS)
- Describe the practical applications of this functionality: revision history, collaboration, backup
- Explain what a repository is
- Explain what a commit is
- Describe the basic commit flow and commands: status, add, commit, log
- Initialize a new Git repository
- Commit to a local repository
- Clone a project from a remote Git repository
- Explain the two Git file status: tracked and untracked
- Explain what types of changes should be within a commit

### Class 2

#### HTML
- Describe the purpose of, and use additional HTML tags: `<ul>`, `<ol>`, `<li>`, `<table>`
- Create HTML comments

#### CSS
- Explain how CSS allows for separation of display and document structure
- Describe the 3 locations that style rules may be placed: external, document, inline
- Use CSS rules at each of the 3 possible locations
- Describe precedence between CSS rules based on location
- Use basic CSS rule types: `font-size`, `color`, `font-family`, `background-color`, `text-align`, etc
- Describe the following simple selector types, and situations in which each is preferred: element, ID, class

#### Git
- Explain some common use cases for branches
- Identify the `master` branch as the default branch for most projects
- Create a new Git branch
- Checkout a branch
- Stash and un-stash changes making up partially-completed work
- Merge one branch into another
- Describe what happens when, during a merge, there are conflicting changes in the two branches
- Describe the common branching strategies of feature branches and long-running branches
- Describe what is remote repository is
- Create and push to a remote repository
- Collaborate with another student on a git project via GitHub

### Class 3

#### How the Web Works
- Identify the main parts of a URL and describe the role of each: protocol, host, port, path, query parameter, fragment
- Name the default port(s) for HTTP requests
- Name the two most common HTTP request types and describe common use cases for each
- Describe usage of HTTP request headers
- Provide examples of common request header parameters
- Describe common HTTP response status codes: 200, 404, 500
- Describe meaning of HTTP response headers, along with common response headers
- Describe the role of web servers in providing web content
- Explain the difference between static and dynamic requests/content
- Explain what a web application does
- Identify and explain the basic role of the components of network communication: HTTP, TCP/IP, DNS
- Explain the flow of an HTTP request made from a web browser

#### Hello World Flask Application
- Create a virtual Python environment using conda
- Activate a virtual environment
- Install packages into a virtual environment
- Create and run a basic Flask application

### Class 4

- Create an HTML form using `<form>`
- Create form input elements with common types: text, submit, password, email, checkbox, radio
- Use the `name` attribute of form inputs to name request parameters
- Create handlers in Flask for GET and POST request types
- Use the `value` attribute to specify the data value that is sent to the server upon form submission
- Describe the differences between GET and POST, and what each request type should be used for
- Describe common HTTP status codes by group (2xx, 3xx, 4xx, 5xx)
- Describe the common HTTP status codes: 200, 302, 400, 404, 405, 500
- Explain why we receive a 405 error when submitting a form to a handler with a decorator like `@app.route('/')`
- Use `str.format()` to create strings from template strings and data values

### Class 5

- Describe why we must validate form submissions, even when providing limited options via a form
- Describe the various ways that we can control and verify the data that users submit in an HTTP request: form restrictions, client-side validation, server-side validation
- Describe advantages and disadvantages of both client and server-side validation
- Validate request data based on numeric range or string length
- Return descriptive error messages within an HTML page when form data doesn't validate
- Upon validation errors, render a form with valid data left in-place
- Describe why HTML escaping is necessary when putting user-submitted data in a response
- Return a redirect response

### Class 6

- Describe the benefits of using templates
- Use the Jinja2 template environment
- Use autoescaping within Jinja2 templates
- Create stand-alone Jinja2 templates
- Pass data from request handlers into templates
- Create Jinja2 templates that use base templates and content blocks
- Write conditionals and loops within Jinja2 templates

### Class 7

* Explain what relational databases are used for and what SQL is
* Perform CRUD (Create, Read, Update, Delete) operations using SQL queries
* Explain what joins are used for
* Describe the difference between the four types of joins: inner, left outer, right outer, and full outer
* Write queries using joins
* Utilize foreign keys
* Explain the similarities between Python objects and database tables
* Create tables with an understanding of one-to-many relationships

### Class 8

* Utilize *phpMyAdmin* and build a database locally
* Create a new user and database
* Import tables using a `.sql` file
* Explain how and why data is split into related tables
* Perform complex SQL queries with joins and subqueries

### Class 9

* Install packages necessary for working with MySQL databases in Flask
* Configure SQLAlchemy within a Flask application, using Flask-SQLAlchemy
* Create a persistent class by extending `SQLAlchemy.Model`
* Create simple properties of type integer, string, and Boolean
* Create a primary key field on a persistent class
* Use a Python shell to create database tables based on persistent classes
* Store persistent classes using `SQLAlchemy.sesssion` and `SQLAlchemy.commit`
* Query for persistent classes using `Model.query.all` and `Model.query.filter_by`
* Destroy and recreate tables for persistent classes after updating a model class

### Class 10

* Create persistent `User` class
* User flash messages to communicate with the user
* Configure model objects to have one-to-many relationships
* Use sessions to store state across requests
* Use sessions to manage the state of a logged in user
* Use `@app.before_request` to check for a logged in user

### Class 11

*Coming Soon*

### Class 12

*Coming Soon*

### Class 13

*Coming Soon*

### Class 14

*Coming Soon*
