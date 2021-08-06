# fitdistr

According to fitdistr source code, a function in R,
I was able to learn more about estimators. I don't know
where this comes from but I think professional are
more knowledgeable. You can find the source code
[here](https://github.com/cran/MASS/blob/master/R/fitdistr.R).

**NOTE**: as you are smart, you can easily switch
from Likehood function to log-likehood so I won't
log-likehood implementations.

<hr class="sl">

## Bernoulli

```r
L_bern <- function(theta, x) {
  return(
    prod(
      dbinom(x = x, size = 1, prob = theta[1])
    )
  )
}
```

<hr class="sr">

## Binomial

```r
L_binom <- function(theta, x) {
  m <- mean(x)
  v <- var(x)
  size <- if (v > m) m ^ 2 / (v - m) else 100

  return(
    prod(
      dbinom(x = x, size = size, prob = theta[1])
    )
  )
}
```