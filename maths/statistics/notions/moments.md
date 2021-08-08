# Moments

[Go back](../index.md#maths-recap)

As you should have seen in the probability course,

* $\mathbb{E}(X) = \mathbb{E}[X^1]$ is the first moment
* $V(X) = \mathbb{E}[X^2] - \mathbb{E}[X]^2$ is the second centered moment
<span class="tms">
(centered because it's the second moment minus the expected value)
</span>

<hr class="sl">

## 3rd and 4th moments

And we may also use now, the 3rd and the 4th moments

* Skewness (``coefficient d’asymétrie``): $\frac{E[(X-E[X])^3]}{\sigma^3}$ 

If Skewness' value is near $0$, then the distribution
is symmetric. If the value is $\gt 0$
then the distribution is inclined to the right
(resp. to the left).

* Kurtosis (``coefficient d’aplatissement``): $\frac{E[(X-\mu)^4]}{\sigma^4}$

If Skewness' value is small, then the distribution is
equilibrate. If the value is 3, then we have the normal
distribution.

<hr class="sr">

## Moments in R

In R, you may use on of these library

* ``e1071``
* ``moments``