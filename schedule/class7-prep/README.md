# Class 7 Prep

### Templates

Thus far, on the back-end, we have managed HTML by storing it in big chunks, as strings, inside our Python code. You probably found this process tedious and annoying. Fortunately there is a much nicer way of constructing HTML content to send back to the client. Using what's called a *template* engine, we can specify our HTML as a "template" inside a regular `.html` file, and simply leave a few "blank spaces", so to speak, wherever we want to place dynamically-generated content. Then our back-end code simply needs to "fill in the blanks". In this lesson you will learn how to use a Python template engine called Jinja 2.

Task | Resource Type | Link | Instructions
|----|---------------|------|-------------|
Do | Interactive Course | [CS253: Lesson 2a][lesson-2a] | Do the entire lesson, 18 items in all. Be sure to read the notes below for tips on new and/or potentially confusing concepts.

#### Notes
* In the first lesson, "Quiz: Writing a Basic Form," the isntructor casually introduces some Python syntax that we haven't encountered before. In the `Handler` class, the first method looks like this:
    ```python
    def write(self, *a, **kw):
        self.response.out.write(*a, **kw)
    ```
    The arguments `*a` and `**kw` look different than anything we've seen, don't they? In Python, the symbols `*` and `**` can be used to represent *sets of arguments*, rather than just a single argument. We're goint to avoid using this new syntax in our studios, and you won't need it to complete studios or assignment. If you want to learn a bit about these special types of arguments, read the article [`*args and **kwargs in Python Explained`](https://pythontips.com/2013/08/04/args-and-kwargs-in-python-explained/). (Note that the symbols `*` and `**` are the only important things here; we can use either `*a` or `*args` with the same result.)
* In the setup for "Quiz: FizzBuzz," the instructor quickly explains the expression `n = n and int(n)` which is likely confusing. What he says is that this expression is the same as saying: if `n` exists and is not `None`, then set `n = int(n)`. Why do we do this? If we were to try something like `int("")` or `int(None)`, then Python would thrown an error. So this check avoids that situation. But how does the check actually work? Read section 9.5 of the article, [Notes about booleans and logical operators](http://www.thomas-cokelaer.info/tutorials/python/boolean.html) for a quick overview, and as your instructor or TF if it's still confusing.

[lesson-2a]: https://classroom.udacity.com/courses/cs253/lessons/48538421/concepts/487274210923#
