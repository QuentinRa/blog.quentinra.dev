# Moment-generating function (MGF)

[Go back](..)

The Moment-generating function or `Fonction génératrice des moments` is a function allowing us to find the moments (the expected value $\mathbb(X)$, the variance $V(X)$) when we are not able to.

That's the case when the expected value not converging to a value, or when the expected value is too complex

<div>
\[
\mathbb{E}(|X^k|) = \int |x^k|\ F_x(x)\ dx = +\infty \hspace{1cm} \text{ :(}
\]
</div>

We are defining the moment-generating function by

<div>
\[
M_X(t) = \mathbb{E}(\exp(tX)) =
\int \exp(tx)\ f_X(x)\ dx
\]
</div>

<hr class="sr">

## Usage

Let $M_X(t)$ a moment-generating function, then

<div>
\[
\mathbb{E}(X) = \frac{\delta M_X (t)}{\delta t}
= M'_X(0)
\]
\[
V(X) = \frac{\delta^2 M_X (t)}{\delta t^2} - \mathbb{E}(X)^2
= M''_X(0) - \mathbb{E}(X)^2
\]
</div>

If you are wondering how did we get these formulas, look on the web, and you may add it here, because that didn't pick my interest, hence, I didn't add it.

<hr class="sl">

## Example

According to [wikipedia](https://en.wikipedia.org/wiki/Exponential_distribution), the density function of an exponential distribution is $f_X(x) = \lambda \exp^{-\lambda x}$ (with $lambda \ge 0$) and we know that $M_X(t) = \int \exp(tx)\ f_X(x)\ dx$, so we have

<div>
\[
\begin{split}
M_X(t) = \int_{0} \exp^{tx} * \lambda * \exp^{-\lambda x}\ dx\\
= \lambda * \int_{0} \exp^{tx} * \exp^{-\lambda x}\ dx \\
= \lambda * \int_{0} \exp^{(t -\lambda) x}\ dx \\
= \lambda * [ \frac{1}{t -\lambda} * \exp^{(t -\lambda) x}]_0^{+\infty} \\
= \lambda * (0 - \frac{1}{t -\lambda}) \\
= - \frac{\lambda}{t -\lambda} \\
= \frac{\lambda}{\lambda - t}
\end{split}
\]
</div>

Giving us

<div>
\[
\mathbb{E}(X) = M'_X(0) = \frac{\lambda}{(\lambda - t)^2}
= \frac{\lambda}{\lambda^2} = \frac{1}{\lambda}
\]
\[
\displaylines{
V(X) = M''_X(0) - \mathbb{E}(X)^2 \\
= \frac{2\lambda}{(\lambda - t)^3} - \frac{1}{\lambda^2} \\
= \frac{2\lambda}{\lambda^3} - \frac{1}{\lambda^2} \\
= \frac{2}{\lambda^2} - \frac{1}{\lambda^2} \\
= \frac{1}{\lambda^2}
}
\]
</div>

You should try too. Look for some distribution on Wikipedia (Poisson, Bernoulli, Weibull, ...) and try it. Usually, the expected value/variance/density function and even the moment-generating function are given, so you only need to do the calculations.

* **PDF**: the density function
* **Mean**: the expected value
* **Variance**: the variance
* **MGF**: the moment-generating function