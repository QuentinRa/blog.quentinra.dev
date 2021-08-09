# Determining W - example

[Go back](../index.md#tests)

Let's say we generated a sample, following
a Normal distribution $N(\mu, 1)$.

```r
# ### ### #
# NOTE
# You are not supposed to known that mean=1.2
# ### ### #
x <- rnorm(n = 100, mean = 1.2,  sd = 1)
```

<hr class="sl">

## Hypothesis

We are making the left-tailed test under the
two hypothesis

* $H_0: \mu = 1.2$
* $H_1: \mu \lt 1.0$

And $\alpha=0.05$.

<hr class="sl">

## Determining W

We are picking $T(x)=mean(x)$ as the test statistic.
We know from the probabilities course that
for a normal distribution we have

@
\alpha = \mathbb{P}(X \le c) = F_X^{-1}(\alpha)
@
@
F_X^{-1}(\alpha) = \mu + \frac{\sigma}{\sqrt{n}} * \phi^{-1}(\alpha)
@
@
\phi^{-1}(0.05) = -\phi(1-0.05) = -\phi(0.95) = -1.645
@

We are replacing with $\mu=1.2$ ($H_0$) and $\sigma=1$ (given at the start).

@
c = 1.2 + \frac{1}{\sqrt{100}} * -1.645 = 1.0355
@

<hr class="sl">

## Result

We got $W = \\{x; T(x) \lt 1.0355\\}$. It means that
$W$ is defined as every mean below $1.0355$, since
$T(x)$ is the mean here. If the mean ($T(X)$) is within
$W$ then at a significance level of $\alpha=0.05$,
we are rejecting $H_0$.

```r
mean(x)
[1] 1.046398
```

For **MY SAMPLE** $x$, the mean is not within $W$
so **we do not reject** $H_0$ (remember: we do not write
we "accept"). Here some code that will
give the same result for everyone

```r
# reproductible
set.seed(0)
x <- rnorm(100, 1.2, 1)
mean(x)
# 1.222668
```