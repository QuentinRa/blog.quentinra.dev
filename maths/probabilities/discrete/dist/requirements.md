# Discrete distribution requirements

[Go back](../..)

Let X a random variable, the random distribution
of X must follow these requirements

* Sum of the probabilities is **1**
* probabilities are in $[0,1]$

**mass function**

We are calling mass function (`Fonction de masse`),
the function giving us the value for $\mathbb{P}(X=k)$
for a distribution.

**cumulative distribution function**

It's more used in continuous probabilities but
the
cumulative distribution function
$F_X(k)$ is the probability of $\mathbb{P}(X \le k)$.

<div class="mb-3">
\[
\mathbb{P}(X \le k) = \sum_{i=0}^{k} \mathbb{P}(X=i)
\]
for instance $P(X\le3) = P(X=0) + P(X=1) + P(X=2) + P(X=3)$
</div>