# Variables

[Go back](../index.md)

In R, a variable is either a function or a value. You must use `a <- 5` to assign `5` to the variable `a`.

```r
a <- "test"
b <- 5
a
b

# you can use assign 
# to change a variable value
assign(a, b)
# or simply use
a <- 7
```

<hr class="sl">

## Using "="

You can also use `=` but you should not since that overusing an operator supposed to do something else.

The official [note](https://developer.r-project.org/equalAssign.html).

<hr class="sr">

## Declare a variable

You can't declare a variable without giving it a value, but you can do something like this

```r
r <- NULL
```

This is useful, as concatenating with NULL is working well

```r
r <- NULL
r <- c(r, 3)
# [1] 3
```

<hr class="sl">

## Print a variable

In R, every line is an expression. And if the result of the expression is a value, then it's printed, otherwise you need to explicitly call print (or any printing function like cat).

```r
r # implicit

print(r) # explicit
```