# Functions

[Go back](../index.md)

A function is named by the variable storing it. This is working like in JS or PHP, as you can use default values or named arguments. A function must return something.

<hr class="sl">

## Function declaration

You can declare a function like this

```r
modulo <- function (x, mod){
  return(x %% mod)
}
```

Where

* modulo: is the function name
* x: is a parameter
* mod: is another parameter
* and `return(x %% mod)` is the result of the function

You can call the function like this

```r
modulo(5, 3)
# [1] 2
# or with the parameters names
modulo(x=5, mod=3)
modulo(mod=3, x=5)
modulo(mod=3, 5)
modulo(5, mod=3)
```

<hr class="sr">

## Return

A function in R must return something. In fact, you do not need to use `return` since by default in R

> A bloc is evaluated as the evaluation of the last expression

You could write

```r
modulo <- function (x, mod){ 
  x %% mod
}
```

And the returned value is the evaluation of the last expression `x %% mod`.

<hr class="sl">

## Default values

A lot of times in R, you got functions with a lot of arguments (like 7). We are using default values for our arguments using `= value`.

```r
modulo <- function (x, mod=2) {
  # I'm keeping return since I things this is better
  return(x %% mod)
}
```

Giving you something like this

```r
#same as modulo(5, 2)
modulo(5)
```

<hr class="sr">

## Warnings, errors

And finally, you may want to raise an error message/warning message. You can do this using `warning/stop`.

```r
modulo <- function (x, mod=2){
  if(mod < 2) {
    warning(paste(mod, "must be >= 2"));
    mod <- 2
  }
  # we could omit return
  # as the block would be 
  # as x %% mod
  return(x %% mod)
}
```

Giving you something like this

```r
modulo(5, -1)
# Warning in modulo(5, -1) : -1 must be >= 2
# [1] 1
```