# Linear regression

[Go back](..)

<hr class="sr">

## Simple linear regression

You will use the function ``lm``.

```r
# regression Y = a + b * X
# Y = quantitative variable
# X = quantitative/qualitative variable
model <- lm(Y ~ X, data=ech)
# or
model <- lm(ech$Y ~ ech$X)
# check the result table
summary(model)
```

I made an [example here](examples/slr.md).

**Note**: you may also give a subset
to lm using subset parameter
if you were planning to use
subset function.

<hr class="sr">

## Multiple linear regression

The following model $Y = a + b X + c Z + d T + ... + residual$
is given by

```r
model <- lm(Y ~ X + Z + T)
```

I made an [example here](examples/mlr.md).

**Note** that the result interpretation is a bit different,
if you have $b = 0.6$, $c = 0.1$, $d = 0.2$ then increasing
$X$ by 1 tend to increase $Y$ by $0.6+0.1+0.2=0.9$.

<hr class="sl">

## Synergy

If you want to know the correlation
for $\text{X AND Z}$ then you should use $*$ operator.

```r
model <- lm(Y ~ X * Z)
```

This is called a synergy. Beware that you can't
do (dunno why)

```r
lm(Y ~ X + Z + X*Z)
# do it separatly
lm(Y ~ X + Z)
lm(Y ~ X * Z)
```