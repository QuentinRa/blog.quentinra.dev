# Continuous uniform distribution

[Go back](..)

A distribution, on an interval $[a,b]$, in which each value has the same probability, is a uniform distribution $U([a,b])$.

* The density function is $f_X(x) = \frac{1}{b-a}$
* $\mathbb{E}(X) = \ \frac{a+b}{2}$
* $\mathbb{V}(X) = \ \frac{(b-a)^2}{12}$

<hr class="sr">

## Standard uniform distribution

We are calling standard uniform distribution/`loi uniforme standard` a uniform distribution where 

* $a=0$
* $b=1$

For more information, here is the [wiki](https://en.wikipedia.org/wiki/Continuous_uniform_distribution#Standard_uniform).

Let $F_Y(y)$ be the cumulative distribution function of the continuous random variable Y. Then $X = F_Y(y)$ can follow a standard uniform distribution

@
X = F_Y(Y) \sim U([0,1])
@

Using the [Probability integral transform (PIP)](https://en.wikipedia.org/wiki/Probability_integral_transform).