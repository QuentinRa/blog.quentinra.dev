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

## 🚀 Events 🚀

<div class="row row-cols-md-2 mt-4"><div>

* ➡️ Called when the visibility <small>(hidden, shown back)</small> of the page is changed <small>(ex: tab changed, minified...)</small>

```javascript
// ➡️  See "document.hidden" (boolean)
document.addEventListener('visibilitychange', () => {});
```
</div><div>

* ➡  Execute some code when a key is pressed

```javascript
document.onkeydown = e => {
    switch (e.code) {
        case 'KeyR': 
            e.preventDefault();
            // ...
            break;
    }
}
```
</div></div>

<hr class="sep-both">

## ⚡ Special features ⚡

<div class="row row-cols-md-2 mt-3"><div>

#### Notifications

[See NotificationsAPI](https://developer.mozilla.org/en-US/docs/Web/API/Notifications_API/Using_the_Notifications_API)

```javascript
if (Notification?.permission === "granted") {
    // send a notification
    const img = 'xxx.png';
    const notification = new Notification(title, { body: body, icon: img });
    // done
} else {
    // you may request permission first
    Notification.requestPermission().then()
}
```

#### LocalStorage

The localStorage is a storage inside the client browser. What's stored inside can be edited from the developers tools in the tab Application.

```javascript
// store
localStorage.setItem('key', 'value')
// get
const value = localStorage.getItem("key")
if (value != null) { /* ... */ }

localStorage.removeItem("key")
```

It's useful to store/cache some data, but you must take into account that the user can add/edit/remove them.

➡️To store an Object, use `JSON.stringify` and `JSON.parse`.

</div><div>

#### Popups

* ➡️ Show a popup with some message

```javascript
alert("XXX?")
```

* ➡️ Show a popup asking the user for input

```javascript
let value = prompt("XXX?", "defaultValueOfTheInputField")
if (value != null) {
    // ...
}
```

...
</div></div>

<hr class="sep-both">

## 👻 To-do 👻

Stuff that I found, but never read/used yet.

<div class="row row-cols-md-2"><div>

```javascript
document.createElement("div")
xxx.querySelector("xxx")
xxx.appendChild(node)
xxx.removeAttribute("hidden")
xxx.setAttribute("hidden", "")
xxx.replaceChildren() // remove children
xxx.replaceChildren(yyy, zzz)
xxx.innerHTML = ``
```
</div><div>

* SessionStorage
* ServiceWorkers

</div></div>