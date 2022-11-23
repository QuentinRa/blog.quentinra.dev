# Converting a variable in R

[Go back](discovery.md)

Sometimes, your variables are qualitative (because you know it), but R didn't detect it as qualitative, so you would have to convert it.

<hr class="sl">

## Changing the type

You should remember that R is proposing functions like ``as.type(x)`` to convert a variable $x$ to the type $type$ (as.integer(), as.Date() etc.).


<hr class="sr">

## Weighted data

If you ever have two vectors, one for the values $v$ and another one for the probabilities $p$ then you may use

```r
library('questionr')

wtd.mean(v, p)
wtd.var(v, p)

# base package
weighted.mean(v,p)
```

<hr class="sl">

## Qualitative to Quantitative

Let's say "qual" is a qualitative variable of $v$, then $as.integer(v$qual)$ created a quantitative variable (but $qual is unchanged, we are usually keeping the old variable and create a new one).

```r
data(Puromycin)
v <- Puromycin
str(v)
# 'data.frame':	23 obs. of  3 variables:
# ...
# $ state: Factor w/ 2 levels "treated","untreated": 1 1 1 1 1 1 1 1 1 1 ...
v$state_quant <- as.integer(v$state)
```

<hr class="sr">

## Quantitative to Qualitative (simple case)

Simply use the factor function ``factor(ech$quant)``, with ``levels(ech$qual)``/`table(ech$qual)` to see the different kinds of values of a qualitative variable.

```r
# converting back v$state_quant
v$state_qual <- factor(v$state_quant, levels = c(1,2), labels = c("treated", "untreated"))
```

<hr class="sl">

## Quantitative to Qualitative (Unsupervised discretization)

If you have too many levels (different values), then you may want something else than the simple factor. For instance, let's say you got a variable "Age" and you want to make a qualitative variable to make some groups by age.

```r
library('arules')

# create groups of n values
discretize(qual, method = "frequency", breaks = n)

# split in n interval having the same size
discretize(qual, method = "interval", breaks = n)

# put the values in a group with the ones near them
discretize(qual, method = "cluster", breaks = n)
```

<hr class="sr">

## Quantitative to Qualitative (Supervised discretization)

This is another alternative in which we are grouping the values according to a qualitative criterion.

* chiM

```r
library('discretization')
# if the values are near (epsilon=0.05), then they are in the
# same group
chiM(ech$quant, alpha = 0.05)
```

* cut

```r
# cut, v is a vector like
# (1,3,5) will split the distribution
# in [min,1] U ]1,3] U ]3,5]
cut(x, breaks = v, include.lowest = TRUE)
```

* make.groups

```r
library('lattice')
# check the examples/documentation
g <- make.groups(name=v, ...)
# levels
g$which
# values
g$data
# the result is something like this
g
#              data       which
# uniform1     0.2988667     uniform
# uniform2     0.5579879     uniform
# exponential1 2.1288421 exponential
# exponential2 0.7936762 exponential
# lognormal1   0.6568099   lognormal
# lognormal2   1.8459960   lognormal
```