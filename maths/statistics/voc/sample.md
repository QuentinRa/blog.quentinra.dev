# Sample

[Go back](..)

We usually don't work on our original population, but on a sample of it. Why? Because we will try to make a model using around 80% of our data, then test it on the remaining 20%, so that we can check if we did something good/robust.

But more than 80-20, we usually look for a **representative** sample of the population, that must be **i.i.d** (`indépendantes et identiquement distribuées` =
follow the distribution and are independents).

<hr class="sl">

## Representative sample

A Sample is **representative** (`échantillon représentatif`) when we didn't lose any information from the previous sample (the dataset is a **representative** sample).

For instance, let's say you got the dataset $d = (0,1,0,1,0,1,1,0,1,0)$. A representative sample would be

* $d$ (this is a stupid answer, but this is a valid answer)
* this table

```r
# 0 1 
# 5 5 
```

You can still see that you got 5 "0" and 5 "1", so you didn't lose any information. This table is called a contingency table, and that's quite useful.

<hr class="sr">

## In R

We are using ``sample`` to create an i.i.d. sample of the dataset.

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