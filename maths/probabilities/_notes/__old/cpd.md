# Conditional probability distribution

[Go back](..)

In French it's called ``Loi de probabilité conditionnelle``,
``distribution conditionnelle`` or `Loi conditionnelle`.

<hr class="sl">

## Conditional discrete distributions

The probability of $X=x_i$ given $Y=y_j$
is

@
\mathbb{P}(X = x_i\ |\ Y=y_j) = 
\frac{
\mathbb{P}(X = x_i \cap Y=y_j)
}{
\mathbb{P}(Y=y_j)
}
@

* the conditional expected value is

<div>
\[
\mathbb{E}(X\ |\ Y=y_j)= \sum_{i=1}^{n} x_i * \mathbb{P}(X = x_i\ |\ Y = y_j)
\]
</div>

* the conditional variance is

<div>
\[
V(X|Y=y_j)= \sum_{i=1}^{n} (x_i-\mathbb{E}(X))^2 * \mathbb{P}(X = x_i\ |\ Y = y_j)
\]
</div>

<hr class="sr">

## Conditional continuous distributions

The probability of $X=x_i$ given $Y=y_j$,
with $f_{X|Y}(x_i\ |\ y_j)$ the joint density and
$f_{Y}(y_j)$ the marginal density, is

@ 
f_{X|Y}(x_i\ |\ y_j) =
\frac{
f_{X|Y}(x_i\ |\ y_j)
}{
f_{Y}(y_j)
}
@

* the conditional expected value is

<div>
\[
\mathbb{E}(X\ |\ Y=y_j)= 
\int x * f_{X|Y} (x|y) dx
\]
</div>

* the conditional variance is

<div>
\[
V(X|Y=y_j)= \int (x-\mathbb{E}(X))^2 * f_{X|Y} (x,y) dx
\]
</div>