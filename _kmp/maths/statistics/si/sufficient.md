# Sufficient statistic

[Go back](../index.md#estimators-and-likelihood)

A statistic is sufficient (`exhaustive`) means that we can make a function $T$ that is not dependent on $\theta$. If we can write $f$ as

@
f(x, \theta) = g(T(x), \theta) * h(x)
@

then $T$ is a sufficient statistic. Remember that $x$ is the vector of our distribution's values. In a lot of cases, we have

@
\mathbb{E}_\theta[T(x)] = \theta
@

$T$ is not unique. If we have

@
\forall{T}\quad S = H(T)
@

Then $S$ is a **minimal sufficient statistic** (``statistique exhaustive minimale``).