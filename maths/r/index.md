# R

In this course, we will see

* basic syntax
* survival kit
* files-functions
* maths-functions
* plot-functions

Knowledge of this course may (and will) be used in other
courses such as ``Statistics``, `Matrix`, 
``Numerical analysis`` or `Optimization`.

# Introduction

File extension is ``.R`` but we also write
``.Rmd`` files that are file with documentation
and runnable R code. You may also directly run some
code in the console.

Most people code in R using [R Studio](https://www.rstudio.com/)
but I will use [R plugin for IntelliJ](https://plugins.jetbrains.com/plugin/6632-r-language-for-intellij)
that is exactly the same as R Studio but in IntelliJ.

You may have to install package or libraries in the future,
simply do

* install a library : ``install.packages("name")``
* **load a library** (runtime) : ``library("nom");``

## Particularities

* weak-typing : R is guessing the type but you got some
explicit constructors if needed
* no need to add an "endline" character, but it's
``;`` if needed
* comments are made with ``#`` (inline)
* you can **print** using ``print(value)``
* **see help for a function** with ``?my_function``
    * examples with ``examples(my_function)``
    * args with ``args(my_function)``
    * source code with ``body(my_function)``