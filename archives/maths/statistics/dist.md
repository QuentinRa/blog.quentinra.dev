# Distributions in R

[Go back](index.md#analysis-of-a-sample)

This is a summary of the functions used to generate distributions in R. The functions are starting with r/p/q/d followed by the name of the distribution in R.

The values for [dist] will be given in the next section.

* `r[dist]`: generate a distribution
* `p[dist]`: $P(X \le k)$
* `q[dist]`: quantile function (Inverse cumulative distribution function)
* `d[dist]`: density function or mass function ($P(X=k)$)

<hr class="sl">

## Well-known distributions

The values for [dist] that we will use a lot are

* Bernoulli ($B(p0.5)$): ``rbinom(n=10,size=1,prob=0.5)`` (size is always 1 otherwise it's a binomial distribution)
* Binomial ($B(n=5,p=0.5)$): ``rbinom(n=10,size=5,prob=0.5)``
* Cauchy: ``rcauchy(n=10,location=0,scale=1)``
* chi-square (`Khi-deux`): `rchisq(n = 10, df = 2)`
* exponential: ``rexp(n=10, rate = 1)``
* Gamma: ``rgamma(n = 10, shape = 5, rate = 1)``
* Geometric $G(p)$: ``rgeom(n = 10, prob = 0.7)``
* HyperGeometric: ``rhyper(nn = 10, m = 10, n = 5, k = 10)``
* Normal: ``rnorm(n = 10, mean = 0, sigma = 1)``
* Poisson: `rpois(n = 10, lambda = 0.05)`
* Weibull: `rweibull(n = 10, shape = 2, scale = 2)`

<hr class="sr">

## Notes

**NOTE**: specifying the names of the parameters IS NOT MANDATORY like ``rbinom(10, 1, 0.5)`` is working. This is up to you.

**NOTE (2)**: The call ``rbinom(n=10,size=1,prob=0.5)`` could be described as

* generating a vector of size $n=10$
* in which, each value is the result of a Bernoulli distribution $B(0.5)$

For instance, the call above would give

```r
# not random, we pick a seed
# so anyone running the code will have the same sample
set.seed(0)
# generating
s <- rbinom(n=10,size=1,prob=0.5)
s # <=> print(s)
# [1] 1 0 0 1 1 0 1 1 1 1
```

In the resulting vector, we can read that in the first experience, we got one success. In the second, we had a failure, etc. Bernoulli's distribution is like flipping a coin if p=0.5, and if $p \neq 0.5$ then the coin is a rigged coin.