# Log-Likelihood function

[Go back](../index.md#estimators-and-likelihood)

Sometimes, the log-likelihood function is hard to use (mainly when you are not using a computer with the functions already coded for you). The log-likelihood function is something really (yeah, really) easier to use. Everything is working the same, aside from the fact that you are using another function.

Another reason for using the log-likelihood function is that, on average, the result is better than using any other likelihood function.

The log-likelihood function is defined as the **sum of the log densities functions**.

@
LL(x, \hat{\theta}) = \sum log(f_{\hat{\theta}}(x))
@

<hr class="sl">

## In practice

You will replace ``prod`` with `sum` and add `log = TRUE` in the density function. You will also need to add a minus before the return. Aside from that, you don't have anything else to change.

```r
# we are chaning the L_bern function
L_bern <- function(theta, x) {
  return(-sum(dbinom(x = x, size = 1, prob = theta[1], log = TRUE)))
}

# this code does not change, working for both
# generating a sample
x <- rbinom(250, 1, prob = 0.8)
# maximum likelihood estimation
first <- sum(x) / length(x)
r <- optim(
  fn = L_bern, par = first, x = x,
  method = 'L-BFGS-B', lower = 0.0, upper = 1.0
)
# print result
r$par
```

Note: sometimes you may have to replace `'L-BFGS-B'` with ``'Brent'``. This is because sometimes the formula for ``par`` gives you an invalid value (test with par=0), and Brent seems to be more flexible.

<hr class="sr">

## In theory

Let's say you got this table with the probabilities, and the values in our sample.

<table class="table table-bordered table-striped">
<tr>
<th>$k$</th>
<th>$0$</th>
<th>$1$</th>
<th>$2$</th>
<th>$3$</th>
</tr>
<tr>
<td>$\mathbb{P}(X=k)$</td>
<td>$\frac{2*\theta}{3}$</td>
<td>$\frac{\theta}{3}$</td>
<td>$\frac{2*(1-\theta)}{3}$</td>
<td>$\frac{(1-\theta)}{3}$</td>
</tr>
<tr>
<td>Observed (n=10)</td>
<td>$2$</td>
<td>$3$</td>
<td>$3$</td>
<td>$2$</td>
</tr>
</table>

We are looking for the maximum likelihood estimation. We are calculating the likelihood function (product of the densities).

<div>
\[
L(x, \theta)
= \mathbb{P}(X=0)^2 * \mathbb{P}(X=1)^3 *
\mathbb{P}(X=2)^3 * \mathbb{P}(X=3)^2
= \frac{2^5*\theta^5*(1-t)^5}{3^{10}}
\]
</div>

Since the likelihood function is a bit too complex, we are using the log-likelihood function.

<div>
\[
LL(x, \theta)
= \ln(L(x, \theta))
= c + 5\ln (\theta) + 5\ln(1-\theta)
\]
</div>

Then we are deriving $LL(x, \theta)$ instead of $L(x, \theta)$ and that's much easier

<div>
\[
LL(x, \theta)'
= \frac{5}{\theta} + \frac{5}{1 - \theta}
\Leftrightarrow
\frac{5}{\theta} = \frac{5}{1 - \theta}
=
\frac{1}{\theta} = \frac{1}{1 - \theta}
=^\text{cross product}
\theta = 1 - \theta
\Leftrightarrow
\theta = \frac{1}{2}
\]
</div>

So we have $\hat{\theta}=\frac{1}{2}$.