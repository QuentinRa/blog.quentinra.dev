# document

[Go back](..#js-for-websites)

<hr class="sl">

## Get tags (common way)

```js
// get the element having id="id"
let div = document.getElementById('id');
// get the elements having a_class in class="a_class ....".
let divs = document.getElementsByClassName('a_class');
// get all links (a tags)
let tab_links = document.getElementsByTagName('a');
```

<hr class="sl">

## Get a tag

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
document.querySelector("div > a.a_class")
```

<hr class="sl">

## Using elements

Once you got an element (either by iterating an array
or using a selector returning an element), you can
call the properties like this

* ``e.href`` (a), `e.src` (img), ...
* you can add new ones (if you want)
* you can check if an element got a property

```js
if (e.hasOwnProperty('href')) {
    e.href // not undefined
}
```

* add or remove classes

```js
e.classList.add('test')
e.classList.remove('test')
```

* change the style (please use classes and not inline style, unless
you are practicing)

```js
e.style.width = "5px";
e.style.display = "none";
e.style.color = "red";
e.style.backgroundColor = "yellow";
// ...
```

* change the tag content

```js
e.innerHTML = "<b>test</b>"; // test in bold
e.innerText = "<b>test</b>"; // <b>test</b>
```

<hr class="sl">

## Other functions

* ``document.createElement('p')``: create a tag (ex: p)
* ``document.createTextNode('texte')``: same as "text"
* ``e.children``: all nested tags (a.k.a. children nodes)
* ``e.parentNode``: ancestor node (a.k.a. parent node)
* ``e.getAttribute(...)``: get an attribute value (like href, ...)
* ``e.setAttribute(...)``: set an attribute value (like href, ...)
* ``e.appendChild(...)``: add a child to e