# Functions

[Go back](../index.md#basic-syntax)

A function is a bloc of code that you grouped
and that you can call whenever you feel like it.

```js
function pow(x) {
    return x**x;
}

// 2^2 = 4
let result = pow(2);
```

Notes

* $x$ is the argument of the function (variable value given
when the function is called)
* $pow$ is the function name
* $return$ is the keyword for your function
to return a value (not required)

<hr class="sl">

## Default argument value

```js
function pow(x, k = 1) {
    return x ** k;
}

pow(5, 1) // 5^1 = 5
pow(5) // pow(5, 1) = 5
pow(5, 2) // 5^2 = 25
```

Note that the variables declared outside
the function can't be used inside unless
you used var.

Note that the function above could also be written
like this, but I think the one above is way better.

```js
function pow(x, k) {
    k = k || 1
    return x ** k;
}

pow(5) // pow(5, 1) = 5
```

<hr class="sr">

## Anonymous functions

Usually function are declared for the whole
script, but you can declare a local function
like this (for storing a function inside a variable,
for passing a function as argument of function etc.)

```js
let pow = (x, k = 1) => {
    return x ** k;
}
```

<hr class="sl">

## Other stuff

```js
let api = function() {
    // private nested function
    function _fetch(begin, end, section){
        // ...
    }
    
    // public
    return {
        getAllNews:_fetch(0,10,"news"), 
        getAllGames:_fetch(0,10,"games"),
    }
}
```