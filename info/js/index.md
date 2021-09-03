# JavaScript

JavaScript (JS) base is made of the scripting language ECMAScript. We are currently in **ECMAScript2021** (v12). The most used version of JavaScript is **ECMAScript6** (2015). In the ancient times, JQuery was a popular library adding a lot of useful stuffs in Javascript, but now quite a lot of these are directly served in Javascript, so modern developers aren't using as often as before <small>(because removing it makes the website faster, increasing both performances and SEO)</small>. For instance, Boostrap (the famous CSS framework) removed the jQuery dependency in version 5 <small>(dropping Internet explorer support in the meantime)</small>.

* Learn the syntax
* How to validate a form (errors, autocompletion, ...)
* Handling events (clicks, show/hide something, ...)
* [Riot.js](https://riot.js.org/) (not available)
* How to use Web APIs (Rest, Ajax, promises, ...)
* My list of Javascript libraries

As always, you may learn JavaScript on [W3School](https://www.w3schools.com/Js/default.asp) or [MDN](https://developer.mozilla.org/en-US/docs/Web/JavaScript/Guide/Introduction). But, maybe those two may be worth a go [javascript.com](https://www.javascript.com/learn/strings) and [javascript tutorial](https://www.javascripttutorial.net/).

> **Note**: As you may have seen in the CSS course, instead of writing JavaScript, you can write **TypeScript** (sort of enhanced JavaScript) and **compile it in any version of JavaScript**.

<hr class="sl">

## Introduction

<table class="table border-dark table-striped table-bordered">
<thead><tr><th>Inline JS 🤮</th><th>SCRIPT tag 🤢</th><th>External JS 😍</th></tr></thead>
<tbody>
<tr>
<td>

You can write JavaScript directly inside a component using attributes such as `onmouseover`, `onclick`, `onsubmit` etc.
```HTML
<p onmouseover="console.log('some code')">
    ...
</p>
```
</td>
<td>

You can use one (or more) tag &lt;script&gt;, and put the JS inside.

```HTML
<script>
console.log('some code')
</script>
```
</td>
<td>

You can write JS in an external write, and link it to the HTML with

```html
<script src="/path/to/file.js"></script>
```

Same as I told you for CSS, this is the proper way to do (allows the use of CDN, JS in one place, CSP etc.).

</td>
</tr>
</tbody>
</table>

As you should have learned by now, you can see the JavaScript inside the console (Web course). You can either log using the console (👍) or using popups (👎)

```js
console.log("message")
console.error("error message")
console.warn("warning message")
console.info("message")
// or you can use a popup
alert('message')
```

<details class="pt-3">
<summary><b>HELP!</b> I wrote some JavaScript, but I don't see any changes!?</summary>

They may be two problems **1**: your code isn't working, or **2**: your page is rendering using the cached JavaScript.

* for **1**: check for errors in the console, try testing selectors in the console too
* for **2**: <kbd>CTRL+R</kbd> or <kbd>CTRL+SHIFT+R</kbd> or <kbd>SHIFT+F5</kbd> or <kbd>CTRL+F5</kbd>.

</details>

<hr class="sr">

## Basic Syntax

* [Variables](syntax/var.md)
* [Types](syntax/types.md)
* [Operators](syntax/operators.md)
* [Structures](syntax/structures.md)
* [Functions](syntax/function.md)

You may use this too, but for some, the syntax above will be enough

* [Exceptions](syntax/exceptions.md)
* [Classes and objects](syntax/classes.md)

<table class="table border-dark table-bordered table-striped">
<tr><th class="text-center">Other notes about the Language</th></tr>
<tr><td>
The semicolon <code>;</code> at the end of a line is optional. You may use it if you make more than one expression per line.
</td></tr>
<tr>
<td>
You can make comments using <code>/* a comment */</code> or <code>// a comment</code> as you would in Java/C.
</td>
</tr>
<tr>
<td>
Some parts in JavaScript are following the properties of functional languages.

* if a function does not return something, then it returns `undefined` (=a function must return a value)
* everything is a value
* a function can take a function, returns a function (functions are first-class citizen)
* [read more here](https://opensource.com/article/17/6/functional-javascript)

</td>
</tr>
</table>

<hr class="sl">

## Advanced syntax

Advanced do not mean more complex, it mean that you may not use this right now.

* [Spread syntax](syntax/spread.md)

<hr class="sr">

## JavaScript for websites

We are calling DOM the Document Object Model. The tags of your page are a tree, you got html, then head/body, etc. This is what the DOM is. You got a variable called `document` (shortcut of `window.document`), and you may ask it about node inside the tree.

* [document](web/document.md)
* [window](web/window.md)
* [forms](web/forms.md)
* [events](web/events.md)

<hr class="sl">

## REST API

You got another course "API", explaining what's an API and a lot of related stuff. Lets take the [Musicbrainz API](https://musicbrainz.org/doc/MusicBrainz_API) for example,

* [this URL](https://musicbrainz.org//ws/2/release?artist=65f4f0c5-ef9e-490c-aee3-909e7ae6b2ab&status=bootleg&type=live&limit=1&fmt=json) is returning **one album** made by [Autechre](https://en.wikipedia.org/wiki/Autechre).
* Here, we are considering that, like the URL above, you got an URL allowing you to fetch a result from your API
* I'm going to explain how from this URL, you can get the result and use it in your code

When you are calling an API, you are requesting something from another website, this is not immediate. If you are waiting for the result, you won't be able to use JavaScript until the call is done (😨). We are making **asynchronous calls** (=in parallel of your code) to prevent this. I was taught XMLHTTPRequest, which need to be wrapped inside a **Promise** (asynchronous code) but **fetch** <small>(native function)</small> is already doing this making the code cleaner than ever.

* [XMLHttpRequest](api/request.md)
* [Promises](api/promises.md)
* [Fetch](api/fetch.md) 😍
* [Async/await](api/async.md)
* [Example API - MusicBrainz](api/example.md)

<hr class="sr">

## My list of JavaScript libraries

This is more like a list of libraries to make some animations that a list of libraries 😋.

<details class="details-border">
<summary>Title</summary>
<br>

With [anime.js](https://animejs.com/) you do something like [this hand written animation](https://codepen.io/mellis84/pen/JpVZNw)

<div style="width: 500px;">

![title](title/handmade-title.gif)
</div>

You can use [Typed.js](https://mattboldt.com/demos/typed-js/) to get almost the same, but in a terminal.

You can find a lot of [simple animations here](https://animate.style/).
</details>

<details class="details-border">
<summary>Background</summary>
<br>

You can use a video as your page background with [bideo](https://rishabhp.github.io/bideo.js/).

You can add particles in the background of your pages with [particles](https://vincentgarreau.com/particles.js/).

Some [animations here](https://greensock.com/) are quite beautiful.
</details>

<details class="details-border">
<summary>UI</summary>
<br>

Create carrousels easily with [slick](http://kenwheeler.github.io/slick/).

You can create a sort of image flipper with [preloadjs](https://www.createjs.com/demos/preloadjs/preloadimages)

You can make a lot of funny animations with [anime.js](https://codepen.io/collection/XLebem/?grid_type).

You can use [Turn.js](http://turnjs.com/) to make a book with flippable pages but I didn't like it. [StPageFlip](https://nodlik.github.io/StPageFlip/) seems better. [PDF.js](http://www.page-flip.info/newspaper_wp/pdf-flipbook/#book_pdf/13) is beautiful too.
</details>

<details class="details-border">
<summary>Plots</summary>
<br>

[d3.js](https://www.d3-graph-gallery.com/index.html) is the most well-know library.
</details>

<hr class="sl">

## Sources

* <https://www.javascript.com/learn/strings>
* <https://www.w3schools.com/Js/default.asp>
* <https://www.w3schools.com/Js/js_versions.asp>
* <https://developer.mozilla.org/en-US/docs/Web/API/Window/localStorage>
* <https://www.javascripttutorial.net/javascript-anonymous-functions/>
* <https://developer.mozilla.org/fr/docs/Web/JavaScript>
* <http://www.iut-fbleau.fr/sitebp/web/wim41/js/dom.pdf>
* <http://www.iut-fbleau.fr/sitebp/web/wim41/js/js.pdf>
* <https://dwarves.iut-fbleau.fr/git/monnerat/wim4_2021/src/master/cours/jscomp.pdf>
* <http://pgsql.pedago.ensiie.fr/~vitera.y/cours/ipw/poly/03-applications-interactives.pdf>
* <https://developer.mozilla.org/en-US/docs/Web/JavaScript/A_re-introduction_to_JavaScript>
* <https://attacomsian.com/blog/xhr-post-request>