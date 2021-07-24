# Discrete distribution requirements

[Go back](../..)

Let X a random variable, the random distribution
of X must follow these requirements

* Sum of the probabilities is **1**
* probabilities are in $[0,1]$

And we could also add

<div class="mb-3">
\[
\mathbb{P}(X \lt k) = \sum_{i=0}^{k-1} \mathbb{P}(X=i)
\]
for instance $P(X\le3) = P(X=0) + P(X=1) + P(X=2)$
</div>

We are calling **mass function** (`Fonction de masse`),
the function giving us the value for $\mathbb{P}(X=k)$
for a distribution.