# Logistic regression

[Go back](..)

If $Y \in [0,1]$, then you may use the Logistic
regression. The left of the formula is changing
a bit, while the right-side will not.

@
\log(\frac{P(X=n)}{1-P(X=n)}) = a + b X + c Z
@

You may notice that there is not residuals anymore.

<hr class="sl">

## Simple logistic regression

You will use the function ``lm``.

```r
# regression Y = a + b * X
# Y = quantitative variable
# X = quantitative/qualitative variable
model <- glm(Y ~ X, data=ech, family="binomial")
# or
model <- lm(ech$Y ~ ech$X, family="binomial")
# check the result table
summary(model)
```

<hr class="sl">

## Simple logistic regression

```r
# regression Y = a + b * X + c Z
model <- glm(Y ~ X + Z, data=ech, family="binomial")
```

<hr class="sl">

## Results

You will need to evaluate ``exp(b)`` if you want to
get ``b'`` value. Then `b'` is the same as the `b`
you know in linear regression.

If you want all of them, then use

```r
exp(coefficients(model))
```

If you are using ``drop1``, then the syntax
changed a bit to

```r
drop1(model, .~., test="Chisq")
```