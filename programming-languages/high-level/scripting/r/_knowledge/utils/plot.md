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

<hr class="sr">

## Devices

Sometimes you may want to export a plot (without using Rmd). You can do that by changing the device. Create a device with 

* `pdf(path)` (PDF)
* `jpeg(path)` (JPG)
* `png(path)` (PNG)

Then you should get a number, keep it in mind. Every plot will be rendered in the device you opened. Then use `dev.off()` or `dev.off(number)` to close the device. You should be able to open/see the resulting file. You can also use `dev.copy(device=format, "path")`.

<hr class="sr">

## Contingency table

* **French**: `Tableau de contingence`
* **Function**: `balloonplot(table(x))`

Remember, that table is making a contingency table. You can visualize a contingency table using `balloonplot`.

<hr class="sl">

## Pivot table

* **French**: `Tableaux croisés`
* **Function**: `qhpvt(data, rows = ..., columns = ..., calculations = "...")`
* **Library**: `pivottabler`

You can observe the relation of a variable with other variables.

* data: your data
* rows: a vector of variables (i)
* cols: a vector of variables (j)
* calculation: the operation we will do on each (i,j)
  * mean() (mean)
  * n() (count)
  * ...
* formats: cell format (ex: `%.1f`)
* totals: totals line (`totals='totals=NONE'`=remove totals)