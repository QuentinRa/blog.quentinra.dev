# Variance 

[Go back](..)

The variance is the square deviation around the
expected value.

<div>
\[
\begin{align}\begin{aligned}V(X) = \mathbb{E}[(X - \mathbb{E}[X])^2]\\V(X) = \mathbb{E}[X^2] - \mathbb{E}[X]^2\end{aligned}\end{align}
\]
</div>

**Properties**

* $V(a + \lambda X^2) = \lambda^2 V(X)$
* $V(X + Y) = V(X) + V(Y) - 2cov(XY)$

<hr class="sr">

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