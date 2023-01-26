# Expected value

[Go back](..)

The expected value / `Espérance` noted $\mathbb{E}(X)$, $\mathbb{E}X$, or $\mathbb{E}[X]$ is defined by

<div>
\[
\sum_{x_i \in \Omega}^{} x_i \mathbb{P}{(X_w = x_i )}
\]
</div>

**Note**: it's the sum of each value by its probability.

Notes

* $\mathbb{E}(X)$ is also called the **(weighted) mean** (`moyenne (pondérée)`)
* $\mathbb{E}(X)$ is also called [the first moment](https://en.wikipedia.org/wiki/Moment_(mathematics)#Mean)  (`moment d'ordre 1`)

<hr class="sl">

**Properties**

* Linear: $\mathbb{E}[X, \lambda Y] = \mathbb{E}[Y] + \lambda \mathbb{E}[Y]$
* Positive: $\mathbb{E}(X) \ge 0$ <small>(if X is a positive v.a.d.)</small>
* Increasing: $X \ge Y$, $\mathbb{E}(X) \ge \mathbb{E}(Y)$
* If X,Y independent: $\mathbb{E}[X * Y] = \mathbb{E}[X] * \mathbb{E}[Y]$
* else: $\mathbb{E}[X * Y] = \sum_{i,j} x_i * y_i * p_{ij}$
* $\mathbb{E}[c] = c$

Note that $[X,Y]$ means $X$ **and** $Y$.

If we got an uniform probability, then $\mathbb{E}(X) = \frac{n+1}{2}$.

<hr class="sr">

**Chebyshev's inequality**

@
\mathbb{P}( |X| \ge a) \le \frac{\mathbb{E}[X^2]}{a^2}
@

<hr class="sl">

**Jensen**

$X$ integrable and $\varphi(x)$ converge

@
\mathbb{E}[\varphi(X)] > \varphi (\mathbb{E}[X])
@

Sometimes, you may see $\mathbb{E}[g(X)] = g(\mathbb{E}[X])$.

<hr class="sr">

**Cauchy-Schwarz**

@
\mathbb{E}[XY]^2 \le \mathbb{E}[X^2] * \mathbb{E}[Y^2]
@

<hr class="sl">

**Markov**

@
\mathbb{P}( |X| \ge a) \le \frac{\mathbb{E}[ |X| ]}{a}
@