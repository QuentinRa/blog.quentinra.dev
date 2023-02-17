# Maximum Likelihood estimation (examples)

[Go back](../index.md#estimators-and-likelihood)

You may replace any usage of the Likelihood function with the Log-Likelihood function.

Also, if you are a student at the ENSIIE engineering school, do not use ``fitdistr`` values as the first parameter and use the values you used to generate the distribution.

<hr class="sr">

## How to read that?

If you are wondering if the code is working, for Bernoulli for instance, generate a sample

```r
# n must be at great like 100/something not small
x <- rbinom(n = 100, size = 1, proba = 0.5)
# add the L_bern function (previous page)
# ...
# add the MLE code (this page)
# ...
# run
# check the r$par value
r$par
# this value should be close to the values
# you used to generate the distribution
# here par should converge to proba=0.5
```

Sometimes, you may have an error/warning according to the parameters of your distribution. Try again! The way to fix these errors would be to play will the parameters, but I do not know much, and you should use **R** function instead of writing yours.

<hr class="sl">

## Bernoulli distribution

```r
first <- sum(x) / length(x)

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

<hr class="sr">

## Cauchy distribution

```r
# fitdistr --
first <- c(location = median(x), scale = IQR(x) / 2)
# --

r <- optim(
  fn = L_cauchy, par = first, x = x,
  method = 'L-BFGS-B'
)
```

<hr class="sr">

## Gamma distribution

```r
# fitdistr --
m <- mean(x)
v <- var(x)
first <- list(shape = m ^ 2 / v, rate = m / v)
# --

r <- optim(
  fn = L_gamma, par = first, x = x,
  method = 'L-BFGS-B'
)
```

<hr class="sr">

## Poison distribution

Do you remember that $\mathbb{E} = \lambda$? Then you do not need to optimize,

```r
# the mean will converge to lambda,
# the more you increase n
mean(x)
```

but well, up to you

```r
first <- mean(x)
r <- optim(
  fn = L_pois, par = first, x = x,
  method = "L-BFGS-B",
  # I picked the bounds myself :)
  lower = 0, upper = 1.96 * first
)
```

<hr class="sr">

## Exponential distribution

Do you remember that $\mathbb{E} = \frac{1}{\lambda}$? Then you do not need to optimize,

```r
# the mean will converge to lambda,
# the more you increase n
1 / mean(x)
```

but well, up to you

```r
first <- 1 / mean(x)

r <- optim(
  fn = L_pois, par = first, x = x,
  method = "L-BFGS-B",
  # I picked the bounds myself :)
  lower = 0, upper = 1.96 * first
)
```