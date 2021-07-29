## Simple linear regression (example)

[Go back](../linear.md)

```r
# preparing some data
data('mtcars')
v <- mtcars
v$cyl <- factor(v$cyl)
# now we want to check if the number is
# cylinders (cyl) is impacting the horsepower (hp)
model <- lm(v$hp ~ v$cyl)
# or
model <- lm(hp ~ cyl, data = v)
# and we can check the result
summary(model)
```