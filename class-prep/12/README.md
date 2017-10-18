---
title: Class 12 Prep
currentMenu: classes
---

## The MVC Pattern

When working with web applications, there are a few widely-used approaches to organizing code to increase maintainability and flexibility, and separate responsibilities. Arguably the most important and widely-used of these is the **Model-View-Controller (MVC)** pattern.

MVC is a **design pattern**, which means that it is an approach to structuring code that can be applied in different languages and different settings. Lots of web frameworks in a variety of languages enable the easy creation of MVC applications, and MVC is even used in mobile and desktop applications.

As you work through the lesson materials, think about the applications you've been working on in class, and how they relate to MVC.

Task | Resource Type | Link | Instructions
|----|---------------|------|-------------|
Watch | Video | [What is Programming MVC](https://www.youtube.com/watch?v=1IsL6g2ixak) | Watch this video for a general intro to MVC concepts and the division of responsibilities it entails 
Read | Article | [MVC for Noobs](https://code.tutsplus.com/tutorials/mvc-for-noobs--net-10488) | Read this article on MVC. Don't worry if you do not totally understand the sections discussing cakePHP. This is just an example of how MVC can be implemented. Focus on the sections up to "OK, but Why a Framework". Note that the author states "MVC is not a design pattern", but MVC can be thought of as either an architectural *or* a design pattern, depending on your point of view
Do | Exercise | N/A | Complete the thought-exercise below
Do | Review | [Class 12 Prep Review](review.html) | Solidify your knowledge of the concepts covered in these lessons

## Exercise

Open up your `flicklist-flask` project. Let's think about it in terms of the MVC organization.

If you were to organize the application based on MVC principles, in which of the three components would you put:
- Jinja templates
- Handler classes and methods (e.g. `index` and `add_movie`)
- The `User` and `Movie` classes

<aside class="aside-note" markdown="1">
When building an application based on MVC, the different components should be in different files (and usually different modules, or packages). We clearly haven't been doing that. Instead, we've been focusing on the mechanics of web applications.

If you progress to one of the back-end skill tracks then you'll become all too familiar with proper organization of MVC applications.
</aside>
