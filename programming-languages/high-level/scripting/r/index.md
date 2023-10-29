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
a <- "test"
b <- 5
r <- NULL
assign(a, "test")
```

⚠️ You can use the `=` symbol too as [described here](https://developer.r-project.org/equalAssign.html).

#### Types

...

#### Conversions

...
</div><div>

#### Print some text in the terminal

```R
myvar        # implicit
print(myvar) # explicit
```

#### Operators

...
</div></div>

<hr class="sep-both">

## Control-flow structures

<div class="row row-cols-lg-2"><div>

#### Branching

...
</div><div>

#### Loops

...
</div></div>

<hr class="sep-both">

## 👻 To-do 👻

Stuff that I found, but never read/used yet.

<div class="row row-cols-md-2"><div>

* [_old](_old.md)
* `.Rmd` for documentation

```
r <- c(NULL, 3)
# [1] 3
```
</div><div>
</div></div>