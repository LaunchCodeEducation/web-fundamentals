# Class 10 Prep

### User Accounts and Security, Part I



Task | Resource Type | Link | Instructions
|----|---------------|------|-------------|
Do | Interactive Course | [CS253: Lesson 4][lesson-4] | Do the first 15 items of Lesson 4. Stop when you get to the item *Cookie Hashing*. Be sure to read the notes below for tips on new and/or potentially confusing concepts.


#### Notes

* The beginning of this lesson focuses on a new aspect of web programming: cookies. To understand cookies properly, a solid grasp of HTTP mechanics is crucial. You may find it useful to review the [HTTP Intro][http] article that we read earlier in the unit.
* **Hashing**: If you have some previous programming experienc, you may have encountered hash tables and their associated hash functions. The discussion of hashing in this lesson is different, but related. Don't try to conflate the two concepts.
* In "Quiz: Verifying Hashed Cookes," you'll need to split a string of the form `key,val` into two separate strings, `key` and `val`. There's a useful function that will do this for you: [str.split()][str-split]. Calling `str.split('a,b', ',')` returns the list `['a', 'b']`. You can get the effect by calling `'a,b'.split(',')`

[lesson-4]: https://classroom.udacity.com/courses/cs253/lessons/48666069/concepts/486736220923#
[http]: https://dev.opera.com/articles/http-basic-introduction/
[str-split]: https://docs.python.org/2/library/stdtypes.html#str.split
