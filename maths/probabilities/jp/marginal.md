## Marginal probability mass function

[Go back](..)

We are calling marginal distribution for discrete
probabilities for X is

@
\mathbb{P}(X=x_i) = 
\sum_{y_j \in \Delta_Y}
\mathbb{P}(X=x_i \cap Y=y_j)
@

and Y it is

@
\mathbb{P}(Y=y_j) =
\sum_{x_i \in \Delta_X}
\mathbb{P}(X=x_i \cap Y=y_j)
@

We could describe $\mathbb{P}(X=x_i)$ as the
joint probability of $X=x_i$ and all the outcomes
of Y.

<hr class="sr">

## Marginal probability density function

If we are dealing with continuous random variables,
then the formula is different

<div>
\[
\mathbb{P}((a \le X \le b) \cap (c \le Y \le d))
= \int_{a}^{b} \int_{c}^{d} f_{XY}(x, y)\ dx\ dy
\]
</div>