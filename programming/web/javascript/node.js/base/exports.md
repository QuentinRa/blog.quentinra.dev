## Using multiples files

[Go back](../../../../../archives/info/very_old/node)

You need to exports the variables / functions
declared in your file if you want to use them
in another file.

```js
// in script.js
let variable = 5;
let myFunction2 = () => {}

module.exports = {
    five: variable,
    variable,
    myFunction: () => {},
    myFunction2
}

// in another script
const script = require('script.js')
script.five // 5
script.variable // 5
script.myFunction() // function
script.myFunction2() // function

// or
const {myFunction, myFunction2} = require('script.js')
myFunction();
myFunction2();
```