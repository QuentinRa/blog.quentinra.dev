# Merging data

[Go back](discovery.md)

Sometimes, you will have a problem: You don't
have enough data. In Statistical inference,
some tests are requiring $n \ge 5$ or $n \ge 30$.

Maybe you could...

<hr class="sr">

## Merge datasets

```r
merge(data1, data2, by="common_column_name")
```

<hr class="sl">

## Use Additive Smoothing

Also called ``Lissage de Laplace/Lissage laplacien``
or Laplace smoothing.
We are artificially adding values.

Let's say you are evaluating a value by year. You can
consider that having no values means having $0$
and because the mean is linear, you can add alpha=one
to all values.

<hr class="sr">

## Bootstrap method

From what I understood (but my teachers do not
seems to agree), the bootstrap method allows us
to increase the number of data. What I do is

* given a sample $x$
* pick $n$ (for instance 10000) elements from $x$
  (sample with replacement)
* $y = mean(x)$
* add $y$ to $x$

Sometimes, instead of using $mean(x)$ (because
you might get a value outside $x$ or because the
mean is a bit problematic as you will see later),
you may use the median.