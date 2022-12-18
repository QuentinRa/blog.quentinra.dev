# Events

[Go back](../../../../../archives/info/web/_old#javascript-for-websites)

An event is something like clicking on a button, submitting a form, ... You can set a function that will be executed when an event is fired.

<hr class="sl">

## Linking events (HTML)

You can add them directly inside the HTML <small>(not a good practice, but that's easy to do 😐)</small>, we are calling that inline-scripting

```html
<button onclick="inline_event(this)" onmouseover="inline_event(this)" 
        onmouseout="inline_event(this)" onload="inline_event(this)"></button>
<form onsubmit="return inline_event(this);"></form>
<!-- ... -->
```

with 

* `onsubmit`: true if we can submit the form, false else
* `onclick`: trigger function on click
* `onmouseover`: trigger function on mouse entering
* `onmouseout`: trigger function on mouse exiting
* `onload`: trigger function once loaded
* The [list is here (W3Schools)](https://www.w3schools.com/TAGs/ref_eventattributes.asp).

<hr class="sr">

## Linking events (JS)

You can also add events manually, in a JavaScript file

```js
// ...
b.addEventListener("click", js_event, false)
b.removeEventListener("click", js_event, false)
// events names are: mousedown, mouseup, mouseover, mouseout, mousemove, keydown, change
```

<hr class="sl">

## Event function

It's a normal function,

* taking `e` (the event that triggered the function)
* usually calling `e.preventDefault();` to tells others that your function is handling the event (and to not do the default behavior)

```js
// function for js events
function js_event(e) {
    e.preventDefault();
    // ... your code ...
    // you may use
    e.target // get the component we clicked on
}
// function for inline events
// you can remove "this" (when calling) if you don't need "target"
function inline_event(target) {
    // the component
    console.log(target)
}
```