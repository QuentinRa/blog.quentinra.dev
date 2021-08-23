# Variables

[Go back](..)

Variables are the columns of our matrix, basically the properties of the individuals we are observing. They can be **quantitative** or **qualitative**.

A **quantitative** variable is a measurement, for instance, if we took two values, we can subtract them (to compare them).

They usually follow a distribution

* continue: can take an infinite number of values
* discrete: can take a finite number of values

```
ex: age, size, score, ...
```

A **qualitative** variable (``catégorielles``) is either

* binary: taking values like 0 or 1, true or false
* ordered: the values are sorted like easy < medium < hard
* not ordered: the rest

<hr class="sr">

## Variables in R

Qualitative variables are usually from the **factor** class.

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

A factor is a variable that got levels (the unique values), and you can order the levels.

```r
levels(iris$Species)
# [1] "setosa" "versicolor" "virginica" 
```

Here you can read that as ``"setosa" > "versicolor" > "virginica"``, but that doesn't make sense here, since this does not seem like an ordered qualitative variable.