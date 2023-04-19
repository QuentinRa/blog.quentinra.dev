# Convergence in probability

[Go back](..#convergence)

In French, it's `Convergence en probabilité`. The sequence $X_n$ converges in probability if

@
\mathbb{P}(\lim_{n \to+ \infty} |X_n-x| \gt \epsilon) = 0
@

It's that's the case, then $x$ is a constant $c$ and the notation is

@
X_n \xrightarrow{p} c
@

It's almost the same as "almost surely", $X^n$ values when $n \to+ \infty$ are around c, like $[c-\epsilon,\ c+\epsilon]$.

* $\lim_{n \to+ \infty} \mathbb{E}(X_n) = c$
* $\lim_{n \to+ \infty} \mathbb{V}(X_n) = 0$