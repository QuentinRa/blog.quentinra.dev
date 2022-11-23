# Conditional Distribution

[Go back](..#joint-probability)

In French it's called `Loi de probabilité conditionnelle`, `distribution conditionnelle` or `Loi conditionnelle`. This is the probability of a variable taking a value, given that another variable took a value.

<hr class="sl">

## Discrete Conditional Distribution

The probability of $X=x$ given $Y=y$
is

@
\mathbb{P}(X = x\ |\ Y=y) =
\frac{
\mathbb{P}(X = x \cap Y=y)
}{
\mathbb{P}(Y=y)
}
@

We can add

<div>
\[
\mathbb{E}(X\ |\ Y=y)= \sum_{i=1}^{n} x_i * \mathbb{P}(X = x_i\ |\ Y = y)
\]
</div>
<div>
\[
V(X|Y=y)= \sum_{i=1}^{n} (x_i-\mathbb{E}(X))^2 * \mathbb{P}(X = x_i\ |\ Y = y)
\]
</div>

<hr class="sr">

## Continuous Conditional Distribution

The formula changes a bit for continuous variables

@
f_{X|Y}(x\ |\ y) =
\frac{
f_{X|Y}(x,\ y)
}{
f_{Y}(y)
}
@

We can add

<div>
\[
\mathbb{E}(X\ |\ Y=y)= 
\int x * f_{X|Y} (x|y) dx
\]
</div>
<div>
\[
V(X\ |\ Y=y)= \int (x-\mathbb{E}(X))^2 * f_{X|Y} (x,y) dx
\]
</div>