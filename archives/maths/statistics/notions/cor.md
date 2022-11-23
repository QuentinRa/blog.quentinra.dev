# Correlation

[Go back](../index.md#maths-recap)

The correlation is a value between 1 and -1. Let X and Y be two variables then if their correlation is

* $-1$: perfect negative correlation
* around $-1$: negative correlation
* $0$: no correlation
* around $1$: positive correlation
* $1$: perfect positive correlation

A positive correlation means that when X increase, Y increase. (resp. negative). The correlation is perfect when both variables are increasing/decreasing together. Otherwise, if one increase and the other decrease, we have an imperfect correlation. 

<hr class="sl">

## Correlation in R

You may use

```r
cor(x, y)
# if you have NA's
cor(x, y, use="complete.obs")
```

You may also use the Pairwise comparison (`Comparaison par paires`) with the `ggpairs` function in the ``GGally`` library.