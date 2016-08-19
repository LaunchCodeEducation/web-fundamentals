# Class 8 Prep

### Databases, Part I

Up to now, you may have had the feeling that the apps we're building in the lessons, studios, and assignments don't seem that useful. If you thought harder about it, you may have determined that this is true because we don't have a way to store data over long periods of time. Actually, we haven't been able to store data for more than the duration of a single HTTP request, say, by adding and element to a list.

We're going to plug this functional hole across the next two lessons by learning how to store data in databases. In this lesson, we'll learn about **relational databases**, the most common way store data. We'll learn about tables, rows, and queries. We'll also learn how to read data from such databases in our web apps.

In the next lesson, we'll learn how to write code that allows our data to be stored in a database *without* using queries. We'll still need SQL to read data, though.

Task | Resource Type | Link | Instructions
|----|---------------|------|-------------|
Do | Exercises | [SQL Bolt][sql-bolt] | Complete exercises 1-5 (Lesson 5 is called "SQL Review: Simple SELECT Queries") at SQL Bolt. This will give you some basic practice with common queries. You'll learn a bit about SQL in an isolated setting, and then see how it can work in the context of a web application in the Udacity portion of the prep work.
Do | Interactive Course | [CS253: Lesson 3][lesson-3] | Do the first 25 items of Lesson 3. Stop when you get to the item titled *Google App Engine Datastore*. Be sure to read the notes below for tips on new and/or potentially confusing concepts.

#### Notes

* The quizzes in this lesson use some Python syntax that is new and potentially confusing. Don't get discouraged or spend too much time trying to understand each and every such line or piece of syntax. We'll point out to you which things you should know, and the main lessons you should learn from the examples and quizzes. **If you get hung up on a quiz, skip to the answer, and make sure you understand the mechanics of what is happening.** A good way to do this is to type out the solution to the quiz, and make a comment for each line, describing what each line of code is doing.
* In "Quiz: Implementing Tables in Python," the instructor uses syntax that is new to us to create a Class called `Link`. You don't need to grasp this syntax fully, though you can read about it in the official [Python documentation for `namedtuple`][namedtuple]. To do the quiz, just know that in the given code, `links` is a list of `Link` objects, and that each such object has the fields `id`, `submitter_id`, `submitted_time`, `votes`, `title`, and `url`. Thus, you can use syntax like `link.id` or `link.votes` to reference the associated fields for each `Link` object.
* In "Quiz: Querying," approach the problem by making named `submissions` and adding each `link` object with `submitter_id` equal to the given value, `62443`. Once you have such a list, sort it by time using this snippet:
    ```python
    submissions.sort(key = lambda x: x.submitted_time)
    ```
    This is the only clean way to do this, and it uses a new Python construct called a **lambda**. If you're curious, you can [read about lambdas][lambdas], but they're not that important for us now. The main takeaway from this quiz should be how much work we would have to do to query and sort lots of lists in Python code. Such operations will be much easier with relational databases. If you get stuck on this quick, don't worry about it too much. This is one of those moments where the course introduces something new that we'd rather not have you wade through to learn at this point of the class. It's better to understand the idea that's being illustrated rather than the coding details for this one.
* A few types of relational databases are mentioned as being common. To make this a bit more concrete for you, we'll point out that [learn.launchcode.org][learn.launchcode.org] uses Postgres, while [launchcode.org][launchcode.org] uses MySQL. You generally can't tell which database a website or web application is using without digging into its code.
* In "Quiz: Databases in Python," we see `*` used again. It may not be obvious, but this is the exact same `*` syntax that we ran into in Class 7. The expression `link = link(*link_tuple)` says, "set `link` equal to a new `link` object created with the parameters in `link_tuple`". The important thing to notice here, is that the code is creating new `link` objects from the data queried from the relational database. This is the opposite of what's being done earlier in the quiz, to place the data from the `link` objects in the database.


[lesson-3]: https://classroom.udacity.com/courses/cs253/lessons/48756013/concepts/487123160923#
[namedtuple]: https://docs.python.org/2/library/collections.html#collections.namedtuple
[lambdas]: http://www.secnetix.de/olli/Python/lambda_functions.hawk
[learn.launchcode.org]: https://learn.launchcode.org/
[launchcode.org]: https://www.launchcode.org/
[w3c-sql]: http://www.w3schools.com/sql/default.asp
[sql-bolt]: https://sqlbolt.com/
