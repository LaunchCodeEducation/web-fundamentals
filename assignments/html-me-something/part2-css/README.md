[< Back to Assignment page](..)

# Part 2: CSS

This is the second of two exercises, which build off of each other. You'll get comfortable with using CSS selectors and rules to dictate display, while keeping your styles separate from your content.

### Prerequisites
* You've completed [Part 1: HTML](https://github.com/LaunchCodeEducation/html-me-something/tree/gh-pages/html)
* Familiarity with the basics of CSS: where style rules can go, basic syntax, and a few rules
* You know how to use your browser's developer tools

### Tasks

1. Create a file named `styles.css` in your submission directory (`html-me-something/submissions/[USERNAME]`)
2. (Optional) Add a normalization stylesheet (see the Resources section below; either of those will work). You can either put these normalization rules at the top of your `styles.css` or you can add another file in the same directory and link it in to your HTML doc. This will "reset" some of your browser's built-in (and often unsightly) styles so that you are starting with a cleaner slate when you add your own styles.
2. Start adding styles in your `styles.css` file, being sure to link the stylesheet to your main document. Check out our [styled example](http://education.launchcode.org/html-me-something/submissions/chrisbay/index.html). Use "View Source", or inspect the example page with your browser's developer tools to learn how we did things. And be sure to use the References section below as you go. Here are some specific tasks you should complete:
    * Use [margin](http://www.w3schools.com/css/css_margin.asp) and [padding](http://www.w3schools.com/css/css_padding.asp) to space your elements in a visually pleasing way.
    * Use at least one of each of the following types of selectors: [element](http://www.w3schools.com/cssref/sel_element.asp), [class](http://www.w3schools.com/cssref/sel_class.asp), [id](http://www.w3schools.com/cssref/sel_id.asp).
    * Don't break these rules:
    	* Use document-level and inline styles sparingly, and only when absolutely necessary.
    	* At all costs, avoid adding HTML elements in order to achieve a specific visual effect.
    * As before, be creative! Make your page look great, and don't settle for checking off the items above. Have a look at [CSS Zen Garden](http://www.csszengarden.com) for inspiration (use your browser's dev tools to see how those pages' styles are built).
3. Commit your code to your fork and push (commands are below). Then, go back to the [main page](https://github.com/LaunchCodeEducation/html-me-something) and follow the submission instructions.

    ```
    $ git add .
    $ git commit -m "Added some killer CSS styling to my page"
    $ git push origin gh-pages
    ```

### Resources
#### General CSS
* [w3schools CSS Reference](http://www.w3schools.com/css/default.asp)
* [CSS Zen Garden](http://www.csszengarden.com)
* (Advanced) [Specifics on CSS Specificity](https://css-tricks.com/specifics-on-css-specificity/)
* (Advanced) [Specificity (MDN)](https://developer.mozilla.org/en-US/docs/Web/CSS/Specificity)

#### CSS Normalization
* [Eric Meyer's reset.css](http://meyerweb.com/eric/tools/css/reset/)
* [normalize.css](http://necolas.github.io/normalize.css/)
