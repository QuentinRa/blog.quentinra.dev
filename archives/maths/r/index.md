# R programming

R is a language that may be helpful to do mathematics. We will use it in other course such as **Statistics**, **Matrices**,  **Numerical analysis** or **Optimization**.

You can use other languages such as Python, Julia, OCaml, according to what you want to do.

<hr class="sl">

## Introduction

The file extension is `.R` but we also write `.Rmd` files that are files with documentation and runnable R code. You may also directly run some code in the console.

Most people code in R using [R Studio](https://www.rstudio.com/), but I will use [R plugin for IntelliJ](https://plugins.jetbrains.com/plugin/6632-r-language-for-intellij) that working exactly the same as R Studio (same interface elements, console, etc.) but in IntelliJ.

You may have to install packages or libraries in the future, simply do

* install a library : `install.packages("name")`
* **load a library** (runtime) : `library("name");`

<hr class="sr">

## Basic course

You can check this fast course to learn the basics of R without details [Learn R in 5 minutes](5min.md).

Then here is the real course.

* [Variables](syntax/variables.md)
* [Types](syntax/types.md)
  * [Strings](syntax/types/strings.md)
  * [Vectors](syntax/types/vectors.md)
  * [Matrix](syntax/types/matrix.md)
  * [Lists](syntax/types/lists.md)
  * [Contingency tables](syntax/types/table.md)
  * [Factors](syntax/types/factors.md)
  * [Data.frame](syntax/types/data-frame.md)
* [Operators](syntax/operators.md)
* [Structures](syntax/structures.md)
* [Functions](syntax/functions.md)
* [Vector Functions](syntax/types/vectors-fun.md)

And here you can learn how to write [Rmd documentation](rmd.md).

<table class="table border-dark table-bordered table-striped">
<tr><th class="text-center">Other notes about the Language</th></tr>
<tr><td>
The semicolon <code>;</code> at the end of a line is optional. You may use it if you make more than one expression per line.
</td></tr>
<tr><td> 
Use <code>#</code> for comments
</td></tr>
<tr><td> 
Use <code>print(value)</code> to print something.

```r
x <- "Hello"
y <- "World"
print(paste(x, y))
# [1] "Hello World"
cat(paste(x, y), sep = "\n")
# Hello World
```
</td></tr>
<tr><td>

You will use this a lot, you can **see the help for a function** with `?my_function`
* examples with `examples(my_function)`
* args with `args(my_function)`
* source code with `body(my_function)`
</td></tr>
<tr><td>
Open the documentation either in your IDE or your browser with <code>help.start()</code>.
</td></tr>
<tr><td>
Either look for or load a dataset with <code>data()/data('dataset')</code>.
</td></tr>
<tr><td>
In R, when you are making a generalization of something, you usually name it <code>name.generalization_name</code>. For instance, if you got a vector of numbers <code>data$numbers</code>, then you would have <code>data$numbers.pos</code>. Same for functions like <code>mean</code>, <code>mean.test</code>,
...
</td></tr>
<tr><td>
There are a lot of shortened words or it seems so. For instance, you can use <code>T</code> for <code>TRUE</code>. For functions, you can use <code>prob/proba</code> for <code>probability</code> etc.
</td></tr>
</table>

<hr class="sl">

## Advanced notes

Here you can find some notes about functions that you might use (mainly in statistics).

* [Environment](utils/environment.md)
* [Files](utils/files.md)
* [Maths](utils/math.md)
* [Plots](utils/plot.md)

<hr class="sr">

## Updating R

* Windows

```r
if(!require(installr)) {
  install.packages("installr"); 
  require(installr)
}
updateR()
```

* Linux/MacOs

```r
list <- as.data.frame(installed.packages(.libPaths()[1]), stringsAsFactors = F)
install.packages(list$Package)
```

<hr class="sl">

## Sources

* « Take only pictures, leave only footprints. »
* Swirl, R programming
* <https://pbil.univ-lyon1.fr/R/pdf/lang01.pdf> (01-04)
* Initiation à R - Eric Preud’homme
* Introduction à R - Christophe Lalanne & Bruno Falissard
* R - Vincent ISOZ, Daname KOLANI
* Régression avec R - Pierre-André Cornillonn & Eric Matzner-Løber

[References](refs.md)