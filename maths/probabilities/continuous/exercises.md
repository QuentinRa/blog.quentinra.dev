# Exercises

[Go back](..)

**Exercise 1 (Distributions)**

We are working with the density function
$f(x) = \frac{e^{-1}}{x!}, x = 0,1, 2...$.

1. $P(X=2)$

<blockquote class="spoiler">
The answer is $\mathbb{P}(X=2) = \frac{e^{-1}}{2!}$.
</blockquote>

2. $P(X < 2)$

<blockquote class="spoiler">
The answer is $\mathbb{P}(X < 2) = P(X=0) + P(X=1) = \frac{e^{-1}}{0!} + \frac{e^{-1}}{1!}
= e^{-1} + e^{-1} = 2 e^{-1}$.
</blockquote>

3. Demonstrate that $e^{-1}$ is the constant making
   $\frac{c}{x!}$ a density function?

<blockquote class="spoiler">
<div>
\[
\begin{split}
\text{density function} := \sum_{k=0}^{+\infty} f(k) = 1 \\
\Leftrightarrow
\sum_{k=0}^{+\infty} \frac{c}{k!} = 1
\Leftrightarrow
c * \sum_{k=0}^{+\infty} \frac{1}{k!} = 1
\Leftrightarrow^{because\ 1^k = 1}
c * \sum_{k=0}^{+\infty} \frac{1^k}{k!} = 1\\
\Leftrightarrow^\text{exponential series}
c * e = 1 \Leftrightarrow  c = \frac{1}{e} \Leftrightarrow c = e^{-1}\end{split}
\]
</div>

The function is increasing and the values are positives
so that's a density function.
</blockquote>