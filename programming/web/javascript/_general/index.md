# JavaScript (JS)

<div class="row row-cols-md-2"><div>

JavaScript (JS) is a popular language used to develop

* 🌳 Dynamic websites <small>(DOM, jquery...)</small>
* 🗃️ Servers and APIs <small>(Node.js, Express...)</small>
* 🖥️ Desktop applications <small>(Electron.js...)</small>
* 🧪 Programming styles like [JsFuck](https://github.com/aemkei/jsfuck) (7.3k ⭐)
* ...
</div><div>

Most environments support `console.log` to print something.

```js
console.log("message")
console.error("error message")
console.warn("warning message")
console.info("message")
```
</div></div>

<hr class="sep-both">

## Variables and Types

<div class="row row-cols-md-2"><div>

There are 3 ways to declare a variable.

```javascript
// ✅ use CONST as much as possible
const five = 5
// ✅ let is used for scoped-variable
let str = "five"
// ❌ var is used for global variables
var x = 5
```

There are two "null" values. Note that both are equals (`==`).

* **undefined**: not defined
* **null**: defined, but null

You can use type-safe calls

```
// default value
const default_value = null ?? default_value
const default_value = undefined ?? default_value
// if one is null/undefined, return undefined
const undefined = undefined?.property
const null = null?.property
// mix both
const zero = null?.property ?? default_value
```

</div><div>

Types are implicit in JavaScript.

```javascript
// boolean
const boolean = true || false
// number
const number = 5
const number = 5.0
const number = NaN
// string - class String
const string = "str"
const string = 'str'
const string = `str`
// object
const object = {}
const object = [] // class Array
```
</div></div>


<hr class="sep-both">

## 👻 To-do 👻

Stuff that I found, but never read/used yet.

<div class="row row-cols-md-2"><div>

```javascript
// null/undefined ?? 'value'
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

// parseFloat(x);
// parseInt(x);
// sNaN(montant)
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
* [javascript.com](https://www.javascript.com/learn)
* [JS minifier](https://javascriptminifier.com/)
* [JSDoc](https://jsdoc.app/)

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

**[Old notes](_old.md)**
</div></div>