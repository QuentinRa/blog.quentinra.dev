# Independence

[Go back](..)

Random variables are said to be independent ($\perp$ perp) if the product of the probabilities is equals to the probability of the events  $X_1, ..., X_n$.

<div>
\[
\mathbb{P}(X_1 = x_1,\ \ldots,\ X_n = x_n) = \prod_{i=1}^n \mathbb{P}(X_i = x_i)
\]
</div>

Remember that the `,` is read as `and`, so you could also write

<div>
\[
\mathbb{P}(X_1 = x_1\ \cap\ \ldots\ \cap\ X_n = x_n) = \prod_{i=1}^n \mathbb{P}(X_i = x_i)
\]
</div>

Another way is if we have (the previous one is induced from this one)

* if $\mathbb{P}(A|B) = \mathbb{P}(A)$
* or $\mathbb{P}(B|A) = \mathbb{P}(B)$