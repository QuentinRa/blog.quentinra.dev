# JavaScript for Websites

<div class="row row-cols-md-2 mt-3"><div>

[JavaScript](index.md) is used since Web 2.0 to add interactivity

* 👉 Validate a form <small>(errors, autocompletion, ...)</small>
* 👉 Handling events <small>(clicks, show/hide something, ...)</small>
* 👉 Connect to an API <small>(fetch...)</small>
* 🥂 For a programmer, it can be used on someone else's website, to automate a task, to bypass a restriction... 
* ...
</div><div>

Some browsers may not support some newly added features.

* 🧪 See [caniuse](https://caniuse.com/) to see which browsers support a specific feature
* 🚀 If there is a heavy need for a feature, you can use [polyfill](https://polyfill.io/v3/) to load missing features. You can generate one [here](https://polyfill.io/v3/url-builder/).

JavaScript (JS) is based on ECMAScript. **ECMAScript2016** (ES6) is fully supported since late 2016/early 2017, while for ES6+, providers/vendors are implementing the features they want.
</div></div>

<hr class="sep-both">

## Getting started

There are 3 ways to write JavaScript for a website.

<table class="table border-dark table-striped table-bordered">
<thead><tr><th>Inline JS 🤮</th><th>SCRIPT tag 🤢</th><th>External JavaScript file 😍</th></tr></thead>
<tbody>
<tr>
<td>

You can use attributes such as `onmouseover`, `onclick`, `onsubmit` etc. A [list can be found here (W3Schools)](https://www.w3schools.com/TAGs/ref_eventattributes.asp).

```HTML!
<p onmouseover="console.log('Hello World')">
    ...
</p>
```
</td>
<td>

You can use `<script>` tags.

```HTML!
<script>
// your JavaScript code
console.log("Hello World")
</script>
```
</td>
<td>

You can link an external file. This is the proper way to do it <small>(CSP policy+caching, CDNs, SoC...)</small>.

```html!
<script src="/path/to/file.js"></script>
```

⚠️ **Note**: Modern browsers are usually caching JavaScript files. If you changed a file, and don't see any changes, reload the page while ignoring the cache: <kbd>CTRL+SHIFT+R</kbd> or <kbd>SHIFT+F5</kbd> or <kbd>CTRL+F5</kbd>.
</td>
</tr>
</tbody>
</table>

<hr class="sep-both">

## Document Object Model

<div class="row row-cols-md-2"><div>

There is one big difference with usual JavaScript: there is a variable `window` for the tab in which the page is displayed. 

The **Document Object Model** (DOM) is a tree of **nodes** <small>(HTML tags)</small>. The root is `window.document` or the shortcut `window.document`.

```javascript!
document.head // access the head tag
document.body // access the body tag
// collection with every
document.forms // form
document.images // image
document.links // link
document.scripts // scripts
// 🥂 tip: collection to Array
Array.from(document.links)
```

To create a node, we use these. Note that by editing the innerHTML of an existing tag manually, you can avoid doing that.

```javascript!
const node = document.createTextNode("Some text")
const node = document.createElement("div")
```

To find a node, you can use

```javascript!
const xxx = document // you can put any Node here
// ex: only match <node id="id" />
const node = xxx.getElementById('id');
// ex: match <node class="a b c" />
const nodeList = xxx.getElementsByClassName('c');
// ex: match every link
const nodeList = xxx.getElementsByTagName('a');
// 🥂 You can use CSS selectors
const node = xxx.querySelector('#id');
const nodeList = xxx.querySelectorAll('table tr > .xxx');
```
</div><div>

```javascript!
// Navigate from one node to another
xxx.childNodes ; xxx.children
xxx.firstChild ; xxx.firstElementChild
xxx.lastChild ; xxx.lastElementChild
xxx.parentNode ; xxx.parentElement
// edit HTML
xxx.replaceChildren() // remove children
xxx.replaceChildren(node1, node2) // replace with ...
xxx.appendChild(node)
// edit attributes
xxx.hasAttribute('class')
xxx.getAttribute('class')
xxx.removeAttribute("hidden")
xxx.setAttribute("hidden", "")
xxx.classList.xxx("yyy") // add, remove, replace...
// edit content
xxx.innerHTML = `<p>You can write HTML</p>`
xxx.innerText = "<p>HTML won't be rendered</p>"
xxx.textContent = "<p>HTML won't be rendered</p>"
// other
xxx.outerHTML
xxx.nodeName // "HEAD"...
xxx.click() // fire a "click" event
```

You can also manually edit the style

```js!
xxx.style.width = "5px";
xxx.style.display = "none";
xxx.style.color = "red";
xxx.style.backgroundColor = "yellow";
// get effective style
const style = window.getComputedStyle(xxx)
if (style.visibility === 'hidden') { /* ..; */ }
```
</div></div>


<hr class="sep-both">

## 🚀 Events 🚀

<div class="row row-cols-md-2 mt-4"><div>

#### Listen to events

```html!
<!-- ❌ inside the HTML. Use this to get the button. -->
<button onclick="console.log(event, this)">xxx</button>
```

```javascript!
// ✅ inside the JavaScript
const btn = document.querySelector("...")
// only to add one listener
btn.onclick = (event) => { console.log(event, btn) }
// add as many listeners as you want
btn.addEventListener('click', (event) => { console.log(event, btn) })
```

Add `on` before the name, like `click` would become `onclick` to get the HTML attribute from a JSEvent.

* `click`: called when we clicked on the component
* `load`: called when the component was loaded
* `error`: called on loading error <small>(ex: loading image failed)</small>
* `mouseover`: trigger function on mouse entering
* `mouseout`: trigger function on mouse exiting
* [See: HTML events](https://www.w3schools.com/TAGs/ref_eventattributes.asp) and [Global attributes](https://developer.mozilla.org/en-US/docs/Web/HTML/Global_attributes)
</div><div>

Useful attributes/methods to call on an event are

* `event.preventDefault()`: don't further handle the event <small>(ex: stop a link from opening another page, a form from being submitted...)</small>
* `event.target`: the element on which we clicked/...

#### Examples

<p></p>

Execute code when the visibility <small>(hidden, shown back)</small> of the page is changed <small>(ex: tab changed, minified...)</small>

```javascript!
// ➡️  See "document.hidden" (boolean)
document.addEventListener('visibilitychange', () => {});
```

Execute some code when a key is pressed

```javascript!
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

## 🔎 Validating Forms 🔎

<div class="row row-cols-md-2 mt-3"><div>

You can listen to a [form](../../_general/random/forms.md) submission with `submit`/`onsubmit`. This event is particular, as **true** must be returned if we can send the form, **false** otherwise. It's used to validate a form, before sending it.

```js!
const form = [...]
form.onsubmit = (event) => {
    const form = event.target // if not stored
    // 🤔 using elements (array)
    const value = form.elements['name']['value'] // get

    // ✅ Using FormData
    let formData  = new FormData(form);
    if (formData.has('name')) {}
    formData.append('name', 'value') // add
    formData.set('name', 'value') // set
    const value = formData.get('name') // get
    for(const [name, value] of formData) {} // iterate
    // ...
    return false // false <=> don't send
}
```
</div><div>

You may know that you can validate an HTML form with attributes such as `minlength`... You can show custom errors, or further handle the verification in JavaScript.

```html!
<form novalidate></form> <!-- disable HTML errors -->
```

```js!
form.onsubmit = (event) => {
    const form = document.forms[0] // alternative
    const xxx = form.querySelector('#xxx')
    if (xxx.validity.badInput) {}
    if (xxx.validity.tooShort) {}
    if (xxx.validity.tooLong) {}
    if (xxx.validity.typeMismatch) {}
    if (xxx.validity.valueMissing) {}
    // ...
}
```
</div></div>

<hr class="sep-both">

## ✈ Request an API ✈

*See also, [APIs](/_programming/web/apis/index.md), and [Async, await, and Promises](/_programming/web/javascript/_general/index.md#-asynchronous-work-and-promises-)*

<div class="row row-cols-md-2"><div>

The [Fetch API](https://developer.mozilla.org/en-US/docs/Web/API/Fetch_API) is the easiest, and most used to do API requests.

```javascript!
// you can use a try-catch to catch errors
const res = await fetch("URL" , params)
// or
fetch('URL', params)
    .then(res => res.xxx())
    .then(xxx => /* ... */)
    .catch(err => /* ... */)
```

Note that `res` is a pending request, you need to ask for an output.

```javascript!
const json = await res.json() // as a json object
const text = await res.text() // as a string
```

```javascript!
// other
const value = res.headers.get('header-name')
```
</div><div>

**GET** is the default if no parameters were provided.

```javascript!
const params = { method: "GET", }
```

**POST/PUT/PATCH** are usually taking a **body**.

➡️ Note that the API may not require you to add headers.

```javascript!
const params = {
    method: "POST",
    body: JSON.stringify({ username: "xxx" }),
    headers: { 'Content-type': 'application/json; charset=UTF-8' }
}
```

```javascript!
const params = {
    method: "POST",
    body: 'xxx=value&yyy=value',
    headers: { 'Content-type': 'application/x-www-form-urlencoded' }
}
```

<details class="details-e">
<summary>Prior to 2015: XMLHTTPRequest</summary>

To code a simplified `fetch`, you could use the code below.

```javascript!
function fetchXXX(URL, params = undefined) {
    return new Promise((resolve, reject) => {
        const ajax = new XMLHttpRequest();
        ajax.onreadystatechange = () => {
            // we the loading is done
            if(ajax.readyState === XMLHttpRequest.DONE) {
                // 200, 201, ... are OK
                if (ajax.status >= 200 && ajax.status < 300)
                    resolve(ajax.responseText);
                else
                    reject(ajax.responseText);
            }
        }
        // use the provided method, or GET by default
        ajax.open(params?.method ?? 'GET', URL, true);
        // add headers
        for(const header in params?.headers) {
            ajax.setRequestHeader(header, params?.headers[header]);
        }
        // send the body, if any
        ajax.send(params?.body);
    })
}

// tested with GET+POST, 
// but the code is using a somewhat recent syntax
fetchXXX('https://jsonplaceholder.typicode.com/posts')
    .then((text) => console.log(text));
```
</details>
</div></div>

<hr class="sep-both">

## ⚡ Special features ⚡

<div class="row row-cols-md-2 mt-3"><div>

#### Notifications

[See NotificationsAPI](https://developer.mozilla.org/en-US/docs/Web/API/Notifications_API/Using_the_Notifications_API)

```javascript!
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

The localStorage is a storage inside the client browser. What's stored inside can be edited inside the devtools, in the "Application" tab.

```javascript!
// store
localStorage.setItem('key', 'value')
// get
const value = localStorage.getItem("key")
if (value != null) { /* ... */ }
// remove
localStorage.removeItem("key")
// clear
localStorage.clear()
```

It's useful to store/cache some data, but you must take into account that the user can add/edit/remove them.

➡️To store an Object, use `JSON.stringify` and `JSON.parse`.

</div><div>

#### Popups

* ➡️ Show a popup with some message

```javascript!
alert("XXX?")
```

* ➡️ Show a popup asking the user for input

```javascript!
let value = prompt("XXX?", "defaultValueOfTheInputField")
if (value != null) {
    // ...
}
```
</div></div>

<hr class="sep-both">

## Libraries

<div class="row row-cols-md-2"><div>

* [anime.js](https://github.com/juliangarnier/anime/) (animations, 44k ⭐)
* [typed.js](https://github.com/mattboldt/typed.js/) (typing, 12.6k ⭐)
* [bideo.js](https://github.com/rishabhp/bideo.js) (video, 4.3k ⭐)
* [particles.js](https://github.com/VincentGarreau/particles.js/) (show particules, 26.6k ⭐)
* [GSAP](https://github.com/greensock/GSAP) (animations, 15.4k ⭐)
* [createjs](https://github.com/createjs) (libraries)
* [turn.js](https://github.com/blasten/turn.js) (book-like, 6.8k ⭐). See also [StPageFlip](https://github.com/Nodlik/StPageFlip) / [pdf-flipbook](https://github.com/erayakartuna/pdf-flipbook).
* [d3.js](https://d3-graph-gallery.com/index.html) (plotting..., 104k ⭐)
</div><div>

#### jQuery

A long time ago, [jQuery](https://github.com/jquery/jquery) was a popular library shortening/simplifying the DOM manipulations. Nowadays, many features were added to JavaScript, and with technologies with less manipulation of the DOM like React, or Vue.js, the library is nowhere near what it used to be.

➡️ Bootstrap removed its jQuery dependencies in its 5th version, to make the library more lightweight.

➡️ [jQuery.terminal](https://github.com/jcubic/jquery.terminal) (2.8k ⭐) | ️ [jQuery Migrate](https://github.com/jquery/jquery-migrate) (1.9k ⭐)
</div></div>

<hr class="sep-both">

## Snippets

<div class="row row-cols-md-2"><div>

* Scroll to the bottom of an element

```js!
const scrollToTheBottomOfElement = (e) => {
    let previous = e.scrollHeight;
    while (1) {
        e.scrollTo(0, e.scrollHeight);
        if (e.scrollHeight === previous) break;
        previous = e.scrollHeight;
    }
}
```
</div><div>

...
</div></div>


<hr class="sep-both">

## 👻 To-do 👻

Stuff that I found, but never read/used yet.

<div class="row row-cols-md-2"><div>

* `data-*`
* blob URL
* Proxy
* SessionStorage
* ServiceWorkers ([article](https://levelup.gitconnected.com/boost-your-web-application-performance-with-javascript-web-workers-dcb050ea24a6))
* [Get QueryParams](https://stackoverflow.com/questions/901115/how-can-i-get-query-string-values-in-javascript)
* `window.location.href` / `window.location.replace(URL)`
</div><div>

```javascript!
print()
debugger; // only resuming when closed
document.write(" Dont open Developer Tools. ");
window.confirm('Are you sure?')

xxx:
for (;;) {
    break xxx;
}
```
</div></div>