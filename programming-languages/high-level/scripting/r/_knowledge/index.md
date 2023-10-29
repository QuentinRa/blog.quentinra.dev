# R Language

<div class="row row-cols-md-2"><div>

[R](https://www.r-project.org/) is primarily used for statistical computing and data analysis.

```shell!
$ sudo apt install r-base
$ sudo apt install r-base-dev
$ R -q
> quit()
```

We often use [R Studio](https://www.rstudio.com/) or [IntelliJ](https://plugins.jetbrains.com/plugin/6632-r-language-for-intellij) to write R code.
</div><div>

A basic script `my_script.R` file:

```R
cat("Hello, World!\n")
```

From the terminal, you can run the script using:

```shell!
$ Rscript my_script.R
```
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
myvar        # implicit
print(myvar) # explicit
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

**switch**

```r
res <- switch(value, case_1, case_2, case_n)
```
</div><div>

#### Loops

* `next`: in a loop, go to the next iteration
* `break`: in a loop, exit the loop

```r
while(condition) {}

# use break to exit
repeat {}
```

**foreach / for i in**

```r
for (var in vector){
  
}
```
</div></div>

<hr class="sep-both">

## 👻 To-do 👻

Stuff that I found, but never read/used yet.

<div class="row row-cols-md-2"><div>

* [_old](_old.md)
* `.Rmd` for documentation
* magrittr [documentation here](https://cran.r-project.org/web/packages/magrittr/magrittr.pdf)
* `%in%`
* vector, matrix, data.frame (excel), list (named indexes, diff types)

```
r <- c(NULL, 3)
# [1] 3

# generating random values
v <- runif(10, 0, 1)
# making a vector of booleans
v <- sapply(v, FUN = function (x) { x > 0.5 })
```
</div><div>
</div></div>