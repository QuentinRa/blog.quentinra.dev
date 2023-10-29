# Environment

[Go back](../index.md)

All variables, functions, ... are part of our environment. This is not really useful, as you usually have a graphical interface, in which you can see your environment.

<hr class="sl">

## List/Destroy variables

You can list everything using `ls` and clear/destroy a variable using `rm`.

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

<hr class="sr">

## What are your variables?

You can use that or **use your IDE** to check what variables, functions, ... got created.

That should not be used since you are using an IDE but well just in case

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

<hr class="sl">

## Saves

You can use these to save your variables

* **save(x, y, ..., file="x.rdata")**: save x, y,... in a file x.rdata
* **load("x.rdata")**: load variables in x.rdata into the environment
* **write.table(v,file="file.txt")**: save a table in a file.txt
* **read.table("file.txt")**: load a saved table
* **cat(file="file", "x=", x, append=TRUE)**: add variables values in a file