# Population

[Go back](..)

That's most likely a ``matrix`` of individuals (i = rows), and variables (j = columns). For instance, we could have humans as individuals, and their size, age, ... as variables.

<hr class="sl">

## Dataset in R

You can use the function ``data()`` to look for a dataset, and you could use ``data(name)`` to load a dataset.

```r
# see all dataset
data()
# load
data("iris")
# see some values
head(iris)
# Sepal.Length Sepal.Width Petal.Length Petal.Width Species
# 1          5.1         3.5          1.4         0.2  setosa
# 2          4.9         3.0          1.4         0.2  setosa
# 3          4.7         3.2          1.3         0.2  setosa
# 4          4.6         3.1          1.5         0.2  setosa
# 5          5.0         3.6          1.4         0.2  setosa
# 6          5.4         3.9          1.7         0.4  setosa
```