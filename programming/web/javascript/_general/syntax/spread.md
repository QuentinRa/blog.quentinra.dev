# Spread syntax

[Go back](../../../../../archives/info/web/_old#advanced-syntax)

The spread syntax `...` allows us to expand an array. For instance, let's say you got an array with $[1,2,3,4]$, you could create a new one with the same values, like this

```js
let array = [1,2,3,4];
let copy = [...array]
```

What we did was make convert back an array to a sequence of values and the array constructor is taking a sequence of values. 

```js
...array
// the array got 1, 2, 3, 4
// so we replace "...array" with 1, 2, 3, 4
// giving us
let copy = [1, 2, 3, 4] // good copy
```

You can also use it to clone an object with `{...obj}`.

<hr class="sl">

## Use as a parameter

You could also use it to pass an array (one argument) to a function taking n arguments.

```js
function sum(x, y) {
    return x+"+"+y+"="+(x+y)
}
let array = [5, 4]
sum(... array)
// "5+4=9"
```

<hr class="sr">

## Use to get the unique values

You can use it to get the uniques values of an array

```js
// unique values
let array = [1,2,3,4,2,5,6,1,3];
let uniques = [...new Set(array)];
// [1, 2, 3, 4, 5, 6]
```