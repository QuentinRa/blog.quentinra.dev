# document

[Go back](../../../../../archives/info/web/_old#javascript-for-websites)

Everyone knows about `getElementById`, `getElementsByClassName`, and maybe `getElementsByTagName` too. These are shortcuts of `querySelector` that is working like the operator `$` in JQuery. I listed every function you may use too.

<hr class="sl">

## Get elements (common way)

```js
// get the element having id="id"
let div = document.getElementById('id');
// get the elements having a_class in class="a_class ....".
let divs = document.getElementsByClassName('a_class');
// get all links (a tags)
let tab_links = document.getElementsByTagName('a');
```

<hr class="sl">

## Get elements using selectors

You can also use selectors (like in CSS or in JQuery)

```js
// getElementsByClassName('a_class')
document.querySelector(".a_class")
// document.getElementById('id');
document.querySelector("#id")
// document.getElementsByTagName('a')
document.querySelector("a")

// and you can do things like in CSS
// for instance 
// (check the section about selectors in the CSS course)
document.querySelector("div .container + p")
```

<hr class="sl">

## Using elements

Once you got an element (either by iterating an array or using a selector returning an element), you can call the properties like this

* `e.href` (tag a), `e.src` (tag img), ...
* you can add new ones (if you want)
* you can check if an element got a property

```js
if (e.hasOwnProperty('href')) {
    e.href // not undefined
}
// or
// either null or a value
let href = e.hasOwnProperty('href')
```

* add or remove classes

```js
e.classList.add('test')
e.classList.remove('test')
```

* change the style (please use classes and not inline style, unless you are practicing)

```js
e.style.width = "5px";
e.style.display = "none";
e.style.color = "red";
e.style.backgroundColor = "yellow";
// ...
```

* change the tag content

```js
e.innerHTML = "<b>test</b>"; // "test" (in bold)
e.innerText = "<b>test</b>"; // "<b>test</b>" (plain text)
```

<hr class="sl">

## Other functions

* `document.createElement('p')`: create a tag (ex: p)
* `document.createTextNode('texte')`: same as "text"
* `e.children`: all nested tags (a.k.a. children nodes 🙄)
* `e.parentNode`: ancestor node (a.k.a. parent node 🙄)
* `e.getAttribute(...)`: get an attribute value (like href, ...)
* `e.setAttribute(...)`: set an attribute value (like href, ...)
* `e.appendChild(...)`: add a child to e