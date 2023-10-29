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

#### Declare a variable

We use `<-` to assign a variable.

```R
a <- 5
assign(a, 5)
```

⚠️ You can use the `=` symbol too as [described here](https://developer.r-project.org/equalAssign.html).

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
</div><div>

#### Print some text in the terminal

```R
myvar                                     # implicit
print(myvar)                              # explicit
print(paste("Hello", "World"))            # concatenation
cat(paste("Hello", "World"), sep = "\n")  # using "cat"
```

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

#### Operations

⚠️ Operators such as `+` or `&&` behave differently on vectors.

```R
c(1, 2, 3, 4) + c(0,10)
# implicit: c(1, 2, 3, 4) + c(0,10,0,10)
# result: vector(1 12 3 14)
```

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
# you can fill it
# (random values between [1,5])
sapply(v, function (unused){ return(sample(1:5, 1)) })
# [1] 2 5 2 3 4

# generate 10 integers within [0,100]
runif(10,0,100)
```
</div></div>