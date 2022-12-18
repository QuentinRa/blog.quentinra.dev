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
``` 

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
module.exports = {};
require('./exports.js');
```

Random

* [Javascript Map](https://developer.mozilla.org/en-US/docs/Web/JavaScript/Reference/Global_Objects/Map)
* [localizejs](https://localizejs.com/)
* [javascript.info](https://javascript.info/)
* axios

Tools

* [babeljs](https://babeljs.io/)
</div></div>