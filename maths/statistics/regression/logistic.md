# Logistic regression

[Go back](../index.md#regression)

If $Y \in [0,1]$, then you may use the Logistic regression. The left of the formula is changing a bit, while the right-side will not.

@
\log(\frac{P(X=n)}{1-P(X=n)}) = a + b X + c Z
@

You may notice that there are no residuals anymore.

<hr class="sl">

## Simple logistic regression

You will use the function ``glm``.

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

## Multiple logistic regression

```r
# regression Y = a + b * X + c Z
model <- glm(Y ~ X + Z, data=ech, family="binomial")
```

<hr class="sl">

## Results

You will need to evaluate ``exp(b)`` if you want to get ``b'`` value. Then `b'` is the same as the `b` you know in linear regression.

If you want all of them, then use

```r
exp(coefficients(model))
```

If you are using ``drop1``, then the syntax changed a bit to

```r
drop1(model, .~., test="Chisq")
```

<hr class="sr">

## Conditions

If we are considering $|X|$ equals to

* **1**: if the variable is a quantitative or binary variable
* else the number of levels minus 1 ``length(levels(qual))-1``

Then the condition for $Z = a + bX + cT$

* $(|X|+|Z|+|T|) * 5 \le n$
* or better $(|X|+|Z|+|T|) * 10 \le n$w