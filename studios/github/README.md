---
title: 'Studio: Github'
currentMenu: studios
---

## Getting Ready: Share Code

As you've learned, debugging code is an essential part of coding. When it comes to working with web pages, browser developer tools are indispensable.

In this course, we will mostly use Google Chrome as our browser. If you haven't installed Chrome, you can get it from [Google](https://www.google.com/chrome/browser/desktop/). Other browsers have good developer tools as well (Firebox, in particular) but we're going to stick with Chrome. If you are more comfortable with another browser, you'll find that most of the developer tools functionality exists in other browsers' dev tools as well.

Chrome's developer tools contain **a lot** of functionality, and we will only begin to touch on it here, learning about more if its functionality later in the unit. In this class, we'll learn about the tools available for working with HTML elements and CSS styles.

## Walkthrough

Prior to the studio, the instructor will lead the class through an overview of some basic functionality of Chrome's dev tools, including but not necessarily limited to:
- How to open dev tools
- Inspecting an element
- Finding and editing CSS rules that are applied to an element
- Modifying an element's HTML
- The difference between the content displayed when using "View Source" and what's in the Elements tab

## Making Headlines

Pick a news site ([The New York Times](https://www.nytimes.com/), for example), and use Chrome Dev Tools to modify one of the main articles to use a picture and text of your choosing. You can have fun with this (see our example below) and take a screenshot to use for a practical joke, if you like.

![Nelly / LC in NYT](lc-nelly-nyt.png)

<aside class="aside-warning" markdown="1">
When linking to an image, pay attention to the protocol -- either `http` or `https` -- of the site you are modifying, and of the image you are including. You can find the protocol at the beginning of the image URL.

If the site you are modifying was loaded over `https` and your image uses `http` then the image may not load properly. You should try to add `s` to the image protocol, and if that doesn't work, look for another image or modify a site that uses `http`.
</aside>

(Optional) Share your creation in the `#fake-news` channel on Slack, and see what others have created!

### Resources

* [Using Chrome Developer Tools: Elements](https://www.youtube.com/watch?v=nV9PLPFTnkE)
* [Chrome DevTools Documentation](https://developers.google.com/web/tools/chrome-devtools/)
