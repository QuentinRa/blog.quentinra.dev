# R Language

<div class="row row-cols-md-2"><div>

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

To iterate vectors, you can use `for`:

```r
for (var in vector){
}
```
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
</div><div>

#### Named Indexes

```R
v <- c(yes = 1, no = 0)    # named indexes
names(r)                   # vector("yes" "no")
match(c("no"), names(r))   # index of the name
```

<br>

#### Vector functions

Common functions:

* `head(v)`: first values
* `tail(v)`: last values
* `View(v)`: visual of the vector content
* `length(v)`: size
* `value %in% v`: true if value is in v
* `is.element(e,v)`: true if e is in v

Other functions:

* `attributes(v)`: get attributes (dim, ...)
* `rev(v)`: reverse
* `sort(v)`/`order(v)`: sort
* `identical(v1,v2)`: true if they are the same
* `any(v op value)`: true if at least one value make the condition true
* `all(v op value)`: true if all values make the condition true
* `duplicated(v)`: true if a value is duplicated, for each value
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
* `trimws(str)`: trim, remove leading and trailing spaces

<br>

#### XXX

xxx
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

## Maths

<div class="row row-cols-lg-2"><div>

#### Math Vector Functions

* `which.min(v)`: index of the min value
* `which.max(v)`: index of the max value
* `sum(v)`: sum of all elements
* `prod(v)`: product of all elements
* `intersect(x,y)`
* `union(x,y)`
* `setdiff(x,y)`
* `mlv` (library `modeest`): get the mode
</div><div>

...
</div></div>

<hr class="sep-both">

## 👻 To-do 👻

Stuff that I found, but never read/used yet.

<div class="row row-cols-md-2"><div>

* [_old](_old.md)
* magrittr [documentation here](https://cran.r-project.org/web/packages/magrittr/magrittr.pdf)
* `%in%`
* matrix, data.frame (excel), list (named indexes, diff types)

```
r <- c(NULL, 3)
# [1] 3

# generating random values
v <- runif(10, 0, 1)
# making a vector of booleans
v <- sapply(v, FUN = function (x) { x > 0.5 })
```
</div><div>

```r
table(ech$qual, ech$quant) # uniq valeus => the values
xtabs(~ qual + quant, ech) # use formulas

vect <- sample(0:10, 50, replace = TRUE)
# you can fill it
# (random values between [1,5])
sapply(v, function (unused){ return(sample(1:5, 1)) })
sapply(one_to_ten, function (i) { print(i) } )
# [1] 2 5 2 3 4

# generate 10 integers within [0,100]
runif(10,0,100)

sample(1:100, 6)
```
</div></div>