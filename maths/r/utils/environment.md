# Environment

[Go back](../index.md)

Before starting, you need to know that all variables,
functions, ... are part of our environment.

You can list everything using ``ls`` and clear/destroy
a variable using ``rm``.

**Example**

```r
x <- 5
ls() # prints "x"

y <- "y"
ls() # prints "x" "y"

z <- 0.53
ls() # "x" "y" "z"

# clear z
rm(z)

# remove all
rm(list = ls())
```

You can use that or use your IDE to check what
variables, functions, ... got created.