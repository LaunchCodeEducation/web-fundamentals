---
title: 'Studio: FlickList 3'
currentMenu: studios
---

The big new concept for this studio is that of *validation*. Sometimes, the user submits data through a form that, for one reason or another, is not acceptable. In that case, we must tell them what they did wrong, and give them a chance to try again.

## Walkthrough

If you want to code along with today's (or any day's) Walkthrough, simply `checkout` the appropriate walkthrough branch:

```nohighlight
$ git checkout walkthrough3
Branch walkthrough3 set up to track remote branch walkthrough3 from origin.
Switched to a new branch 'walkthrough3'
```

<aside class="aside-note" markdown="1">
Before doing this, you will want to make sure you do not have any uncommitted changes.
</aside>

The main things we will do during today's walkthrough are:

1. First, we will write a function via which we can fetch the user's (pretend) current watchlist.
	- And then, rather than hard-code the movie titles directly into our dropdown menu, we will dynamically build the dropdown based on the  current list.
	- In the process, we will see a new Python function, the `str.format` method.
2. The main feature we will add is the inclusion of some validation on the `watched-it/` route method:
	- When the user wants to take a movie they have watched off their list, we will make sure the movie is actually on the user's list in the first place.
	- If not, we will *redirect* the user back to the home page.
		- And we will pass along a helpful error message as a *query parameter* in the URL
			- But spaces aren't allowed in URLs! So we'll need to *escape* the error message
	- Back on the homepage, we will display the error message, if it exists.
3. We will also answer the following question: Why is this back-end validation necessary? Doesn't the dropdown menu on the front-end already prevent the user from choosing a movie that isn't on their list?

## Studio

For Studio, your job is to include some validation on the `/add` route, to make sure the app responds appropriately no matter what the user has typed into that form.

### Checking out the Studio code

As usual, you should commit any uncommitted changes (if you have any), and then `checkout` today's studio branch:

```nohighlight
$ git checkout studio3
Branch studio3 set up to track remote branch studio3 from origin.
Switched to a new branch 'studio3'
```

Next time, we will start to ween you off of these specific commands, and simply refer you to [generic instructions for checking out the starter code][get-the-code].

### Your Task

As mentioned, your job is to provide more validation of the user's input. There are three things that might go wrong:

1. The user might try to add a so-called "movie" whose title is something like `"<button>Hacker Apocalypse</button>"`. You can try this now and see for yourself what happens... the confirmation page will actually contain a real button! That's not good.

  Use the `escape` function from the `cgi` module in order to ensure that the user's input is properly escaped from the HMTL context.

2. The user might fail to type anything at all, and then click the `Add It` button. If the user does not specify a movie, then you should reject their form submission, and redirect them back to the home page, with an error message that says something like

	> Please specify the name of the movie you want to add

3. The user might try to add a movie that [sucks][nine-lives-trailer]. Indeed, your users don't always know what's in their best interest, and there are times when it is best to intervene. Near the top of your `main.py` file you will see a variable called `terrible_movies`, which defines a list of movies that should be absolutely forbidden. If the user tries to add one of the movies in that list, you should redirect them back to the homepage with an error message that says something like:

	> Trust me, you don't want to add 'Nine Lives' to your Watchlist.


[nine-lives-trailer]: https://www.youtube.com/watch?v=dPxI4yOKdgc
[get-the-code]: ../getting-the-code/
