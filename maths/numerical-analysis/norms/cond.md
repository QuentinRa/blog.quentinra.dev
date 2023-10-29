# Condition number

[Go back](../index.md)

The condition number (`Conditionnement`) is a measure of the dependence between the vector of parameters $X$ and the solution $b$.

<p class="mathjax_process">
\[
cond(A) = |||A||| * |||A^{-1}|||
\]
</p>

Properties

* if $A \in Gl_n(\mathbb{R})$ then $cond(A) \ge 1$
* if $A \in Gl_n(\mathbb{R})$ then $cond(\lambda{A}) = cond(A)$
* if $A, B \in Gl_n(\mathbb{R})$ then $cond(AB) \le cond(A) * cond(B)$

If you forgot, $A \in Gl_n(\mathbb{R})$ means that a matrix of reals $\mathbb{R}$ is invertible.

<hr class="sr">

## Notes

<div>
\[
\begin{split}
cond_2(A) = \sqrt{\frac{\sigma_n}{\sigma_1}} \\
or \ if \ A \ is \ positive \ definite \\
cond_2(A) = \sqrt{\frac{\lambda_n}{\lambda_1}} \\\end{split}
\]
</div>

Note that 

* $\sigma$: the smallest eigenvalue
* $\lambda$: the biggest eigenvalue

<p class="mathjax_process">
\[
cond_p(A) = |||A||_p |||A^{-1}||_p
\]
</p>