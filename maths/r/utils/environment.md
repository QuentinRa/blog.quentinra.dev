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

That should not be used since you are using an IDE
but well just in case

```r
# print all variables values

for (i in ls()) { print(paste(i,"=",eval(as.symbol(i)))) }
# [1] "i = i"
# [1] "x = 5"
# [1] "y = y"
# [1] "z = 0.53"

# or
# using R functions
# sapply(ls(), function (i) { paste(i,"=",eval(as.symbol(i))) }  )
```