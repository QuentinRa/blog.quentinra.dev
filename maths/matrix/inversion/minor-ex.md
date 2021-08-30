# Leading minors of a matrix (example)

[Go back](../index.md#definiteness-of-a-matrix)

This is an example of evaluating the leading minor of a matrix, as we explained on the previous page. Given the following matrix $A$,

<p>
\[
A = \begin{pmatrix}
4 & 2 & 2 \\
2 & 10 & 7 \\
2 & 7 & 21 \\
\end{pmatrix}
\]
</p>

The **leading minors** of **A** are

* $det(\Delta_1) = 4$
* $det(\Delta_2) = 4 * 10 - 2 * 2 = 36$
* $det(\Delta_3)$
  * $= 4 * (10 * 21 - 7 * 7) - 2 * (2* 21 -2 * 7) + 2 * ( 2 * 7 - 2 * 10)$
  * $= 4 * 161 - 68 = 3 * 161 + 93$
  * $= (3*16)*10 + 100 - 7 + 3 = 576$

Every leading minor is greater than $0$, so the matrix is **positive definite**.