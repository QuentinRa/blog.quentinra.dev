# Introduction

When this course will be complete, you may learn
here

* Javascript syntax
* how to validate a form using JS
* handling events in JS
* (may be added) riot.js
* (upcoming) use API in JS
* js animations libraries

Note that you can run some Javascript on any
website, and on internet explorer, using scripts
a hacker can do a lot of things on your computer.

Simply press ``F12`` or
`CTRL-SHIFT-I` (or right click > Inspect,
or "... > additional tools > dev tools"). Move to
"console" tab and here you got. Try tapping "5+5" for
instance then you should see "10".

When running a page with Javascript, the errors/prints/...
will be in the console. Anyone can see, modify, or
execute javascript.

<hr class="sr">

## Notes

Javascript base is made of the scripting language
ECMAScript. We are currently in ECMAScript12 (2021).
In the ancient times, JQuery was a popular library
adding a lot of useful stuffs in Javascript but now
quite a lot of these are directly served in Javascript
so modern developers aren't using as often as before.
For instance, Boostrap (the famous CSS framework)
removed the jQuery dependency in version 5.

If you are seriously planning to learn JavaScript,
the most famous websites are

* <https://www.w3schools.com/Js/default.asp>
* <https://developer.mozilla.org/en-US/docs/Web/JavaScript/Guide/Introduction>
* less famous but really good: <https://www.javascript.com/learn/> 
* not famous, but quite complete, maybe too much: <https://www.javascripttutorial.net/>

You may use JS to

* show a popup (or show/hide things in general)
* animations
* move the server-side code from PHP to JS (with Node.js)
* make AJAX requests and use web APIs
* show error messages, autocompletion, advanced
  form validation for HTML forms

<hr class="sl">

## My first script

You can either write JavaScript inside the console
or write a ``.js`` file. If you want to write
some JavaScript for your website, then you can
use a ``<script>`` tag.

```html
<script>
    // some javascript
    alert('Hello, World')
</script>
<!-- or if you are using a file -->
<script src="file.js"></script>
```

with ``file.js``

```js
// show a popup with 'Hello, World'
alert('Hello, World')
// print in the console 'Hello, World'
console.log('Hello, World')
```

<hr class="sr">

## Syntax

...

**BEWARE**: sometimes you wrote some Javascript, go back
to your page, F5, and then you don't see any changes
(or your script isn't working). This may happens because
your CSS/JS got cached by your browser so try updating
the cache with 

* CTRL+SHIFT+F5
* CTRL+F5
* CTRL+R
* CTRL+SHIFT+R