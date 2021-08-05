# Events

[Go back](..#js-for-websites)

An event is something like clicking on a button, submitting
a form, ... You can set a function that will be executed
when an event is fired.

<hr class="sl">

## Linking events (HTML)

You can add 

```html
<button onclick="f()" onmouseover="f()" onmouseout="f()" onload="f()"></button>
<form onsubmit="return f();"></form>
<!-- ... -->
``` 

with 

* ``onsubmit``: true if we can submit the form, false else
* ``onclick``: trigger function on click
* ``onmouseover``: trigger function on mouse entering
* ``onmouseout``: trigger function on mouse exiting
* ``onload``: trigger function once loaded
* ...

<hr class="sr">

## Linking events (JS)

You can also add events manually, in a javascript file

```js
// ...
b.addEventListener("click", f, false)
b.removeEventListener("click", f, false)
// events names are: mousedown, mouseup, mouseover, mouseout, mousemove, keydown, change
```

<hr class="sl">

## Event function

It's a normal function but the function

* is taking ``e`` (the event that triggered the function)
* usually calling ``e.preventDefault();`` to tells others
that your function is handling the event (and to not do
the default behavior)

```js
function fonction(e){
    e.preventDefault();
    // ... your code ...
    // you may use
    e.target // get the component we clicked on
}
```