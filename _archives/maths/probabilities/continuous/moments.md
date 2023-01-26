# Expected value and variance

[Go back](..)

The expected value $\mathbb{E}(X)$ is defined by:

@
\mathbb{E}[X] = \int_{-\infty}^{+\infty} xf_X(x)dx
@

* if the density function is not integrable, then the expected value do not exist
* if $\mathbb{E}(X) = 0$ then $X$ is centered 
* if $\mathbb{E}(X)$ is finite, then $X$ may be centered
* $\mathbb{E}[X * Y] = \int_{-\infty}^{+\infty}\int_{-\infty}^{+\infty} x * y * f_{XY}(x , y)\ dx dy$

<hr class="sr">

## Variance

The variance $V(X)$ is defined by

@
V[X] = \int_{-\infty}^{+\infty} (x-\mathbb{E}[X])^2\ f_X(x)\ dx
@