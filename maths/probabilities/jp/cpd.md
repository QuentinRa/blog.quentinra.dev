# Conditional probability distribution

[Go back](..)

In French it's called ``Loi de probabilité conditionnelle``,
``distribution conditionnelle`` or `Loi conditionnelle`.

<hr class="sl">

## Conditional discrete distributions

The probability of $X=x_i$ given $Y=y_j$
is

@
\mathbb{P}(Y = y_j\ |\ X=x_i) = 
\frac{
\mathbb{P}(X = x_i \cap Y=y_j)
}{
\mathbb{P}(X=x_i)
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

* **Conditional continuous distributions**

...