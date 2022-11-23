# Dealing with NA values

[Go back](discovery.md)

Sometimes, values are missing from our data and the empty value is **NA**. The problem of NA values is that they are messing with the results because $0+1+NA=NA$ (for any kind of operation (NA is a sort of absorbing element).

* You can use `summary(d)` then check `NA's:<number>` values
* You can check how many NA you have with ``sum(is.na(d$var))`` (with var the variable checked)
* You can use ``complete.cases(d)`` to get the number of lines without NA
* you can use a plot ``library(visdat);vis_miss(d);``

<hr class="sr">

## Taking action

Then you have to make a choice

* delete lines with NA (not recommended, check  `na.omit(...)`)
* replace NA by a value

```r
# example
# if the value is NA
# then we are using the mean instead
ech$quant[is.na(ech$quant)] <- mean(ech$quant, na.rm = TRUE)
```

* notice the ``na.rm = TRUE`` above, that's also a way of dealing with NA because some methods are taking a parameter as to how they should deal with NA value (here it's deleting)