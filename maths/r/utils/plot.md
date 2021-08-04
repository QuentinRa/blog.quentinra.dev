# Plots

[Go back](../index.md)

Almost all the plots' functions have these arguments

* ``main = "title"``: plot title
* ``xlab = "title x"``: x-axis title
* ``ylab = "title y"``: y-axis title
* ``xlim = lim``: x's values goes up to lim
* ``ylim = lim``: y's values goes up to lim
* ``col = 'color'``: set the color (ex: `'red'` or `red(1.0)` in `crayon`)

<hr class="sl">

## Plot

* **French**: ``Diagramme de points``
* **Function**: ``plot(x)``

If you have more than one point at a position, you
won't see it using plot, so you will have
to use ``plot(jitter(x))`` to move the points a bit
before rendering them.

<hr class="sr">

## Histogram

* **French**: ``Histogramme``
* **Function**: ``hist(x)``

New arguments

* ``border = color``
* ``breaks = seq(...)``: make more columns, smaller intervals
* ``nclass = v``: make $v$ intervals

Notes

We are adding the argument
``prob = TRUE`` sometimes in statistics to make
an histogram of the frequencies instead of the
quantities.

<hr class="sl">

## Bar chart

* **French**: ``Diagramme en batons/barres``
* **Function**: ``barplot(table(qual))``

Let's say you got a qualitative variable
(a variable taking finite values like Men/Women/Other)
then you can see using this graph how many persons
are taking each value.

<hr class="sr">

## Pie chart

* **French**: ``Camembert``
* **Function**: ``pie(table(qual))``

Same as for Bar chart but represented using the
traditional pie chart.

<hr class="sl">

## Box plot

* **French**: ``Boite à moustache``
* **Function**: ``boxplot(???)``

My favorite one. You can

* see the repartition (quantiles, ...) for a variable (``boxplot(x)``)
* ... by a criteria (`boxplot(quant ~ qual)`)

```r
data('mtcars'); cars <- mtcars
cars$cyl.qual <- factor(cars$cyl)
# you will see for each value
# or cyl=the number of cylinders
# the repartition of
# hp=the horse power
boxplot(cars$hp ~ cars$cyl.qual)
```

![](images/boxplot.png)

The highest bar is the 3rd quantile, the lowest
one is the first quantile and the black bar is the
median (2nd quantile).

<hr class="sr">

## ???

* **French**: ``Diagramme temporel/de températures``
* **Function**: ``plotmeans(quant~qual)`` (from `gplots`)

If you want to see the evolution of a quantitative
variable with a temporal qualitative variable,
then use this. The value at a time $t$ is the mean
of the values observed at the time $t$.

<hr class="sl">

## ???

* **French**: ``Diagramme en fagot``
* **Function**: ``interaction.plot(qual, quant, quant, lty=1, legend=FALSE)``

Same as the diagram above, but this time we are
not taking the mean and representing all values.

<hr class="sr">

## Contingency table

* **French**: ``Tableau de contingence``
* **Function**: ``balloonplot(table(x))``

Remember that table is making a contingency table. You
can visualize a contingency table using this function.