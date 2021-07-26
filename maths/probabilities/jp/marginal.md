# Marginal Distribution

[Go back](..#joint-probability)

<hr class="sl">

## Discrete Marginal Distribution

The marginal distribution, `loi marginale`,
or Marginal probability mass function of X and Y are

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

The marginal distribution, `loi marginale`,
or Marginal probability density function of X and Y are

@
f_X(x) = \int_{-\infty}^{+\infty} f_{X,Y}(x, y)\ dy
@

@
f_Y(y) = \int_{-\infty}^{+\infty} f_{X,Y}(x, y)\ dx
@