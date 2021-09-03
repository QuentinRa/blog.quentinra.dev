# JavaScript

JavaScript (JS) base is made of the scripting language ECMAScript. We are currently in **ECMAScript2021** (v12). The most used version of JavaScript is **ECMAScript6** (2015). In the ancient times, JQuery was a popular library adding a lot of useful stuffs in Javascript, but now quite a lot of these are directly served in Javascript, so modern developers aren't using as often as before <span class="tms">(because removing it makes the website faster, increasing both performances and SEO)</span>. For instance, Boostrap (the famous CSS framework) removed the jQuery dependency in version 5 <span class="tms">(dropping Internet explorer support in the meantime)</span>.

* Learn the syntax
* How to validate a form (errors, autocompletion, ...)
* Handling events (clicks, show/hide something, ...)
* [Riot.js](https://riot.js.org/) (not available)
* How to use Web APIs (Ajax, promises, ...)
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

<hr class="sl">

## Advanced syntax

Advanced do not mean more complex, it mean that you may not use this right now.

* [Spread syntax](syntax/spread.md)

<hr class="sr">

## JS for websites

We are calling DOM the Document Object Model. This is your
whole website, the tags are making a graph called a tree
and the whole graph is called the DOM. You will use
a variable called `document` (shortcut of ``window.document``)
and call functions.

* [document](web/document.md)
* [window](web/window.md)
* [forms](web/forms.md)
* [events](web/events.md)

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
