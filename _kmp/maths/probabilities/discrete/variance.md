# Variance 

[Go back](..)

The variance is the square deviation around the expected value.

<div>
\[
\begin{align}\begin{aligned}V(X) = \mathbb{E}[(X - \mathbb{E}[X])^2]\\V(X) = \mathbb{E}[X^2] - \mathbb{E}[X]^2\end{aligned}\end{align}
\]
</div>

We got the second formula with [Huygens theorem](https://fr.wikipedia.org/wiki/Th%C3%A9or%C3%A8me_de_K%C3%B6nig-Huygens).

<hr class="sl">

**Properties**

* $V(X) = \sigma^2$ with sigma the standard deviation/`écart-type`
* $V(\lambda X^2) = \lambda^2 V(X)$
* $V(c) = 0$ <small>(or if $V(X)=0$ then X is a constant)</small>
* $V(a + \lambda X^2) = \lambda^2 V(X)$
* $V(X + Y) = V(X) + V(Y) - 2cov(XY)$
* $V(X)$ is also called [the second central moment](https://en.wikipedia.org/wiki/Moment_(mathematics)#Variance)
  (`moment (centré) de second ordre`)

<hr class="sr">

**Chebyshev's inequality**

@
\mathbb{P}(|X - \mathbb{E}[X]| \ge a) \le \frac{V[X]}{a^2}
@

<hr class="sl">

## Covariance/co-variance (cov)

It's used to evaluate the conjoint variance of two
random variables.

<div>
\[
\begin{align}\begin{aligned}cov(x,y) = \mathbb{E}[ ( X - \mathbb{E}[X]) (Y - \mathbb{E}[Y]) ]\\cov(x,y) = \mathbb{E}[XY] - \mathbb{E}[X] \mathbb{E}[Y]\end{aligned}\end{align}
\]
</div>

**Properties**

* $cov(X,X) = V(X)$
* $cov(X,Y) = cov(Y,X)$
* $cov(\lambda * X,Y) =  \lambda *cov(Y,X)$
* $cov(\lambda * X) =  \lambda^2 *cov(X)$
* $cov(A+B,C) = cov(A,C) + cov(B,C)$
* if $X \perp Y$ then $cov(XY) = 0$
* $\mathbb{P}(X, Y) = \frac{cov(X,Y)}{\sqrt{V(X)*V(Y)}}$