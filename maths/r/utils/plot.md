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
