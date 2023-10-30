# Plots

[Go back](../index.md)

Learn about devices, and the most well-known plots such as histograms, bar charts, pie charts, and box plots.

<hr class="sl">

Almost all the plots' functions have these arguments

* `main = "title"`: plot title
* `xlab = "title x"`: x-axis title
* `ylab = "title y"`: y-axis title
* `xlim = lim`: x's values goes up to lim
* `ylim = lim`: y's values goes up to lim
* `col = 'color'`: set the color (ex: `'red'` or `red(1.0)` in `crayon`)

<hr class="sl">

## Utilities

Before starting, you may use these functions to add some lines, ... to a plot

* `points`: draw points
* `line`: draw points
* `abline` : draw a line $y=ax+b$ (you may use h=x or v=y)
* `legend`: add a legend
* `title`: add a title
* others: `rect`, `segments`, `polygon`, `box`, `grid`

You may add a background or save some settings before drawing using `par` function like `par(bg="...")`.