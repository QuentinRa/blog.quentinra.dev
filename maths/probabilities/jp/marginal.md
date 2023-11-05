# Marginal Distribution

[Go back](..#joint-probability)

This page is about the discrete marginal distribution and the continuous marginal distribution. $a$

<hr class="sl">

## Discrete Marginal Distribution

The marginal distribution, `loi marginale`, or the marginal probability mass function of X and Y is

@
\mathbb{P}(X=x) =
\sum_{y_i \in Y(\Omega)}
\mathbb{P}(X=x \cap Y=y_i)
@

@
\mathbb{P}(Y=y) =
\sum_{x_i \in X(\Omega)}
\mathbb{P}(X=x_i \cap Y=y)
@

<hr class="sr">

## Continuous Marginal Distribution

The marginal distribution, `loi marginale`, or the marginal probability density function of X and Y is

@
f_X(x) = \int_{-\infty}^{+\infty} f_{X,Y}(x, y)\ dy
@

@
f_Y(y) = \int_{-\infty}^{+\infty} f_{X,Y}(x, y)\ dx
@