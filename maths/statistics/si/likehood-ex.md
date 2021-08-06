# Likehood functions (examples)

[Go back](../index.md#estimators-and-likehood)

You can easily switch from Likehood function 
to log-likehood so I won't show the log-likehood implementations.

<hr class="sl">

## Bernoulli distribution

```r
L_bern <- function(theta, x) {
  return(prod(dbinom(x = x, size = 1, prob = theta[1])))
}
```

<hr class="sr">

## Binomial distribution

```r
L_binom <- function(theta, x) {
  # fitdistr --
  m <- mean(x)
  v <- var(x)
  size <- ifelse(v > m, m ^ 2 / (v - m), 100)
  # --
  
  return(prod(dbinom(x = x, size = size, prob = theta[1])))
}
```

<hr class="sl">

## Weibull distribution

```r
L_weibull <- function(theta, x) {
  return(prod(dweibull(shape = theta[1], scale = theta[2], x)))
}
```

<hr class="sr">

## Poisson distribution

```r
L_pois <- function(theta, x) {
  return(prod(dpois(lambda = theta[1], x)))
}
```

<hr class="sl">

## Normal distribution

```r
L_norm <- function (theta, x) {
  return(prod(dnorm(mean = theta[1], sd = theta[2], x)))
}
```