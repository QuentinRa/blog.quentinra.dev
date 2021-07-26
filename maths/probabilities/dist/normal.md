# Normal distribution

[Go back](..#distributions)

The distribution is the most important one, also called

* Normal distribution/``Loi normale``
* Gaussian distribution/``Loi gaussienne``
* Laplace–Gauss distribution/``Loi de Laplace-Gauss``

And the short name is $N(\mu, \sigma)$ or
$N(\mu, \sigma^2)$.

* $\mu$ (mu) is the mean ($\mathbb{E}(X)$)
* $\sigma$ (sigma) is the deviation around the mean,
  known as Standard deviation/`écart-type`.
* $\sigma^2$ (sigma-square) is the variance ($\mathbb{V}(X)$)

So we have

* The density function is $f_X(x) = {\frac {1}{\sigma {\sqrt {2\pi }}}}e^{-{\frac {1}{2}}\left({\frac {x-\mu }{\sigma }}\right)^{2}}$
* $\mathbb{E}(X) = \ \mu$
* $\mathbb{V}(X) = \ \sigma^2$

<hr class="sr">

## Standard normal distribution

The standard normal distribution/`loi normale centrée réduite`
is a normal distribution with $\mu=0$ and $\sigma=1$
giving us $N(0,\ 1)$.

We can create a new variable $Y \sim N(0,\ 1)$
from X with the following formula ()

@
Y \sim \frac{X-\mu}{\sigma}
@

* the density function is noted $\phi_X(x)$ (phi) instead of $f_X(x)$
* the repartition function is noted $\Phi_X(x)$ (Phi) instead of $F_X(x)$

<hr class="sl">

## Standard normal table

If you have $X \sim N(\mu,\ \sigma^2)$, then

<div>
\[
F_X(c) = \mathbb{P}(X \le c)
= \mathbb{P}(\frac{X-\mu}{\sigma} \le \frac{c-\mu}{\sigma})
= \phi(\frac{c-\mu}{\sigma})
\]
</div>

You already know some of them but here is a recap

* $\mathbb{P}(X \le c) \Leftrightarrow \mathbb{P}(X \lt c)$
* $\mathbb{P}(X \ge c) \Leftrightarrow \mathbb{P}(X \gt c)$
* $\mathbb{P}(X \ge c) = 1 - \mathbb{P}(X \le c)$
* $\phi(0.5) = 0$
* $\phi(-x) = 1 - \phi(x)$ (**note that even if you can find 
  is a table for $x \lt 0$, you are only given the table with $x \ge 0$**
  so use this)

And now, you need to use this table to calculate
$\phi(x)$.
Note that the value at the first line (ex: 0.0)
and the first column (ex: 0.00) is
the result for $\phi(0.0 + 0.00)$.

* [wikipedia](https://en.wikipedia.org/wiki/Standard_normal_table)
* [another one as pdf here](https://www.math.arizona.edu/~jwatkins/normal-table.pdf)

This image is an image from the second link

<div style="height: 300px;overflow: auto;">

![](images/normal-table.png)
</div>