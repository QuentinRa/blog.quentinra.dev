# Example (by yourself)

[Go back](../index.md#linear-system)

We are considering the following system, which we will rewrite into a matrix $A$, and a vector $b$.

<div>
\[
\begin{split}\left \{
\begin{array}{r c l}
x_1 \ \ - \ \ x_2 + 2x_3 = 3 \\
x_1 \ \ + \ 2x_2 \ \ \ \ \ \ \ \ \ \ = 0
\end{array}
\right .\end{split}
\]
</div>

<hr class="sl">

## Matrix $A$ and vector $b$

The matrix $A$ is made of the coefficients before each variable. The first column is for $x_1$, etc. The vector $b$ is made of the results of each equation. And the matrix $S$, is made by concatenating the two.

<div>
\[
A = \begin{split}\begin{pmatrix}
1 & -1 & 2 & 3 \\
1 & 2 & 0 & 0
\end{pmatrix}
\quad
b = \begin{pmatrix}3 \\ 0\end{pmatrix}
\quad
S = \begin{pmatrix}
\ 1 & -1 & 2 & 3 \\
\ 1 & 2 & 0 & 0
\end{pmatrix}
\end{split}
\]
</div>

<hr class="sr">

## GAUSS

Using the GAUSS method (omitted for now, you got more methods in the numerical analysis course) on $S$, we got the matrix

<div>
\[
\begin{split}\begin{pmatrix}
\ 1 & 0 & 4/3 & 2 \\
\ 0 & 1 & -2/3 & -1
\end{pmatrix}\end{split}
\]
</div>

<hr class="sl">

## Result

We are converting our matrix back to a system

* $x_1 = 2 - \frac{4}{3} x_3$
* $x_2 = -1 + \frac{2}{3} x_3$

To make it more explicit, I converted back the first line to $x_1 + 0x_2 + \frac{4}{3} x_3 = 2$ which means that $x_1 = 2 - \frac{4}{3} x_3$. $x_3$ is called a parameter.