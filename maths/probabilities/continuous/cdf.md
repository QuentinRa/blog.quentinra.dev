# Cumulative distribution function

[Go back](..)

The Cumulative distribution function/Repartition function or `fonction de répartition` $F_X(k)$ is the probability of $\mathbb{P}(X \le k)$.

The density function is the derivative of the cumulative distribution function. The cumulative distribution function is the primitive of the density function.

Note that the cumulative distribution function isn't limited to the support of $\Omega$ for instance

* $\Omega$ = {1,2,3,4,5,6} for a dice
* but $F_X(7) = \mathbb{P}(X \le 7)$ is valid (=1=100%)

**Properties**

* $\mathbb{P}(X = k) := 0$
* $\mathbb{P}(X \le k) := \mathbb{P}(X < k)$
* $0 \le F_X(x) \le 1$
* F is increasing and continue
* $\lim_{x \rightarrow +\infty}F(x) = 1$
* $\lim_{x \rightarrow -\infty}F(x) = 0$
* Let $A_n$ be a monotone sequence, $\mathbb{P}(\lim_{n \rightarrow +\infty} A_n) = \lim_{n \rightarrow +\infty} A_n * \mathbb{P}(A_n)$
* $\mathbb{P}(a \le X \le b) = F_X(b) - F_X(a) = \int_{a}^{b} f_X(x)dx$

<hr class="sl">

## Inverse cumulative distribution function

The Inverse cumulative distribution function or Quantile function or `fonction de répartition inverse` is the name given when we are trying to find a $k$ given the wanted result of the function $\alpha$.

@
\alpha = \mathbb{P}(X \le k) 
@

It's written $F_X^{-1}(\alpha)$ or $Q_\alpha$.

<hr class="sl">

## Y from X

Using the change of variables $Y=aX+b$, we can $F_Y(x)$ from $F_X(x)$.

@
F_Y(y) = F_X(\frac{y-b}{a})
@

With an increasing monotone function, you can do $Y = \varphi(X)$ like $Y = \exp(X)$ and $\varphi^{-1}(y) = ln(y)$

@
F_Y(y) = F_X(\varphi^{-1}(y))
@