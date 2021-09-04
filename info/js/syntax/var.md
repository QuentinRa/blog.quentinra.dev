# Variables

[Go back](../index.md#basic-syntax)

You can use either let, var, or const to declare variables in JavaScript.

```js
// a variable
let variable;
// almost like creating a global variable
var global_variable;
// a constant
const CONST = value;

// if value is null/undefined, then the value
// will be the default value
let variable  = value ?? default_value;
```

<hr class="sl">

## let and var

The difference between let and var is the scope

```js
for(let j=0; j<5; j++) console.log('test')
j // error

for(var j=0; j<5; j++) console.log('test')
j // ok, j=5
```

The problems using var (at least as often as you will see it on the outdated examples on the web)

* you forgot to declare a variable, but since it was declared in the bloc xxx, 3000 lines before, then you won't get an error
* in a loop, var=address so if you are passing j to a function, you may have a problem with $j$ having the wrong value (if you were planning to reference $j$)