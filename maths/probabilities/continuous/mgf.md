# Moment-generating function

[Go back](..)

The Moment-generating function
or ``Fonction génératrice des moments`` is a function
allowing us to find the moments (the expected value $\mathbb(X)$,
the variance $V(X)$) when we are not able to.

That's the case when

<div>
\[
\mathbb{E}(|X^k|) = \int |x^k| d F_x(x) = +\infty
\]
</div>

We are defining the moment-generating function by

<div>
\[
M_X(t) = \mathbb{E}(\exp(tX)) =
\int \exp(tx) dF_X(x)
\]
</div>