# JavaScript for Websites

<div class="row row-cols-md-2 mt-3"><div>

[JavaScript](index.md) is used since Web 2.0 to add interactivity

* 👉 Validate a form <small>(errors, autocompletion, ...)</small>
* 👉 Handling events <small>(clicks, show/hide something, ...)</small>
* 👉 Connect to an API <small>(fetch...)</small>
* ...
</div><div>

Some browsers may not support some newly added features.

* 🧪 See [caniuse](https://caniuse.com/) to see which browsers support a specific feature
* 🚀 If there is a heavy need for a feature, you can use [polyfill](https://polyfill.io/v3/) to load missing features. You can generate one [here](https://polyfill.io/v3/url-builder/).
</div></div>

<hr class="sep-both">

## Getting started

There are 3 ways to write JavaScript for a website.

<table class="table border-dark table-striped table-bordered">
<thead><tr><th>Inline JS 🤮</th><th>SCRIPT tag 🤢</th><th>External JS 😍</th></tr></thead>
<tbody>
<tr>
<td>

You can write JavaScript directly inside a component using attributes such as `onmouseover`, `onclick`, `onsubmit` etc. The [list is here (W3Schools)](https://www.w3schools.com/TAGs/ref_eventattributes.asp).
```HTML
<p onmouseover="console.log('Hello World')">
    ...
</p>
```
</td>
<td>

You can `<script>` tags

```HTML
<script>
// some JavaScript code
console.log("Hello World")
</script>
```
</td>
<td>

You can write JavaScript in an external file, and link it to the HTML with

```html
<script src="/path/to/file.js"></script>
```

This is the proper way to do it. It allows us to minify JavaScript, use CDNs, harden the CSP policy/caching, and it's easier to manage scripts.

</td>
</tr>
</tbody>
</table>

<hr class="sep-both">

## 👻 To-do 👻

Stuff that I found, but never read/used yet.

<div class="row row-cols-md-2"><div>

```javascript
const img = 'xxx.png';
const notification = new Notification(title, { body: body, icon: img });

xxx.removeAttribute("hidden")
xxx.setAttribute("hidden", "")

document.hidden
document.addEventListener('visibilitychange', () => {})

setTimeout(function () { },  xxx);
setInterval(function () { },  xxx);
```
</div><div>


</div></div>