# Moment-generating function (MGF)

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
\int \exp(tx)\ f_X(x)\ dx
\]
</div>

<hr class="sr">

## Usage

Let $M_X(t)$ a moment-generating function, then

<div>
\[
\mathbb{E}(X) = \frac{\delta M_X (t)}{\delta t}
= M'_X(0)
\]
\[
V(X) = \frac{\delta^2 M_X (t)}{\delta t^2}
= M''_X(0)
\]
</div>