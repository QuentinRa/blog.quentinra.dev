# Variables

[Go back](..)

Columns of our matrix, basically the properties of the
individuals we are observing. They
can be **quantitative** ou **qualitative**.

A variable **quantitative** is a measurement, for instance
if we took two values, we can subtract them (in order to compare
them).

They usually follow a distribution

* continue: can take an infinite number of values
* discrete: can take a finite number of values

```
ex: age, size, score, ...
```

A variable **qualitative** (or catégorielles in French) 
is the other kind of properties. This include

* binary : take values like 0 or 1, true or false
* ordered: sorted like easy < medium < hard
* not ordered: the others

<div class="sr"></div>

## in R

In R, ``qualitative`` variables usually have the `factor` type.

```r
# get information about the variable types
str(iris)
# 'data.frame':	150 obs. of  5 variables:
#  $ Sepal.Length: num  5.1 4.9 4.7 4.6 5 5.4 4.6 5 4.4 4.9 ...
#  $ Sepal.Width : num  3.5 3 3.2 3.1 3.6 3.9 3.4 3.4 2.9 3.1 ...
#  $ Petal.Length: num  1.4 1.4 1.3 1.5 1.4 1.7 1.4 1.5 1.4 1.5 ...
#  $ Petal.Width : num  0.2 0.2 0.2 0.2 0.2 0.4 0.3 0.2 0.2 0.1 ...
#  $ Species     : Factor w/ 3 levels "setosa","versicolor",..: 1 1 1 1 1 1 1 1 1 1 ...
```

A factor is basically a variable that got levels (the values),
and you can order the levels.

```r
levels(iris$Species)
# [1] "setosa"     "versicolor" "virginica" 
```

Here you can read that as ``"setosa" > "versicolor" > "virginica"``
but that doesn't make sense here trough.

<div class="sl"></div>

## Convert a variable in R

Sometimes, your variables are qualitative (because you know it)
but R didn't detect it as qualitative so you would have
to convert it.

...