---
title: 'Studio: FlickList 11'
currentMenu: studios
---

## Walkthrough

In today's walkthrough, your instructor will add a few Bootstrap features to Flicklist:
- Add the Bootstrap CSS and JS files, along with jQuery, by adding header elements that reference the Bootstrap and jQuery CDN resources.
- Add a Navbar in `base.html` to dress up site navigation.
- Use [Bootstrap's Grid System](http://getbootstrap.com/css/#grid) to add a single-column grid layout in `base.html` using `container`, `row`, and `col-md-*` classes.

## Studio

You're about to embark on a creative Bootstrap adventure! Let's get ready.

### Checking out the Studio code

Before getting the starter code for this studio, fetch updates from the main repository:

```nohighlight
$ git fetch origin
```

Follow the [instructions for getting the code][get-the-code] in order to get the starter code for `studio11`.

### Your Tasks

In this studio you'll channel your own creative intuition to make Flicklist look even better with Bootstrap.

Spend the studio time adding additional Bootstrap features to Flicklist.

Spend some time reading the [CSS](http://getbootstrap.com/css/) and [Components](http://getbootstrap.com/components/) sections of the Bootstrap documentation, and thinking about what might work well in Flicklist. Decide on at least a couple of Bootstrap features to use.

Which ones you add are up to you, but here are some suggestions:

#### Forms

[Bootstrap Forms](http://getbootstrap.com/css/#forms) are part of the CSS component of Bootstrap, and provide a set of classes to make form layouts and form elements look nice, clean, and readable. Using the examples in the documentation, add some Bootstrap form styles to some or all of the sites forms: login, register, ratings, and add movie.

#### Alerts

[Bootstrap Alerts](http://getbootstrap.com/components/#alerts) allow you to draw attention to and provide meaningful context to important messages. Following the example code, add one or more alerts. Here are a few places where Flicklist currently displays alert-like messages:
- Validation errors from form submission. *Note:* You'll probably want to move the location of these messages in the template for optimal display.
- Confirmations: `add-confirmation.html`, `watched-it-confirmation.html`, `rating-confirmation.html`

#### Glyphicons

[Glyphicons](http://getbootstrap.com/components/#glyphicons) are a Bootstrap component that uses a special font to allow easy inclusion of small icons in various places. These are typically used to provide helpful visual cues as to what a user is looking at, or the actions that a user might take.

Glyphicons can be added almost anywhere within your site: on buttons, in links, in headers, and so on.

Find a few glyphicons that can improve the look of Flicklist. We think `glphyicon-film` should definitely be used somewhere!

#### Tables

Consider converting the display of movie lists -- on the "My List" and "My Ratings" pages -- to use tables to display movies. Then you can use [Bootstrap Table styles](http://getbootstrap.com/css/#tables) to improve on the crummy default styling for tables!

## Show Off Your Work!

Post a screenshot of one of your Flicklist pages to the `#showcase` channel on Slack. Include a brief description of what parts of Bootstrap you used.

[get-the-code]: ../getting-the-code/
