# Regression table/model

[Go back](../index.md#regression)

The regression model is defined by our equation $Y = a + b X + residual$. We are introducing, like in the tests, two hypotheses

* $H0: b = 0$
* $H1: b \neq 0$, meaning that b is significantly increasing Y

We are looking for $b$. Once you did evaluate your regression model (explained later), you will print it using `summary` giving you something like this

```r
# simple linear regression - example - result
summary(model)

Call:
  lm(formula = hp ~ cyl, data = v)

Residuals:
  Min     1Q Median     3Q    Max
-54.61 -25.99 -11.28  21.51 130.39

Coefficients:
             Estimate Std. Error t value Pr(>|t|)
(Intercept)  -51.054     24.982  -2.044   0.0499 *
cyl           31.958      3.884   8.229 3.48e-09 ***
---
Signif. codes:  0 ‘***’ 0.001 ‘**’ 0.01 ‘*’ 0.05 ‘.’ 0.1 ‘ ’ 1

Residual standard error: 38.62 on 30 degrees of freedom
Multiple R-squared:  0.693,	Adjusted R-squared:  0.6827
F-statistic: 67.71 on 1 and 30 DF,  p-value: 3.478e-09
```

As you should have remembered

* **a**: intercept coefficient and $a$ value is at the line "(Intercept)", column "Estimate".
* **b**: our variable X is cyl so $b$ value is at the line "(cyl)", column "Estimate".
* **p-value** : column Pr, as for the tests, it's indicating whether H0 or H1 may be the best fitting hypothesis.

You should read interpret the result as "if X is increasing by 1 then in average, Y tend to increase by $b$". Of course, you should check the p-value because the variable may not be correlated.

> **Note**: You can easily get the correlation with $r = b * \frac{\sigma_{X}}{\sigma_{Y}}$.