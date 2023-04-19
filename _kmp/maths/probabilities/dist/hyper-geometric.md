# HyperGeometric distribution

[Go back](..)

The HyperGeometric distribution $H(N, K, n)$ is representing the probability of having a number of successes $K$ in a finite set of size $N$, given that we made $n$ trials without replacement.

* $n$ is the number of trials/draws
* $K$ is the number of successes
* $N$ is the total number of elements
* without replacement

So we have

* The mass function is $\mathbb{P}(X=k) = {{{K \choose k}{{N-K} \choose {n-k}}} \over {N \choose n}}$
* $\mathbb{E}(X) = \ n * \frac{K}{N}$
* $\mathbb{V}(X) = \ \mathbb{E}(X) * (1 - \frac{K}{N}) * \frac{N-n}{N-1}$