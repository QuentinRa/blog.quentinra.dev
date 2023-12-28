# R Language

<div class="row row-cols-lg-2"><div>

[R](https://www.r-project.org/) is primarily used for statistical computing and data analysis.

```shell!
$ sudo apt install r-base
$ sudo apt install r-base-dev
$ R -q
> quit()
```

**Where to learn?** 🔥

* [Swirl](https://swirlstats.com/) <small>(⛪)</small>
* [WikiBooks](https://en.wikibooks.org/wiki/R_Programming) <small>(🏫)</small>
* [R_inferno](https://www.burns-stat.com/pages/Tutor/R_inferno.pdf) <small>(😈)</small>
* [Advanced R](https://adv-r.hadley.nz/) <small>(📚)</small>
</div><div>

A basic script `my_script.R` file:

```R
# Display "Hello, World!"
cat("Hello, World!\n")
```

From the terminal, you can run the script using:

```shell!
$ Rscript my_script.R
```

👉 We often use [R Studio](https://www.rstudio.com/) or [IntelliJ](https://plugins.jetbrains.com/plugin/6632-r-language-for-intellij) to write R code.
</div></div>

<hr class="sep-both">

## Basics

<div class="row row-cols-lg-2"><div>

#### General Notes

* Use `#` for comments
* Adding `;` (semicolon) at the end of a line is optional

<br>

#### Declare a variable

We use `<-` to assign a variable.

```R
a <- 5
assign(a, 5)
```

⚠️ You can use the `=` symbol too as [described here](https://developer.r-project.org/equalAssign.html).

<br>

#### Types

In R, all types are vectors. `5` is a vector of size `1`.

```R
v <- 5 + 5.3        # numeric
v <- i              # complex
v <- "a text"       # character
v <- "a text"       # character
v <- T && F         # logical
v <- TRUE && FALSE  # logical
v <- NULL           # Null (empty/no value)
v <- NA             # Not Available (missing value)
```

To declare an empty string/..., you can use:

```R
str <- character(1) # 1 == vector of size 1
```

Useful methods:

* `class(v)`: returns the class of `v`
* `mode(v)`: returns the mode of `v`
* `is.classname(v)`: returns true if `v` is an instance of `classname`
* `as.classname(v)`: convert `v` to an instance of `classname`

<br>
</div><div>

#### Print some text in the terminal

```R
myvar                                     # implicit
print(myvar)                              # explicit
cat(paste("Hello", "World"), sep = "\n")  # using "cat"
```

<br>

#### Operators

You can learn more about [operators here](/programming-languages/_paradigm/stuff/operators.md).

```R
# Assignation
x <- 5
# Arithmetic
x + 3         # 5   | same as "sum(x, 3)"
x ^ 3         # 125 | exponential
x %% 3        # 2   | modulus
x %/% 3       # 1   | integer division
              # see also: "-" /" "*" 
# Functions
sqrt(x)       # 2.2 | Square root
round(x)      # 5   | round down
abs(x)        # 5   | absolute value
log(x)        # 1.6 | log10
xor(T, F)     # T   | Logical XOR
# Logicial
x > 5         # see also: >, >=, <=, <
              # see also: ==, !=, !
              # see also: identical(x, y)
T && F        # Logical AND
T || F        # Logical OR
```

👉 There is also `&` and `|` for the logical AND/OR on vectors. When using `&&` or `||` with a vector, they operate on the first element. 

📌 The [magrittr](https://cran.r-project.org/web/packages/magrittr/magrittr.pdf) provides functions to simplify the use of complex operators, mostly those that are hard to remember.

<br>

#### Libraries

Libraries are code written by others. You can install one using:

```R
install.packages("libName")
```

When you need the library, load it using: `library("libName")`.
</div></div>

<hr class="sep-both">

## Control-flow structures

<div class="row row-cols-lg-2"><div>

While R has some control-flow structures, it's better and recommended to use functions instead.

#### Branching

```r
if (condition) {
  # code
}

if (condition) {} else {}

# res = condition ? if_true : if_false
res <- ifelse(condition, if_true, if_false)
```

There is also the `switch`:

```r
res <- switch(index, value_0, value_1, value_n)
```
</div><div>

#### Loops

Inside any loop, you can use:

* `next`: in a loop, go to the next iteration
* `break`: in a loop, exit the loop

To repeat some code until you are done:

```r
while(condition) {}

# use break to exit
repeat {}
```

To iterate a vector, you can use `for`:

```r
for (var in vector){
}
```
</div></div>

<hr class="sep-both">

## Functions

<div class="row row-cols-lg-2"><div>

#### Declare a function

We can group some code in a function.

```R
modulo <- function (x, mod=3) {
  return(x %% mod)
}

# no return == return the last expression
modulo <- function (x, mod=3) { x %% mod }
```

⚠️ A function must return something.

#### Error Messages Helpers

We often use these in our functions to handle errors/warnings:

```R
warning(paste("mod (", mod, ") must be >= 2")) # warn
stop(paste("mod (", mod, ") must be >= 2"))    # fail
```
</div><div>

#### Calling a function

There are a lot of different ways to call a function:

```R
modulo(5, 3)
modulo(5)           # "same" as mod = 3
modulo(x=5, mod=3)  # same
modulo(mod=3, x=5)  # same
modulo(mod=3, 5)    # same
modulo(5, mod=3)    # same
```

#### Help And Documentation

Use `help.start()` to start the documentation web engine.

* `?afunction`: show the help
* `examples(afunction)`: show some examples
* `args(afunction)`: list the arguments
* `body(afunction)`: display the source code
</div></div>

<hr class="sep-both">

## Vectors

<div class="row row-cols-lg-2"><div>

#### Creation

A vector is a set of values. Use `c()` to create a vector. All values must have the same type.

```R
v <- c(1,2,3,4,5)                # vector: (1 2 3 4 5)
v <- 1:5                         # vector: (1 2 3 4 5)
v <- seq(1,5)                    # vector: (1 2 3 4 5)
v <- vector(mode = "numeric", 5) # empty vector
v <- c(v, 2)                     # add a value
v <- c(v, NULL)                  # ignore "NULL"
```

<br>

#### Operations

Operators such as `+` or `&&` behave differently on vectors.

```R
c(1, 2, 3, 4) + c(0,10)
# implicit: c(1, 2, 3, 4) + c(0,10,0,10)
# result: vector(1 12 3 14)
```

⚠️  Both vectors are **recycled** until they have the same size.

<br>

#### Indexes

You can use `[]` to access values by their position:

```R
v[1]         # access the first value
v[c(1,2)]    # return 2 values
v[-1]        # all aside from the first value
v[v > 2]     # only values greater than 2 
```

⚠️ When using an incorrect index, the value is `NA`.

🚀 `which(cond)` returns a vector of all indexes given a condition.

<br>

#### Named Indexes

```R
v <- c(yes = 1, no = 0)    # named indexes
names(r)                   # vector("yes" "no")
match(c("no"), names(r))   # index of the name
```
</div><div>

#### Update Indexes

A fundamental concept in R is that you can update the values at the indexes we selected. Many data structures support this.

```R
> v <- c(1, 4, 5)   # create a vector
> v[v > 2] <- 2     # v[2] = 2 and v[3] = 2
> v                 # print the result
[1] 1 2 2
```

#### Vector functions

Common functions:

* `head(v)`: first values
* `tail(v)`: last values
* `View(v)`: visual of the vector content
* `length(v)`: size
* `value %in% v`: true if value is in v
* `is.element(e,v)`: true if e is in v
* `sample(v, n)`: extract $n$ elements from $v$
* `sample(v, n, replace = T)`: allow reuse of elements
* `subset(v, condition, var)`: create a vector with all elements of `v$var` that satisfy the condition.
* `cut(v, breaks = b,include.lowest = TRUE)`: split a vector

Other functions:

* `rep(v, n)`: repeat a vector `n` times
* `rev(v)`: reverse
* `sort(v)`/`order(v)`: sort
* `identical(v1,v2)`: true if they are the same
* `any(v op value)`: true if at least one value makes the condition true
* `all(v op value)`: true if all values make the condition true
* `duplicated(v)`: true if a value is duplicated, for each value

#### Processing Functions

We often use functions instead of loops:

* `lapply(v, f)`: apply `f` to each element in `v`. Returns a list.
* `sapply(v, f)`: apply `f` to each element in `v`. Returns a vector.
* `aapply(m, f, 1)`: apply `f` to each element in a matrix `m`.
* `tapply(v, k, 1)`: apply `f` to each group of elements.
* `by(v, k, f, na.rm=TRUE)`: wrapper to `tapply(v, k, 1)`
</div></div>

<hr class="sep-both">

## Common types

<div class="row row-cols-lg-2"><div>

#### Strings

```R
# Length
nchar("Hello, World!")

# Concatenate
paste("Hello,", "World!")
paste("a", "b", sep = "\n")         # 'a\nb'
paste(c("a", "b"), collapse = "\n") # same, for a vector
```

Other functions:

* `substring(str, s, e)`: return a substring from indexes `s` to `e`
* `strsplit(str, pattern)`: split a string on `pattern`
* `toupper(str)`: return `str` as uppercase
* `tolower(str)`: return `str` as lowercase
* `gsub(src, dest, str)`: replace `src` with `dest` in `str`
* `trimws(str)`: trim, e.g., remove leading and trailing spaces

<br>

#### Lists

A list is a named vector that can have values of different types.

```r
> l <- list(1, age = 42, name = "Joseph")
> l[1]       # get the first value
> l[[1]]     # get the first value
> l$age      # get one value
42
```

👉 Most functions return a list of named indexes <small>(=an object)</small>.

<br>

#### Matrix

A matrix is a 2-dimension vector. When creating a matrix, values are put in cells from top to bottom, from left to right, unless setting `byrow`.

```R
> values <- 1:6
> matrix(values, nrow = 2, ncol = 3)
> matrix(values, nrow = 2, ncol = 3, byrow = T)
> m[,]      # whole matrix
> m[1,]     # first line
> m[,1]     # first column
> m[1,1]    # value at 1,1 (first line, first column)
> m[i,j,drop=FALSE]  # do not convert to a vector
```

Useful functions

* `dim(m)`: vector of `ncol(m)` and `nrow(m)`
* `cbind(...)`, `rbind(...)`: merge vectors/matrices
* `dimnames(m)`: column/rows names
* `colnames(m)`: column names
* `rownames(m)`: rows names
</div><div>

#### Contingency tables

Contingency tables give the frequency of each value.

```R
> values <- c(5, 10, 7, 10, 3, 5, 10)
> table(values)
values
 3  5  7 10
 1  2  1  3
```

For the relative frequencies of each unique value:

```R
> prop.table(table(values))
values
        3         5         7        10
0.1428571 0.2857143 0.1428571 0.4285714
```

➡️ See also: `prop.table(..., 1)`/`prop.table(..., 2)`.

<br>

#### Factors

Factors are used to store data that has a limited number of distinct values called `levels` such as `Yes` `No`.

```R
> values <- c("yes", "yes", "no", "idk", "yes","no")
> f <- factor(values, levels = c("yes","no", "idk"))
> f <- factor(values)  # try to auto-detect the levels
> levels(f)            # list levels
> droplevels(f, "idk") # remove a level ("idk" => <NA>)
> levels(f) <- c(levels(f), "idk")  # add a level
```

<br>

#### Dataframe

A dataframe represents a CSV table. We function to create a dataframe is using the format: `column_name = values`.

```R
> df <- data.frame(number = 1:3, name = "Rosé")
> df
  number name
1      1 Rosé
2      2 Rosé
3      3 Rosé
> df$number
[1] 1 2 3
```

💡 Each column has the same number of rows. If we give vector of values having different lengths, vectors are recycled.
</div></div>

<hr class="sep-both">

## Environment Utilities

<div class="row row-cols-lg-2"><div>

#### Environment Context

All variables that we declare are stored in the environment.

```R
> ls()              # list all variables
> rm(varName)       # unset a variable
> rm(list = ls())   # unset all variables
# print all variables and their values
# both are the same
> for (i in ls()) { print(paste(i,"=",eval(as.symbol(i)))) }
> sapply(ls(), function (i) { paste(i,"=",eval(as.symbol(i))) }  )
```

Some useful functions:

* `save(x, y, ..., file="x.rdata")`: save variables in a file
* `load("x.rdata")`: load variables into the environment
* `write.table(v,file="file.txt")`: write a table to a file
* `read.table("file.txt")`: load a table to a file
* `cat(file="file", "x=", x, append=TRUE)`: add a value in a file
</div><div>

#### File Utilities

A few commands are supposed to work the same on any OS:

* `getwd()`: return the path to the current directory
* `sedwd(path)`: move to another working directory
* `dir()/list.files()`: list the current directory files

Read a file

* `read.csv('path')`: read a csv, separated by commas (,)
* `read.csv2('path')`: read a csv, separated by semicolons (;)
* `source('path_or_URL')`: run an R script
* `cat(path, sep = '\n')`: print the contents of a file
* `readLines(path)`: read a file

💡 In statistics, we use `stringsAsFactors=TRUE` to handle factors.

🚀 See also: `write.csv(...)`, `write.csv2(...)`, `writeLines(...)`, etc.

Other functions: `file.path(paths)`, `dir.create(path)`, `file.create(path)`, `file.exists(path)`, `file.info(path)`, `file.copy(path,new_path)`, `file.rename(path,new_path)`.
</div></div>

<hr class="sep-both">

## Maths

<div class="row row-cols-lg-2"><div>

#### Datasets

Datasets are variables with data to experiment with.

```R
> data()            # see all existing datasets
> data('dataset')   # import a dataset
```

#### Math Vector Functions

* `which.min(v)`: index of the min value
* `which.max(v)`: index of the max value
* `sum(v)`: sum of all elements
* `prod(v)`: product of all elements
* `intersect(x,y)`
* `union(x,y)`
* `setdiff(x,y)`
* `mlv` (library `modeest`): get the mode

#### Math Matrices Functions

* `t(A)`: transpose of a matrix
* `det(A)`: determinant of a matrix
* `solve(A)`: inverse of a matrix
* `solve(A,b)`: solve $Ax=b$
* `diag(n)/diag(c(...))`: create a diagonal matrix
* `A %*% B`: matrices product
* `eigen(m)`: eigenvalues
* `library('matlib');gaussianElimination(A, b)`: Gauss
* `library('MASS'); fractions(A)`: convert to fractions
</div><div>

#### Analysis Functions

* `summary(v)`: mean, min...
* `min(v)`/`max(v)`/`mean(v)`/`median(v)`: min/max/mean/median
* `var(v)`/`cov(v)`/`cor(v)`: variance/covariance/correlation
* `runif(n)`==`runif(n, 0, 1)`: n random values in [0, 1]
* `choose(n,k)`: $C^k_n$ (picking $k$ elements among $n$)
* `factorial(n)`: $n!$
</div></div>

<hr class="sep-both">

## Plots

<div class="row row-cols-lg-2"><div>

Almost all the plot functions support these arguments:

* `main = "title"`: plot title
* `xlab = "title x"`: x-axis title
* `ylab = "title y"`: y-axis title
* `xlim = lim`: x's values goes up to lim
* `ylim = lim`: y's values goes up to lim
* `col = 'color'`: set the color (ex: `'red'` or `red(1.0)` in `crayon`)

#### Plots

```R
> plot(x)                  # basic
> plot(x, type = "l", ...) # line == line, b==dot lines
> plot(jitter(x))          # handle points near each other
```

#### Histograms

```R
> hist(x)                         # basic
> hist(x, border = color, ...)    # change colors
> hist(x, breaks = seq(...), ...) # create more columns
> hist(x, nclass = v, ...)        # split in v intervals
> hist(x, prob = TRUE, ...)       # show frequencies
```

#### Bar chart

```R
> barplot(table(v))
```

#### Pie chart

```R
> pie(table(v))
```

#### Box plot

The highest bar is the 3rd quantile, the lowest one is the first quantile and the black bar is the median (2nd quantile).

```R
> boxplot(v)
> boxplot(quant ~ qual)
# example
> data('mtcars')
> cars <- mtcars
> cars$cyl.qual <- factor(cars$cyl)
> boxplot(cars$hp ~ cars$cyl.qual)
```
</div><div>

#### Contingency table

```R
> balloonplot(table(x))
```

#### Temporal

Used to see the evolution of a quantitative variable with a temporal qualitative variable. The value at a time $t$ is the mean of the values observed at the time $t$.

```R
# option 1:
> interaction.plot(qual, quant, quant, lty=1, legend=FALSE)
# option 2:
> library(gplots)
> plotmeans(quant~qual)
```

#### Save a diagram

Every plot is rendered in a device that we opened.

```R
# open a device
> pdf(path) # see also: jpeg(path), png(path)
# save to a file
> dev.copy(device=format, "path")
# close
> dev.off() # or: dev.off(number)
```

#### Utilities

Commonly used functions:

* `abline(...)` : draw a line $y=ax+b$ (you may use h=x or v=y)
* `legend(...)`: add a legend
* `title(...)`: add a title

Some functions you might use: 

* `rect`, `segments`, `polygon`, `box`, `grid`, `points`, `line`...

You may add a background or save some settings before drawing using `par` function like `par(bg="...")`.
</div></div>

<hr class="sep-both">

## Random notes

<div class="row row-cols-lg-2"><div>

#### Update R

You can use this code to update R on Windows:

```R
if (!require(installr)) {
  install.packages("installr"); 
  require(installr)
}
updateR()
```

You can use this code to update R on Linux:

```R
list <- as.data.frame(installed.packages(.libPaths()[1]), stringsAsFactors = F)
install.packages(list$Package)
```
</div><div>

#### Formulas

Missing explanation.

```R
> ?formula
> X ~ qual
# $qual == uniq values | $quant == the values
> table(ech$qual, ech$quant)
> xtabs(~ qual + quant, ech) # with formulas
```

</div></div>