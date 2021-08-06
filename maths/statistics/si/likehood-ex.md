# Likehood functions (examples)

[Go back](../index.md#estimators-and-likehood)

You can easily switch from Likehood function 
to log-likehood so I won't show the log-likehood implementations.

<hr class="sl">

## Bernoulli

```r
L_bern <- function(theta, x) {
  return(prod(dbinom(x = x, size = 1, prob = theta[1])))
}
```

<hr class="sr">

## Binomial

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