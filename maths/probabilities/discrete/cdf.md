# Cumulative distribution function (CDF)

[Go back](../..)

The cumulative distribution function (CDF) $F_X(k)$ is the primitive of the mass function, meaning that deriving the CDF will give you the mass function. $F_X(k)$ is the probability of $\mathbb{P}(X \le k)$.

<div class="mb-3">
\[
\mathbb{P}(X \le k) = \sum_{i=0}^{k} \mathbb{P}(X=i)
\]
</div>

For instance $P(X\le3) = P(X=0) + P(X=1) + P(X=2) + P(X=3)$ (this is not always the case, as the issues lesser or equals to 3 may not be 0, 1, 2, and 3, but you got the idea).

**Note**: It's more used in continuous probabilities, so I won't add a lot of information here (you may come back later).