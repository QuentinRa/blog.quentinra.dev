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
```