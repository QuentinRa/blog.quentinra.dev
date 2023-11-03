# Matrix Theory

<div class="row row-cols-lg-2"><div>

A matrix is a two-dimensional table with columns, rows, and values. We use the notation $A_{n,p}$ for a matrix of $n$ lines and $p$ columns. The value at the $i$-nth line and the $j$-nth column is written $a_{ij}=a_{i,j}$.

<div class="overflow-auto">
\[
\begin{split}A=\ A_{n,p}=\ A_{np}=\ \begin{pmatrix}
\ a_{1,1} & \cdots & a_{1, p-1} \\
\vdots  & \cdots & \vdots  \\
\ a_{n-1,1} & \cdots & a_{n-1, p-1}
\end{pmatrix}\end{split}
\]
</div>

⚠️ The coefficients $i$ and $j$ are starting from 1.
</div><div>

A linear system is a set of equations that can be solved together. Matrices are often used to represent and solve linear systems of equations.

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

We often create a matrix $A$ for the equations, a vector $b$ for the right-hand side. And the matrix $S$, is made by concatenating the two.

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
</div></div>

<hr class="sep-both">

## 👻 To-do 👻

Stuff that I found, but never read/used yet.

<div class="row row-cols-lg-2"><div>

* [old](_old.md)
</div><div>
</div></div>