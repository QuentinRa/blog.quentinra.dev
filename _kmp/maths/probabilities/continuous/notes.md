# Other notes

[Go back](..)

These are notes about the `Théorème de transfert` and the `Fonction muette`, that are used in France.

<hr class="sr">

## Théorème de transfert/transport

This theorem is taking a variable to create a new one.

For a discrete variable, we will have

@
\mathbb{E}(g(X)) = \sum_{i} g(x_i) \mathbb{P}(X = x_i)
@

For continuous variables, we will have

@
\mathbb{E}[g(X)] = \int_{-\infty}^{+\infty} g(x) * f_X(x)\ dx
@

<hr class="sr">

## Fonction muette

If we know the density function of X then we can find $Y=g(X)$. Let $\varphi(x)$ be a function "muette", then starting from

@
\mathbb{E}[\varphi(X)] = \int_{X(\Omega)} \varphi(g(x)) * f_X(x)\ dx
@

you should be able to have

@
\mathbb{E}[\varphi(Y)] = \int_{Y(\Omega)} \varphi(y) * h_Y(y)\ dy
@

with $h_Y(x)$ the density of $Y$. Note that you can do integration by substitution with $y = g(x)$ (=`Changement de variable`).