# Sample

[Go back](..)

We usually don't work on our original population
but on a sample of it. Why? because we will try to make
a model using around 80% of our data, then test it on the
remaining 20% so that we can check if we did something good.

But more than 80-20, we usually look for a
**representative** sample of the population, that must
be **i.i.d** (indépendantes et identiquement distribuées =
follow the distribution and are independents).

A Sample is **representative** when we didn't lost any
information from the previous sample (the dataset is a
**representative** sample).

In **R**, we are using ``sample`` to create an i.i.d.
sample of the dataset.

```r
head(iris)
# Sepal.Length Sepal.Width Petal.Length Petal.Width Species
# ...

# a sample of size=10 of Sepal.Length
head(sample(iris[,1], 10))
# 6.7 4.4 6.4 5.8 7.2 4.8

# another way of doing this
head(sample(iris$Sepal.Length, 10))
# 7.0 6.3 6.4 5.6 5.1 6.3
```