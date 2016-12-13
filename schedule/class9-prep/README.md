---
title: Class 9 Prep
---

### Databases, Part II

In the last lesson, we learned about relational databases, and while we interacted with data a little bit in our Python code, we mostly did so to illustrate database *concepts* rather than to illustrate how we'll work with databases going forward.

That's where this lesson comes in. We're going to learn how to store data from our web application in a database, and how to query the Google App Engine Datastore to retrieve our data. The techniques you'll learn here will be used in studios and assignments going forward.

Task | Resource Type | Link | Instructions
|----|---------------|------|-------------|
Do | Interactive Course | [CS253: Lesson 3][lesson-3] | Do the last 15 items of Lesson 3, from *Google App Engine Datastore* through the end of the lesson. Be sure to read the notes below for tips on new and/or potentially confusing concepts.
(Optional) Read | Wikipedia Article | [Object-relational Mapping][orm] | In this lesson, you learned how to store Python objects in a database. The objects we stored (instances of the `Art` class) were simple, with only 3 basic fields. But imagine that the `Art` class had an `author` field, which itself was an instance of an `Author` class. We'd expect that `Art` objects and `Author` objects would each be stored in their own table, right? But how exactly do these objects and their relationships get translated to a relational database, which stores data as rows and columns? The answer is a concept called **Object-relational Mapping**, or **ORM** for short. Get a high-level overview of this concept on Wikipedia. You'll encounter ORM libraries in nearly every web application setting.

#### Notes

* In the answer to "Quiz: Running Queries," it appears that a new art submission appears immediately after submitting the form. However, you'll find that you need to refresh the page once for the new art to appear. This is to be expected, even if it is different from what you see in the video.

[lesson-3]: https://classroom.udacity.com/courses/cs253/lessons/48756013/concepts/487342270923#
[orm]: https://en.wikipedia.org/wiki/Object-relational_mapping
