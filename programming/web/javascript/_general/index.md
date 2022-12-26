# JavaScript (JS)

<div class="row row-cols-md-2"><div>

JavaScript (JS) is a popular language used to develop

* 🌳 Dynamic websites <small>(DOM, jQuery...)</small>
* 🗃️ Servers and APIs <small>(Node.js, Express.js...)</small>
* 🖥️ Desktop applications <small>(Electron.js...)</small>
* 🧪 Programming styles like [JsFuck](https://github.com/aemkei/jsfuck) (7.3k ⭐)
* ...
</div><div>

Most environments support `console.log` to print something.

```js
console.log("message")
console.error("error message")
console.warn("warning message")
console.info("informative message")
// if available, used to clear the console
console.clear();
```
</div></div>

<hr class="sep-both">

## Variables and Types

<div class="row row-cols-md-2"><div>

There are 3 ways to declare a variable.

```javascript
// ✅ use CONST as much as possible (unmodifiable)
const five = 5
// ✅ let is used for scoped-variable (=block variables)
let str = "five"
// ❌ var is used for global variables
var x = 5
```

There are two "null" values. Note that both are equals (`==`).

* **undefined**: not defined
* **null**: defined, but null

You can use the operator `?.` and `??` to write null-safe code

```javascript
// ⭐ Nullish coalescing operator
const x = null ?? default_value // default_value
const x = undefined ?? default_value // default_value
// ⭐ Optional chaining
// call on null/undefined, return null/undefined
const x = undefined?.toString() // undefined
const x = null?.toString() // null
// mix both
const x = null?.toString() ?? default_value // default_value
```

➡️ An alternative to `??` is `||`, for instance, `undefined || 50` returns 50. It's not quite used, and most likely a "hack".

</div><div>

Types are implicit in JavaScript. See **typeof**/**instanceof**.

```javascript
// Boolean | typeof(b) === 'boolean'
const b = true || false
// Number | typeof(n) === 'number'
const n = 5 // ➡️ Number.isInteger(xxx), parseInt(xxx)
const n = 5.0 // ➡️ Number.isFinite(xxx), parseFloat(xxx)
const n = NaN // ➡️ Number.isNan(xxx)
// String | typeof(str) === 'string'
const str = "string"
const str = 'string'
const str = `template literals/string`
// Object | typeof(o) === 'object'
const o = {}
// Array | a instanceof Array | Array.isArray(a)
const a = [] // ⚠️ An array is also an Object
```

You can use every usual operator.

* `+`, `-`, `>`, `>=`, `&&`, `||`, `!`...
* `^` <small>(modulo)</small>, `**` <small>(exponentiation/power)</small>
* `+=`/`-=`/... `var++` and `var--`
* `==`/`!=`: **non-strict**, compare the value <small>(`5=='5'` is true)</small>
* `===`/`!==`: **strict**, compare the value and the type <small>(`5==='5'` is false)</small>
</div></div>

<hr class="sep-both">

## 🗃️ Control-flow and usual functions 🗃️

<div class="row row-cols-md-2 mt-3"><div>

⚠️ It's important to note that any non-boolean value will be casted to a boolean. For instance, `" "` is equals to `false` <small>(`" " == true` is `false`)</small>.

➡️ As always, you can use `break`/`continue` in loops.

##### If and Switch

```javascript
if (boolean) { /* ... */ }
if (boolean) { /* ... */ } else { /* ... */ }
if (boolean) { /* ... */ } else if (boolean) { /* ... */ }
switch (value) {
    case xxx: /* ... */; break;
    case yyy: /* ... */; break;
    default: /* ... */;break;
}
```

##### While / Do while

```javascript
while (cond) { /* ... */ }
do { /* ... */ } while (boolean)
```
</div><div>

##### for (i) and for (each)

```javascript
for(let i = 0; i < 10; i++) { /* ... */ }
for(let i = 0, j = 0; /* ... */; i++) { /* ... */ }
for(i = 0; i < 10; i++) { /* ❌ implicit var */ }
```

```javascript
for(i in array) { /* i is an index of array */ }
for(i of array) { /* i is a value of array */ }
```

##### Concatenation

```js
let variable = 5
console.log("the variable value is "+variable)
console.log('the variable value is '+variable)
console.log(`the variable value is ${variable}`)
// the variable value is 5
```

##### Has property/element

```javascript
// same as 'array.hasOwnProperty(0)'
if (0 in [0, 1]) {} // true
// same as 'obj.hasOwnProperty("x")'
if ("x" in { "x": "..." }) {} // true
```

</div></div>

<hr class="sep-both">

## Advanced notes on usual types

<div class="row row-cols-md-2"><div>

#### Arrays

```javascript
const array = []
// get info
array.length // 0
array[0] // undefined
// edit
array[0] = 25
array.pop() // []
array.push(10, 13) // [10, 13]
// generate a new array
array.concat(["10"]) // [10, 13, "10"]
array.reverse() // [13, 10]
array.sort() // [10,13] | array.sort((a,b) => a - b)
array.slice() // [10,13], deep clone
```

Well-known operations

```javascript
array.forEach(v => { /* ... */ }) // iterate
```

Create an Array from an Iterable

```javascript
const array = Array.from(anIterable) // NodeList...
const array = [...anIterable] // ~same 🤔
```
</div><div>

#### Strings

```javascript
const xxx = "xxx"
// get info
xxx.length // 4
xxx.indexOf("x") // 0
xxx.lastIndexOf("/") // -1
xxx.includes("xxx") // true
xxx[0] // 'x'
// convert
xxx.toLowerCase() // "xxx"
xxx.toUpperCase() // "XXX"
(" "+xxx+" ").trim() // "xxx"
// replace
xxx.replace('x', 'y') // "yxx"
xxx.replaceAll('x', 'y') // "yyy"
```

#### Maps

[See MDN documentation](https://developer.mozilla.org/en-US/docs/Web/JavaScript/Reference/Global_Objects/Map)

```javascript
const map = new Map()
map.set('key', 5) // add
map.get('key') // get
map.has('key') // check
for(let [k,v] of map) { /* ... */ } // iterate
// otherwise, generate an Iterable
map.entries() | map.keys() | map.values()
// 🥂 Convert an Object to a Map
new Map(Object.entries(object))
new Map(Object.entries(object))
```

Create a Map from an array/object

```javascript
new Map([["key", "value"], /* ... */])
new Map(Object.entries(object))
```
</div></div>

<hr class="sep-both">

## Functions

<div class="row row-cols-md-2"><div>

There are two ways to declare functions:

```javascript
// global function
function xxx() {}
// scoped function
const xxx = function () {}
// scoped arrow/anonymous function
const xxx = () => {}

