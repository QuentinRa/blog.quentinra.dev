# R

R is a language that may be helpful to
do so mathematics. We will use it
in other course such as **Statistics**, **Matrix**, 
**Numerical analysis** or **Optimization**.

You can use other languages such as Python, Julia,
OCaml, according to what you want to do.

<hr class="sl">

# Introduction

File extension is ``.R`` but we also write
``.Rmd`` files that are file with documentation
and runnable R code. You may also directly run some
code in the console.

Most people code in R using [R Studio](https://www.rstudio.com/)
but I will use [R plugin for IntelliJ](https://plugins.jetbrains.com/plugin/6632-r-language-for-intellij)
that working exactly the same as R Studio (same
interface elements, console, etc.) but in IntelliJ.

You may have to install package or libraries in the future,
simply do

* install a library : ``install.packages("name")``
* **load a library** (runtime) : ``library("name");``

<hr class="sr">

## Basic course

You can check this fast course
to learn the basic of R without details [Learn R
in 5 minutes](5min.md).

Then here is the real course.

* [Variables](syntax/variables.md)
* [Types](syntax/types.md)
  * [Strings](syntax/types/strings.md)
  * [Vectors](syntax/types/vectors.md)
  * [Matrix](syntax/types/matrix.md)
  * [Contingency tables](syntax/types/table.md)
  * [Factors](syntax/types/factors.md)
  * [Data.frame](syntax/types/data-frame.md)
* [Operators](syntax/operators.md)
* [Structures](syntax/structures.md)
* [Functions](syntax/functions.md)

And here you can learn how to write
[Rmd documentation](rmd.md).

<table class="table table-dark table-bordered table-striped">
<tr><th class="text-center">Other notes about the Language</th></tr>
<tr><td>
The semicolon <code>;</code> at the end of a line is optional.
You may use it if you make more than one expression
per line.
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

You will use this a lot, you can
**see the help for a function** with ``?my_function``
* examples with ``examples(my_function)``
* args with ``args(my_function)``
* source code with ``body(my_function)``
</td></tr>
<tr><td>
Open the documentation either in your IDE or your browser
with <code>help.start()</code>.
</td></tr>
<tr><td>
Either look or load a dataset
with <code>data()/data('dataset')</code>.
</td></tr>
<tr><td>
Let's say you got a vector of numbers <code>data$numbers</code>,
if you are planning to make a vector of positives numbers
in R, then we usually name the resulting vector like this
<code>data$numbers.a_name_here</code>. Same for a function
generalizing another etc. (name => name.generalization)
</td></tr>
<tr><td>
There are a lot of shortened words or it seems so. For instance,
you can use <code>T</code> for <code>TRUE</code>. For functions,
you can use <code>prob/proba</code> for <code>probability</code> etc.
</td></tr>
</table>

<hr class="sl">

## Advanced notes

Here you can find some course about functions
that you might use or not.

* [Environment](utils/environment.md)
* [Files](utils/files.md)
* [Maths](utils/maths.md)
* [Plots](utils/plot.md)

<hr class="sr">

## Exercises

...

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