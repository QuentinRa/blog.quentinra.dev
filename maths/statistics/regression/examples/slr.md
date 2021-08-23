# Simple linear regression (example)

[Go back](../linear.md#simple-linear-regression)

This is an example of simple linear regression.

```r
# preparing some data
data('mtcars')
v <- mtcars
# now we want to check if the number is
# cylinders (cyl) is impacting the horsepower (hp)
model <- lm(v$hp ~ v$cyl)
# or
model <- lm(hp ~ cyl, data = v)
# and we can check the result
summary(model)
```