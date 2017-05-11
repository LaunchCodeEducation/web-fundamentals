---
title: Class 12 Prep
currentMenu: classes
---

When working with web applications, there are a few widely-used approaches to organizing code to increase maintainability and flexibility, and separate responsibilities. Arguably the most important and widely-used of these is the **Model-View-Controller (MVC)** pattern.

MVC is a **design pattern**, which means that it is an approach to structuring code that can be applied in different languages and different settings. Lots of web frameworks in a variety of languages enable the easy creation of MVC applications, and MVC is even used in mobile and desktop applications.

As you work through the lesson materials, think about the applications you've been working on in class, and how they relate to MVC.

Task | Resource Type | Link | Instructions
|----|---------------|------|-------------|
Read | Assignment | [Blogz](../../assignments/blogz/) | Read the assignment specification in detail before coming to class. This will help you understand the context of the next studio, and give you a chance to ask questions about the assignment in class.
Read | Article | [Model-view-controller](https://en.wikipedia.org/wiki/Model%E2%80%93view%E2%80%93controller) | Read Wikipedia's article on MVC
Do | Exercise | N/A | Complete the thought-exercise below

## Exercise

Open up your `flicklist-python` project. Let's think about it in terms of the MVC organization.

If you were to organize the application based on MVC principles, in which of the three components would you put:
- Jinja templates
- Handler classes and methods (e.g. `Index` and `AddMovie`)
- The `User` and `Movie` classes

<aside class="aside-note" markdown="1">
When building an application based on MVC, the different components should be in different files (and usually different modules, or packages). We clearly haven't been doing that. Instead, we've been focusing on the mechanics of web applications.

If you progress to one of the back-end skill tracks then you'll become all too familiar with proper organization of MVC applications.
</aside>
