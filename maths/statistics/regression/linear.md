# Linear regression

[Go back](../index.md#regression)

Everything related to linear regression such as simple/multiple linear regression, synergy, and the conditions for a regression model to be valid.

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

**Note**: you may also give a subset to lm using subset parameter if you were planning to use subset function.

<hr class="sr">

## Multiple linear regression

The following model $Y = a + b X + c Z + d T + ... + residual$ is given by

```r
model <- lm(Y ~ X + Z + T)
```

I made an [example here](examples/mlr.md).

**Note** that the result interpretation is a bit different, if you have $b = 0.6$, $c = 0.1$, $d = 0.2$ then increasing $X$ by 1 tend to increase $Y$ by $0.6+0.1+0.2=0.9$.

<hr class="sl">

## Synergy

If you want to know the correlation for $\text{X AND Z}$ then you should use $*$ operator.

```r
model <- lm(Y ~ X * Z)
```

This is called a synergy. Beware that you can't do (I don't know why)

```r
lm(Y ~ X + Z + X*Z)
# do it separatly
lm(Y ~ X + Z)
lm(Y ~ X * Z)
```

<hr class="sr">

## Conditions

* Normality of Residuals
  * ``resid(model)`` or `residuals(model)`
  * try using a histogram, a QQ-plot
* Residuals' variance must not be dependent on the variables
* No correlation

The more **Residual standard error** (RSE) is small, and the more our model will be accurate.

The **Multiple R-squared** ($R^2$) is used to compare models. This is the percent (if multiplied by 100) of the variance explained by the predictor variables. This is telling us how much the predictor variables are predicting the result of the response variable.