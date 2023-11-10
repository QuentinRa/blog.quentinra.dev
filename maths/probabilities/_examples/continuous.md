# Continuous Probability Example

<hr class="sep-both">

## Moment-Generating Function Example

<div class="row row-cols-lg-2"><div>

The density function of an exponential distribution is $f_X(x) = \lambda \exp^{-\lambda x}$ (with $lambda \ge 0$).

The formula is $M_X(t) = \int \exp(tx)\ f_X(x)\ dx$.

#### Calculate The Function

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
</div><div>

#### Calculate The Expected Value

<div>
\[
\mathbb{E}(X) = M'_X(0) = \frac{\lambda}{(\lambda - t)^2}
= \frac{\lambda}{\lambda^2} = \frac{1}{\lambda}
\]
</div>

#### Calculate The Variance

<div>
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
</div></div>