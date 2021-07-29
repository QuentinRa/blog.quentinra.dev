# Convert a variable in R

[Go back](discovery.md)

Sometimes, your variables are qualitative
(because you know it)
but R didn't detect it as qualitative so you would have
to convert it.

<hr class="sr">

## Changing the type

You should remember that R is proposing functions
like ``as.type(x)`` to convert a variable $x$ to
the type $type$ (as.integer(), as.Date() etc.).

<hr class="sl">

## Qualitative to Quantitative

Let's say "qual" is a qualitative variable
of $v$, then $as.integer(v$qual)$
created a quantitative variable (but
$qual is unchanged, we are usually keeping
the old variable and create a new one).

```r
data(Puromycin)
v <- Puromycin
str(v)
# 'data.frame':	23 obs. of  3 variables:
# ...
# $ state: Factor w/ 2 levels "treated","untreated": 1 1 1 1 1 1 1 1 1 1 ...
v$state_qual <- as.integer(p$state)
```