// 🥂 call
const result = xxx(args)

// 🔎 typeof
if(typeof(xxx) === 'function') {}
```
</div><div>

➡️ Every function returns something: `undefined`, or a value. Also, if the expected arguments aren't passed, they will be `undefined`.

```javascript
// ✅ All of these are doing the same (v * v)
function pow(v) { return v * v }
const pow = function (v) { return v * v }
const pow = (v) => { return v * v }
const pow = (v) => { v * v }
const pow = (v) => v * v
const pow = v => v * v
// ⚠️ for objects, you need parenthesis
const pow = v => ({ key: 'value' })
```

You can give **default values** to arguments.

```javascript
function pow(x, k = 1) { return x ** k; } // 5 ** 2 = 25
```
</div></div>

<hr class="sep-both">

## Objects

<div class="row row-cols-md-2"><div>

JavaScript supports [JSON](/programming/data/json.md) natively, which some changes.

```javascript
const object = {
    //  ✅ you don't need to quotes keys
    key: "value",
    // ✅ a trailing ',' is allowed
    myFunction: () => 5,
}
const object = [{}, [ {}, {} ]] // JSONArray
```

```javascript
// access a propery
object.key
object["key"] // 🥂 also works
```
</div><div>

#### Convert a JSON to a String

```javascript
const jsonString = JSON.stringify(object) 
// pretty format (2/4 spaces)
const jsonString = JSON.stringify(object, null, 2) 
const jsonString = JSON.stringify(object, null, 4) 
```

#### Convert a String to a JSON

```javascript
const object = JSON.parse(jsonString) 
```

#### Convert a JSON to an array of arrays

```javascript
const array = Object.entries(object)
```
</div></div>

<hr class="sep-both">

## Classes

<div class="row row-cols-md-2"><div>

...
</div><div>

...
</div></div>

<hr class="sep-both">

## Utilities

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
const f = (args) => (5);
const {x1, x2} = { x1: 'xxx', x2: 'yyy' }
const [a,b] = [0,1]
const merge = Object.assign({name: 'toto', age: 10}, { age: 15 })
// filter (true=keep), map
// reduce((a, b) => a + b, 0)
// match (/xxx/ and /x/g)
new Date().toTimeString().substring(0,8)
new Date().getTime()
class X {
    static xxx = 0;
    static xxx(args) {}
    xxx() {
        return this.xxx
    }
}
this.events.splice(0, 0, xxx) // insert at 0

setTimeout(function () { },  xxx);
setInterval(function () { },  xxx);
```

```javascript
const params = {
    method: "POST",
    body: JSON.stringify({}),
    headers: {"Content-type":"application/json;charset=UTF-8"}
}
await fetch("URL" , params)
// try catch
```
</div><div>

Learn

* `.eslintrc`
* ESM import: `<script type="module">` (see [socket.io](https://socket.io/docs/v4/client-initialization/))
* moment.js
* [interesting code](https://stackoverflow.com/questions/21692646/how-does-facebook-disable-the-browsers-integrated-developer-tools)

```javascript
// todo: node.js has some notes too :(
module.exports = {};
require('./exports.js');
```

Random

* [javascript.info](https://javascript.info/)
* [javascripttutorial](https://www.javascripttutorial.net/)
* [javascript.com](https://www.javascript.com/learn)
* [JS minifier](https://javascriptminifier.com/)
* [JSDoc](https://jsdoc.app/)
* **Arrow functions**, or anonymous functions: there is no "this".
* Closures / nested functions

**[Old notes](_old.md)**
</div></div>