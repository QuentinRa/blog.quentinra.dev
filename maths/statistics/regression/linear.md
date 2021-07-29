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