# Joint probability distribution

Let X, Y be two random variables. The Joint probability $(X,Y) \in X(\Omega) * Y(\Omega)$ (cartesian product) is defined, for discrete variables, by

@
\mathbb{P}(X = x \cap Y = y)
\Leftrightarrow
\mathbb{P}(X = x,\ Y = y)
\Leftrightarrow
\mathbb{P}(x, y)
@

and for continuous variables, by

@
\mathbb{P}((a \le X \le b) \cap (c \le Y \le d))
= \int_{a}^{b} \int_{c}^{d} f_{X,Y}(x, y)\ dx\ dy
@

This notion can be extended to n variables. In French, we are calling 2 variables a `couple` of random variables, while we are calling n variables a vector/`vecteur` of random variables.

The name Bi-variate distribution is used for the joint distribution of two variables. The opposite would be Multi-variate distribution.

* [Bi-variate distribution tip](jp/bi-variate.md) (if the cardinals are small)
* [Marginal Distribution](jp/marginal.md)
* [Moments, Independence, ...](jp/props.md)
* [Conditional Distribution](jp/conditional.md)

<hr class="sl">

## Distributions

And here is a summary of all [distributions](dist/summary.md).