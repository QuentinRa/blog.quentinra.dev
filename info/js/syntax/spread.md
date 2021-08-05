# Spread syntax

[Go back](..#advanced-syntax)

The spread syntax **...** allow us to expand an array. For instance,
let's say you got an array with $[1,2,3,4]$, you could
create a new one with the same values like this

```js
let array = [1,2,3,4];
let copy = [...array]
```

What we did was make convert back an array to a sequence
of values and the array constructor is taking a sequence
of values. You could also use it to pass an array (one argument)
to a function taking n arguments or you can use it
to get the uniques values

```js
// unique values
let array = [1,2,3,4,2,5,6,1,3];
let uniques = [...new Set(array)];
// [1, 2, 3, 4, 5, 6]
```

You can also used it to clone an object with `{...obj}`.

Reference

* <https://developer.mozilla.org/en-US/docs/Web/JavaScript/Reference/Operators/Spread_syntax>