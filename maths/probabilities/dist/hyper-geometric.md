# HyperGeometric distribution

[Go back](..)

The HyperGeometric distribution
$H(N, k, n)$ is taking

* $n$ number of trials/draws
* $K$ number of successes
* $N$ total number of elements
* without replacement

So we have

* The mass function is $\mathbb{P}(X=k) = {{{K \choose k}{{N-K} \choose {n-k}}} \over {N \choose n}}$
* $\mathbb{E}(X) = \ n * \frac{K}{N}$
* $\mathbb{V}(X) = \ \mathbb{E}(X) * (1 - \frac{K}{N}) * \frac{N-n}{N-1}$