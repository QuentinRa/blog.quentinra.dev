# Multiple linear regression (example)

[Go back](../linear.md#multiple-linear-regression)

This is an example of multiple linear regression.

```r
# preparing some data
data('mtcars')
v <- mtcars
# now we want to check if the number is
# cylinders (cyl) and the weight (wt) are impacting the horsepower (hp)
model <- lm(v$hp ~ v$cyl)
# or
model <- lm(hp ~ cyl + wt, data = v)
# and we can check the result
summary(model)
```