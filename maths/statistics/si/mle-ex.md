# Maximum Likehood estimation (examples)

[Go back](../index.md#estimators-and-likehood)

You may replace any usage of the Likehood function
by the Log-Likehood function.

Also, if you are a student at the ENSIIE engineering
school, do not use ``fitdistr`` values as the first
parameter and use the values you used to generate
the distribution.

<hr class="sl">

## Bernoulli

```r
# first does not matter since we added bounds
first <- 0.0

r <- optim(
  fn = L_bern, par = first, x = x,
  method = 'L-BFGS-B', lower = 0.0, upper = 1.0
)
```

<hr class="sr">

## Weibull distribution

```r
# fitdistr --
lx <- log(x)
m <- mean(lx)
v <- var(lx)
shape <- 1.2 / sqrt(v)
scale <- exp(m + 0.572 / shape)
first <- c(shape = shape, scale = scale)
# --

r <- optim(
  fn = L_weibull, par = first, x = x,
  method = 'L-BFGS-B'
)
```

<hr class="sl">

## Normal distribution

```r
# fitdistr --
m <- mean(x)
sd <- sqrt((length(x) - 1) / length(x)) * sd(x)
first <- c(mean = m, sd = sd)
# --

r <- optim(
  fn = L_norm, par = first, x = x,
  method = 'L-BFGS-B'
)
```
