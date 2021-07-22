# Expected value

[Go back](..)

The expected value / ``Espérance`` noted
$\mathbb{E}(X)$, $\mathbb{E}X$, or $\mathbb{E}[X]$
is defined by

<div>
\[
\sum_{x_i \in \Omega}^{} x_i \mathbb{P}{(X_w = x_i )}
\]
</div>

**Note**: it's the sum for
each value the probability of a value by the value.

<hr class="sl">

**Properties**

* Linear: $\mathbb{E}[X, \lambda Y] = \mathbb{E}[Y] + \lambda \mathbb{E}[Y]$
* Positive: $\mathbb{E}(X) \ge 0$ <span class="tms">(if X is a positive v.a.d.)</span>
* Increasing: $X \ge Y$, $\mathbb{E}(X) \ge \mathbb{E}(Y)$
* If X,Y independent: $\mathbb{E}[X * Y] = \mathbb{E}[X] * \mathbb{E}[Y]$

Note that $[X,Y]$ means $X$ **and** $Y$.

<hr class="sr">

**Chebyshev's inequality**

@
\mathbb{P}( |x| \ge a) \le \frac{\mathbb{E}[X^2]}{a^2}
@

<hr class="sl">

**Jensen**

$X$ integrable and $\varphi(x)$ converge

@
\mathbb{E}[\varphi(x)] > \varphi (\mathbb{E}[X])
@

<hr class="sr">

**Cauchy-Schwarz**

@
\mathbb{E}[XY]^2 \le \mathbb{E}[X^2] * \mathbb{E}[Y^2]
@

<hr class="sl">

**Markov**

@
\mathbb{P}( |x| \ge a) \le \frac{\mathbb{E}[ |X| ]}{a}
@