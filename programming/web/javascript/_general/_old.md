# JavaScript

**[Updated notes](index.md)**

<hr class="sr">

## Basic Syntax

* [Functions](syntax/function.md)

You may use this too, but for some, the syntax above will be enough

* [Exceptions](syntax/exceptions.md)
* [Classes and objects](syntax/classes.md)
* `JSON.stringify(v)`: convert v to a string
* `JSON.parse(string)`: parse back a string to a value

The <b>semicolon</b> <code>;</code> at the end of a line is optional. You may use it if you make more than one expression per line.

You can make <b>comments</b> using <code>/* a comment */</code> or <code>// a comment</code> as you would in Java/C.

You can add ["use strict"](https://www.w3schools.com/js/js_strict.asp) inside a file/function to disallow the use of non-declared variables, and throw errors instead of ignoring "bad syntax".

* [Spread syntax](syntax/spread.md)

<hr class="sl">

## REST API

You got another course "API", explaining what's an API and a lot of related stuff. Let's take the [Musicbrainz API](https://musicbrainz.org/doc/MusicBrainz_API) for example,

* [this URL](https://musicbrainz.org//ws/2/release?artist=65f4f0c5-ef9e-490c-aee3-909e7ae6b2ab&status=bootleg&type=live&limit=1&fmt=json) is returning **one album** made by [Autechre](https://en.wikipedia.org/wiki/Autechre).
* Here, we are considering that, like the URL above, you got a URL allowing you to fetch a result from your API
* I'm going to explain how from this URL, you can get the result and use it in your code

When you are calling an API, you are requesting something from another website, this is not immediate. If you are waiting for the result, you won't be able to use JavaScript until the call is done (😨). We are making **asynchronous calls** (=in parallel to your code) to prevent this. I was taught XMLHTTPRequest, which need to be wrapped inside a **Promise** (asynchronous code) but **fetch** <small>(native function)</small> is already doing this making the code cleaner than ever.

* [XMLHttpRequest](api/request.md)
* [Promises](api/promises.md)
* [Fetch](api/fetch.md) 😍
* [Async/await](api/async.md)
* [Example API - MusicBrainz](api/example.md)
<hr class="sl">

## External resources

**Guidelines**

* [W3Schools - Guidelines](https://www.w3schools.com/js/js_conventions.asp) with [their best practices](https://www.w3schools.com/js/js_best_practices.asp) and the [common mistakes](https://www.w3schools.com/js/js_mistakes.asp)
* [Airbnb JavaScript Style Guide](https://github.com/airbnb/javascript)
* [clean-code-javascript](https://github.com/elsewhencode/project-guidelines) (😍, I didn't read everything, but I took note of a lot of things for later)

**CheatSheets**

Any cheatsheet is longer and more complete than this course 😭. Still, this one [javascript-cheatsheet](https://raw.githubusercontent.com/iLoveCodingOrg/javascript-cheatsheet/master/js-cheatsheet.pdf) ([source](https://github.com/iLoveCodingOrg/javascript-cheatsheet)) is quite good and the most readable of them. This [one is quite good too (codewithharry)](https://www.codewithharry.com/blogpost/javascript-cheatsheet), and this [one is good (pythoncheatsheet)](https://javascript.pythoncheatsheet.org/).

<hr class="sr">

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
* <https://javascript.pythoncheatsheet.org/>
* <https://mbeaudru.github.io/modern-js-cheatsheet/>