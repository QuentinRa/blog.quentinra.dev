# Exercises

[Go back](..)

<hr class="sr">

**Exercise 1 (density function)**

Verify that $f(x) = x * e^{\frac{-x^2}{2}}$
with $x \gt 0$ is a density function.

<blockquote class="spoiler">

**1. $\forall{x},\ f(x) \ge 0$**

$x \gt 0$ and $e^t \ge 0$
so $f(x) \ge 0$.

**2. $f_X$ is continue**

Both $x$ and $e^t$ are continue.

**3. $\int_{-\infty}^{+\infty} f_X(x)dx = 1$**
that we can
simplify since $x \gt 0$ giving us $\int_{0}^{+\infty} f(x) dx = 1$.

<div>
\[
\displaylines{
\int_{0}^{+\infty} x * e^{\frac{-x^2}{2}} dx = 1
\\ 
\Leftrightarrow
[-e^{\frac{-x^2}{2}}]_{0}^{+\infty} = 1
\\ 
\Leftrightarrow
-0 - -1 = 1
}
\]
</div>

So $f(x)$ is a density function.
</blockquote>