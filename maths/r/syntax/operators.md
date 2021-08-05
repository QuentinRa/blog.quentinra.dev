# Operators

[Go back](../index.md)

* The 4 basics: <b>+, -, /, \*</b>
* Exponentiation: **number^k**
* Assignation: **var <- value** or **var = value** (overuse of =)
* Specials: **%%** (mod), **%/%** (Integer division)
* Others: **sqrt, abs, log, xor, sum, ...**

In R, there are a lot of weirds shortcuts operators
like **%in%** or **%/%**. They may be hard to remember
so you can use the library **magrittr** 
([doc](https://cran.r-project.org/web/packages/magrittr/magrittr.pdf))
to use a function instead.

<hr class="sl">

## Comparison

You got the usual ones

* **>, >=, <=, <**
* **==** (equality)
* **!=** (difference)
* **!** (negation)

But there is a small difference for booleans's operators

* **&**: all conditions are true
* **|**: at least one condition is true
* **&&**: same as **&** but on a vector, the result is a value and not a vector
* **||**: same as **|** but on a vector, the result is a value and not a vector

**&&** et **||** are doing a AND only on the first element
of a vector.

```r
# generating random values
v <- runif(10, 0, 1)
# making a vector of booleans
v <- sapply(v, FUN = function (x) { x > 0.5 })
# print
v
[1] FALSE  TRUE  TRUE  TRUE FALSE  TRUE  TRUE FALSE  TRUE FALSE
# check &
TRUE & v
[1] FALSE  TRUE  TRUE  TRUE FALSE  TRUE  TRUE FALSE  TRUE FALSE
# check &&
TRUE && v
# [1] FALSE
# now the first value is TRUE so TRUE && TRUE = TRUE
v[1] <- TRUE
TRUE && v
# [1] TRUE
```