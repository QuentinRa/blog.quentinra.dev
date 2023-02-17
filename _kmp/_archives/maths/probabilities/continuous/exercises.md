# Exercises

[Go back](..)

This is a batch of exercises on continuous probabilities (density function, expected value, variance, moment generating function, characteristic function).

<hr class="sr">

**Exercise 1 (density function)**

Verify that $f(x) = x * e^{\frac{-x^2}{2}}$ with $x \gt 0$ is a density function.

<blockquote class="spoiler">

**1. $\forall{x},\ f(x) \ge 0$**

$x \gt 0$ and $e^t \ge 0$
so $f(x) \ge 0$.

**2. $f_X$ is continuous**

Both $x$ and $e^t$ are continuous.

**3. $\int_{-\infty}^{+\infty} f_X(x)dx = 1$** that we can simplify since $x \gt 0$ giving us $\int_{0}^{+\infty} f(x) dx = 1$.

<div>
\[
\begin{split}
\int_{0}^{+\infty} x * e^{\frac{-x^2}{2}} dx = 1
\\ 
\Leftrightarrow
[-e^{\frac{-x^2}{2}}]_{0}^{+\infty} = 1
\\ 
\Leftrightarrow
-0 - -1 = 1
\end{split}
\]
</div>

So $f(x)$ is a density function.
</blockquote>

<hr class="sl">

**Exercise 2 (density function)**

Verify that $f(x) = 1 - |x|$ with $x \in [[-1,1]]$ is a density function.

<blockquote class="spoiler">

We can consider this a sum of two integrals from 0 to 1 because of the $|x|$ (absolute value) giving us $x \in [[0,1]]$.

@
2 * \int_{0}^{1} 1 - x
@

**1. $\forall{x},\ f(x) \ge 0$**

Since $x \in [0,1]$ then $1-x \ge 0$.

**2. $f_X$ is continuous**

Both $x$ and $1-x$ are continuous.

**3. $\int_{-\infty}^{+\infty} f_X(x)dx = 1$**

<div>
\[
\begin{split}
2 * \int_{0}^{1} 1 - x = 1
\\ 
\Leftrightarrow
2 * [x - \frac{x^2}{2} ]_{0}^{1} = 1
\\ 
\Leftrightarrow
2 * (1 - 0.5 - (0 - 0)) = 1
\\
\Leftrightarrow
2 * 0.5 = 1
\end{split}
\]
</div>

So $f(x)$ is a density function.
</blockquote>