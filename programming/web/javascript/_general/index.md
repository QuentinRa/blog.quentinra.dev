# JavaScript (JS)

<div class="row row-cols-md-2"><div>

JavaScript (JS) is a popular language used to develop

* 🌳 Dynamic websites <small>(DOM, jQuery...)</small>
* 🗃️ Servers and APIs <small>(Node.js, Express.js...)</small>
* 🖥️ Desktop applications <small>(Electron.js...)</small>
* 📱️ Mobile applications <small>(React.js, Vue.js...)</small>
* 🧪 Programming styles like [JsFuck](https://github.com/aemkei/jsfuck) (7.3k ⭐)
* 🧨 Blockchains <small>(Solidity...)</small>
* ...

**Where to learn?**

* [MDN/JavaScript](https://developer.mozilla.org/en-US/docs/Web/JavaScript/) <small>(⛪)</small>
* [W3Schools/JavaScript](https://www.w3schools.com/js/default.asp) <small>(⛪)</small>
* [javascript.info](https://javascript.info/) <small>(🚀)</small>
* [javascripttutorial](https://www.javascripttutorial.net/) <small>(✈️)</small>
* ...
</div><div>

Most environments support `console.log` to print something.

```js
console.log("message")
console.error("error message")
console.warn("warning message")
console.info("informative message")
// see https://en.wikipedia.org/wiki/ANSI_escape_code#Colors
console.error('\x1b[31m%s\x1b[0m', 'Shown in RED');
// print arrays/... in one go
console.log("array:", [], ". object: ", {})
// if available, used to clear the console
console.clear();
```

**Some JavaScript tools**

* Documentation ✅: [JSDoc](https://jsdoc.app/)
* Guidelines ‍🎓 : [clean-code-javascript](https://github.com/ryanmcdermott/clean-code-javascript)
* Benchmarks 🚀: [jsben.ch](https://jsben.ch/) / [jsperf](https://github.com/jsperf/jsperf.com)
* Minifier 🐲: [javascript minifier](https://javascriptminifier.com/)
* Lint 🧹: [eslint](https://github.com/eslint/eslint) and/or [unsupported browser features linter](https://github.com/amilajack/eslint-plugin-compat)
</div></div>

<hr class="sep-both">

## Basics

<div class="row row-cols-md-2"><div>

JavaScript (JS) is based on ECMAScript. [See JavaScript versions](https://www.w3schools.com/Js/js_versions.asp).

There are 3 ways to declare a variable: `const`, `let`, and `var`.

```javascript
// ✅ use CONST as much as possible (unmodifiable)
const five = 5
// ✅ let is used for scoped-variable (="normal" variables)
let str = "five"
// ❌ var is used for global variables
var x = 5
```
</div><div>

* 👉 Semicolon are optional. Be consistent if you use them.
* 👉 Use `//` or `/* */` for comments.
* 👉 Use `"use strict";` to enforce a [strict](https://www.w3schools.com/js/js_strict.asp) code policy.

You can use every usual operator.

* `+`, `-`, `>`, `>=`, `&&`, `||`, `!`...
* `^` <small>(modulo)</small>, `**` <small>(exponentiation/power)</small>
* `+=`/`-=`/... `var++` and `var--`
* `==`/`!=`: **non-strict**, compare the value <small>(`5=='5'` is true)</small>
* `===`/`!==`: **strict**, compare the value and the type <small>(`5==='5'` is false)</small>
</div></div>


<hr class="sep-both">

## Variables and Types

<div class="row row-cols-md-2"><div>

Types are implicit in JavaScript. You can use **typeof** or **instanceof** to check the type of something.

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
</div><div>

There are two "null" values. Both are equals (`null == undefined`).

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

➡️ An alternative to `??` is `||`, for instance, `undefined || 50` returns 50. It's not quite used, and it's most likely a "hack".
</div></div>

<hr class="sep-both">

## 🗃️ Control flow and usual functions 🗃️

<div class="row row-cols-md-2 mt-3"><div>

⚠️ It's important to note that any non-boolean value will be cast to a boolean. For instance, `" "` is equals to `false` <small>(`" " == true` is `false`)</small>.

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
// switch + function call
const value = "";
switch (true) {
    case value.includes("toto"): /* ... */ break;
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
for(const i in array) { /* i is an index of array */ }
for(const i of array) { /* i is a value of array */ }
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
array.includes(100) // false (=not inside)
// edit
array[0] = 25
array.pop() // []
array.push(10, 13) // [10, 13]
array.splice(0, 1) // remove 1 value from index 0
array.splice(0, 0, xxx) // insert at 0
// generate a new array
array.concat([25]) // [10, 13, "10"]
array.reverse() // [13, 10]
array.sort() // [10, 13] | array.sort((a,b) => a - b)
array.slice(0, 1) // clone with 1 values from index 0
```

Well-known operations

```javascript
const array = [10, 13]
array.forEach(v => { /* ... */ }) // iterate (...)
array.filter(v => v === 10) // filter values ([10])
array.reduce((a,b) => a+b, 0) // reduce to one value (23)
array.join(" ") // merge separated by ' ' ("10 13"] 
```

Create an Array from an Iterable

```javascript
// ex: HTML NodeList, Map.entries/...
const array = Array.from(anIterable)
const array = [...anIterable]
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
xxx.replaceAll(/x/g, 'y') // "yyy"
// other
xxx.split("xx") // ['', 'x'] 
```

#### Maps

[See MDN documentation](https://developer.mozilla.org/en-US/docs/Web/JavaScript/Reference/Global_Objects/Map)

```javascript!
const map = new Map()
map.set('key', 5) // add
map.get('key') // get
map.has('key') // check
for(const [k,v] of map) { /* ... */ } // iterate
// otherwise, generate an Iterable
map.entries() | map.keys() | map.values()
```

Create a Map from an array/object

```javascript!
new Map([["key", "value"], /* ... */])
new Map(Object.entries(object))
```
</div></div>

<hr class="sep-both">

## Functions

<div class="row row-cols-md-2"><div>

There are two ways to declare functions:

```javascript!
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

```javascript!
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

```javascript!
function pow(x, k = 1) { return x ** k; } // 5 ** 2 = 25
```
</div></div>

<hr class="sep-both">

## Objects

<div class="row row-cols-md-2"><div>

JavaScript supports [JSON](/programming/data/json.md) natively, which some changes.

```javascript!
const object = {
    //  ✅ you don't need to quote keys
    key: "value",
    // ✅ a trailing ',' is allowed
    myFunction: () => 5,
}
const object = [{}, [ {}, {} ]] // JSONArray
```

```javascript!
// access a property
object.key
object["key"] // 🥂 also works
```

#### Deconstruct objects/arrays

You can deconstruct an object to easily access its values.

```javascript!
const {x1, x2} = { x1: 'xxx', x2: 'yyy' }
const [a, b] = [0, 1]
```

</div><div>

#### Convert a JSON to a String

<p></p>

```javascript!
const jsonString = JSON.stringify(object) 
// pretty format (2/4 spaces)
const jsonString = JSON.stringify(object, null, 2) 
const jsonString = JSON.stringify(object, null, 4) 
```

#### Convert a String to a JSON

<p></p>

```javascript!
const object = JSON.parse(jsonString) 
```

#### Other conversions

```javascript!
const array = Object.entries(object) // object to array
const map new Map(Object.entries(object)) // object to map
const object = Object.fromEntries(map) // map to object
```

#### Merge objects

```javascript!
Object.assign({name: 'toto', age: 10}, {age: 15})
// {name: 'toto', age: 15}
```
</div></div>

<hr class="sep-both">

## Classes

*➡️ As a reminder, a class can be said to be a template used to create objects.*

<div class="row row-cols-md-2"><div>

You can create and instantiate a class with a PHP-like syntax.

```javascript
class Person {
    x = 12; // property declared outside the constructor
    // only one per class
    constructor(firstname, lastName = "Doe") {
        this.firstname = firstname
        this.lastName = lastName
    }

    toString() {
        // you must use "this"
        return this.firstname+" "+this.lastName
    }
}

const johnDoe = new Person("John")
johnDoe.firstname // "John"
johnDoe.toString() // "John Doe"
```

#### Prototypes

JavaScript is a prototyping language. Each variable has access to its definition by using the attribute `__proto__`.

```javascript
const x = 5; x.__proto__;
(5).__proto__; // same without variable
```

If you edit the prototype, then every object using this prototype will be updated. In short, you're dynamically updating their class.

```javascript
x.__proto__.square = function () { return this * this }
x.square() // 25!
const y = 10;
y.square() // 100!
```
</div><div>

You can also dynamically add properties to one object

```javascript
const image = document.images[0] // get an image
image.wasSelected = true // add a property 'wasSelected'
image.wasSelected // true
```

#### Static/class members

<p></p>

```javascript
class X {
    static XXX_TOKEN = "XxX"
    
    static XXX() {
        // you must use "this." or "X."
        return this.XXX_TOKEN
    }
}
X.XXX_TOKEN // "XxX"
X.XXX() // "XxX"
```

#### Inheritance

<p></p>

```js
class John extends Person {
    constructor() {
        super("John")
    }

    toString(){
        return "John!" // change the behavior
    }
}
new Person().toString() // "John Doe"
new John().toString() // "John!"
```
</div></div>

<hr class="sep-both">

## Utilities

<div class="row row-cols-md-2"><div>

#### Catch exceptions

Exceptions are used to report that something unexpected occurred, which is mostly an error (`Error`, `EvalError`, `RangeError`...).

```javascript
// raise an exception
throw new Error();
// capture an exception
try {} catch {}
// capture and deal with an exception
try {} catch (e) {}
```

#### Date and time

The library [moment.js](https://github.com/moment/moment) (47k ⭐) is quite used to deal with dates/...

```javascript
new Date().getTime() // time since 1970
new Date().toTimeString().substring(0,8) // hh:mm:ss
```

#### Utilities

<p></p>

```javascript
// call after xxx ms (1000 = 1s)
setTimeout(function () { },  5000);
// repeat every xxx ms (1000 = 1s)
const it = setInterval(function () { },  5000);
clearInterval(it)
```
</div><div>

#### Spread syntax

The spread syntax allows us to expand something.

```javascript
const powArgs = [5, 2]
const pow = (n, k) => n ** k
// instead of
pow(powArgs[0], powArgs[1]) //  25
// use
pow(...powArgs) // pow(5, 2) = 25
```

You can use it

* ➡️ To deep clone an array with `[...array]`
* ➡️ To deep clone an object with `{...obj}`
* ➡️ Create an array of unique elements with `[...new Set(array)]`
* ...
</div></div>

<hr class="sep-both">

## 🪨 Asynchronous work and Promises 🪨

<div class="row row-cols-md-2 mt-4"><div>

JavaScript executed in the main thread will delay events, and prevent any other script from running. To avoid that, we can use **asynchronous** functions with `async`. 

```javascript
async function doRequestToTheAPI() {
    /* ex: fetch something from the API */
    return result
}
// or
const doRequestToTheAPI = async () => { /* ... */ }
```

These functions return a **Promise** in which we can write code that will be executed when the asynchronous function has finished.

```javascript
doRequestToTheAPI()
    .then(res => /* do something, return xxx */)
    .then(xxx => /* do something */)
    .catch(err => console.error(err))
```

* Each function passed to `then`/`catch` is called a **callback**.
* You can chain `.then(...)`. The value returned in the previous `.then` is passed to the next one.
* If any `.then(...)` raises an exception, then the callback passed to `.catch` is called, if there is one.

To avoid the "callback hell", we use **await**. But, 👉 **await can only be used inside an `async` function**, so it's mainly to avoid Promises inside Promises inside [...].

```diff
-doRequestToTheAPI().then(result => /* ... */)
+const result = await doRequestToTheAPI()
```
</div><div>

Working example using the [Fetch API](/programming/web/javascript/_general/dom.md#-request-an-api-) to get something from an API.

```javascript
async function doRequestToTheAPI() {
    const response = await fetch('https://jsonplaceholder.typicode.com/todos/1')
    return await response.json()
}
```

We can improve the code by replacing `return await` with  `return`, as the latter will also wait for the asynchronous call to generate a value.

```diff
- return await response.json()
+ return response.json()
```

#### Promises

Promises can be created manually. They are taking two callbacks, one in case of success, and another one in case of failure. 

➡️ The latter is the same as raising an exception.

```javascript
// example: function sleep in JavaScript
function sleep(ms) {
    return new Promise((resolve, reject) => {
        setTimeout(resolve, ms) // call resolve in xxx ms
    })
}

async function callSleep() {
    await sleep(5000)
    console.log("Print this message after 5 seconds")
}

callSleep() // ignore .then / .catch
```
</div></div>

<hr class="sep-both">

## 👻 To-do 👻

Stuff that I found, but never read/used yet.

<div class="row row-cols-md-2"><div>

* `match (/xxx/ and /x/g /x/i)`
* [airbnb guidelines](https://github.com/airbnb/javascript)
* [interesting code](https://stackoverflow.com/questions/21692646/how-does-facebook-disable-the-browsers-integrated-developer-tools)
* ESM import: `<script type="module">` (see [socket.io](https://socket.io/docs/v4/client-initialization/)). See also Node.js notes. Top-level await possible... ESNext.

```
<script src="./popup.js" type="module"></script>
```

* [javascript.com](https://www.javascript.com/learn/strings)
* **Arrow functions**, or anonymous functions: there is no "this".
* Closures / nested functions
* `delete xxx`
* `Array.find+index`
* `Symbols, yield, function*()`
</div><div>

Repositories

* [Article](https://madza.hashnode.dev/21-github-repositories-to-become-a-javascript-master)
* [javascript-algorithms](https://github.com/trekhleb/javascript-algorithms)
* [You-Dont-Know-JS](https://github.com/getify/You-Dont-Know-JS)
* [33-js-concepts](https://github.com/leonardomso/33-js-concepts)
* [modern-js-cheatsheet](https://github.com/mbeaudru/modern-js-cheatsheet) (24k ⭐)
* [jfarmer](https://github.com/jfarmer)
</div></div>