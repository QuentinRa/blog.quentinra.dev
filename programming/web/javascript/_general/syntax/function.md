# Functions

[Go back](../index.md#basic-syntax)

A function is a block of code that you grouped and that you can call whenever you feel like it.

```js
function pow(x) {
    return x**x;
}

// 2^2 = 4
let result = pow(2);
```

Notes

* `x` is the argument of the function (variable value given when the function is called)
* `pow` is the function name
* `return` is the keyword for your function to return a value (not required)

<hr class="sl">

## Default value for parameters

```js
function pow(x, k = 1) {
    return x ** k;
}

pow(5, 1) // 5^1 = 5
pow(5) // pow(5, 1) = 5
pow(5, 2) // 5^2 = 25
```

Note that the function above could also be written like this, but I think the one above is way more readable.

```js
function pow(x, k) {
    k = k || 1
    return x ** k;
}
```

<hr class="sr">

## Anonymous/Arrow functions

Usually, functions are declared for the whole script, but you can declare a local function like this (ex: to store a function inside a variable, and pass it as an argument later).

```js
let pow = (x, k = 1) => {
    return x ** k;
}
```

I will use this syntax a lot!

```js
// both are the same
let example = () => 5;
let example = () => { return 5 };
// both are the same
let example = v => 5;
let example = (v) => 5;
```

<hr class="sl">

## Other stuff

You should look at **Closures** that are well explained [on W3School](https://www.w3schools.com/js/js_function_closures.asp).

You should also look at **nested functions**, as explained [on MDN](https://developer.mozilla.org/en-US/docs/Web/JavaScript/Guide/Functions#nested_functions_and_closures).

```js
let API = function() {
    // private nested function
    function _fetch(begin, end, section){
        console.log("some code (1)")
    }
    
    // public
    return {
        getAllNews: function () {
            return _fetch(0,10,"news")
        }, 
        getAllGames: function () {
            console.log("some code (2)")
            return _fetch(0, 10, "games");
        },
        API_KEY: "000000"
    }
}
API().API_KEY
API().getAllNews()
// some code (1)
API().getAllGames()
// some code (2)
// some code (1)
```