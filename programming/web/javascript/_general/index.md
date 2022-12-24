# JavaScript (JS)

**[Old notes](_old.md)**

<div class="row row-cols-md-2"><div>

...
</div><div>

...
</div></div>

<hr class="sep-both">

## 👻 To-do 👻

Stuff that I found, but never read/used yet.

<div class="row row-cols-md-2"><div>

```javascript
if (typeof(value) === 'string') {}
const f = (args) => (5);
if ("".trim().length !== 0) {}
if ("") {} // empty = false
const {x1, x2} = { x1: 'xxx', x2: 'yyy' }
const merge = Object.assign({name: 'toto', age: 10}, { age: 15 })
// filter, forEach, map
// reduce((a, b) => a + b, 0)
// match (/xxx/)
if (xxx in [0,1]) {}
if (xxx instanceof XXX) {}
new Date().toTimeString().substring(0,8)
console.info("")
class X {
    static xxx = 0;
    static xxx(args) {}
    xxx() {
        return this.xxx
    }
}
this.events.splice(0, 0, xxx) // insert at 0
"xxx,yyy".includes(",") // contains

setTimeout(function () { },  xxx);
setInterval(function () { },  xxx);

// /x/g
```
</div><div>

```javascript
const params = {
    method: "POST",
    body: JSON.stringify({}),
    headers: {"Content-type":"application/json;charset=UTF-8"}
}
await fetch("URL" , params)
// try catch
```

Learn

* `.eslintrc`
* ESM import: `<script type="module">` (see [socket.io](https://socket.io/docs/v4/client-initialization/))

```javascript
// todo: node.js has some notes too :(
module.exports = {};
require('./exports.js');
```

Random

* [Javascript Map](https://developer.mozilla.org/en-US/docs/Web/JavaScript/Reference/Global_Objects/Map)
* [javascript.info](https://javascript.info/)
* [javascripttutorial](https://www.javascripttutorial.net/)

Code

```javascript
// source??? electron maybe?
function devtoolIsOpening() {
    console.clear();
    let before = new Date().getTime();
    debugger;
    let after = new Date().getTime();
    if (after - before > 200) {
        document.write(" Dont open Developer Tools. ");
        window.location.replace("https://google.com/");
    }
    setTimeout(devtoolIsOpening, 100);
}
devtoolIsOpening();
```
</div></div>