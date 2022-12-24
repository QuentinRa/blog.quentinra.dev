# Types

[Go back](../index.md#basic-syntax)

As you saw, we don't specify the variable type when creating a variable. The typing is implicit, and you will often see these types

You can use 

* `typeof variable`: return the type of variable, mainly used in well-written functions
* `var instanceof className` returning a boolean if this variable is an instance of a class
like `[] instanceof Array`.

<hr class="sl">

## Strings

A string is a set of ordered characters. You can use variables in a string like this

```js
let variable = 5
console.log("the variable value is "+variable)
console.log('the variable value is '+variable)
console.log(`the variable value is ${variable}`)
// the variable value is 5 (x3)
```

You may use some function like (str and str2 are strings)

* `str.length`: get the number of characters
* `str.indexOf(str2)`: first index of str2 in str
* `str.lastIndexOf(str2)`: last index of str2 in str
* `str.toLowerCase()`: str to lower case
* `str.toUpperCase()`: str to upper case
* `str.replace('a','b')`: replace "a" by "b", one time
* `str.replaceAll('a','b')`: replace "a" by "b"
* `str.trim()`: remove spaces before/after str
*  substring, slice, substr, concat, ...

You may notice that `str[0]` is returning the first character, but that's useless trying to modify the values like this.

<hr class="sl">

## Array

```js
// empty
[]
// with values
[5,"toto", "hello"]
// same
new Array(5,"toto", "hello")
```

It's working like in C/Java or many languages, `tab[0]` returns the first element of `tab`.

* `array.length`: the number of elements
* `array.concat(array2)`: merge two arrays
* `array.push(e)`: add an element
* `array.pop()`: returns the last element
* `array.reverse()`: reverse the array
* `array.forEach(f)`: apply `f` on each element of tab
* `Array.isArray(array)`: true if this is an array (**use this instead of typeof**)
* `array.sort()`: sort array
* `array.sort(f)`: sort array with a sorting function `f(a,b)` returning `{-1,0,1}`
* `array.slice().`: create a copy of an array

You can, and may use, slice a lot like `array.slice().reverse();`.