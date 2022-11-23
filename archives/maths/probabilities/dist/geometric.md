# Geometric distribution

[Go back](..)

The geometric distribution $\mathbb{G}(p)$ is determining the probability of the first success given a probability $p$. This is answering the question "If I have a probability of success $p$, what's the probability of the trial $k$ being the first success?".

* The mass function is $\mathbb{P}(X=k) = (1-p)^{k-1} * p$
* $\mathbb{E}(X) = \ \frac{1}{p}$
* $\mathbb{V}(X) = \ \frac{1-p}{p^2}$

> If you didn't understand the distribution function, that was quite easy. If the trial $k$ is the first success, that means that the $k-1$ first trials were failure while the trial $k$ is a success.
> 
> * $(1-p)^{k-1}$: $k-1$ failures
> * $p$: the success