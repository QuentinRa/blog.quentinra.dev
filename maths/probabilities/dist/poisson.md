# Poisson distribution

[Go back](..)

It's called the ``loi des événements/phénomènes rares`` in French.
The requirements are that the probability $p$
is really small and $n$ is high, relatively to $p$.

* We usually write $\lambda \sim \mathbb{P}(\lambda)$
* with $\lambda = n*p$
* The distribution function is $\mathbb{P}(X=k) = \frac{\lambda^k *  e^{-\lambda}}{k!}$
* $E(X) = \lambda$
* $V(X) = \lambda$

<hr class="sr">

## Demonstration

You need to understand this (you may skip it
for now) because you are gonna 
do something like this a lot and it's easy

**Demonstration of $E[X]=\lambda$**

With the expected value formula, we have

* $\sum_{k \in \mathbb{N}} k * P(X=k)$
* $= \sum_{k \in \mathbb{N}} k *  \frac{\lambda^k *  e^{-\lambda}}{k!}$
* $e$ is a constant so we can extract it
* $= e^{-\lambda} * \sum_{k \in \mathbb{N}}  \frac{\lambda^k}{(k-1)!}$
* I'm taking one $\lambda$ out (it's a constant too)
* $= \lambda e^{-\lambda} * \sum_{k \in \mathbb{N}} \frac{\lambda^{k-1}}{(k-1)!}$

Here we are starting the magic. There are well-known
sums that can be replaced by a function.

Check them [here](https://en.wikipedia.org/wiki/List_of_mathematical_series)
but this is the only one that we will use:
$\sum_{k \in \mathbb{N}} \frac{\lambda^{k}}{k!} = e^k$

* so using the exponential series development
* $= \lambda e^{-\lambda} * e^{\lambda}$
* $= \lambda e^{-\lambda+\lambda}$
* $= \lambda e^{0}$
* $= \lambda * 1$
* $= \lambda$

Remember the magic trick, it's useful.