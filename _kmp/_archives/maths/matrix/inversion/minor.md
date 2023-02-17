# Cofactor expansion

[Go back](../index.md#matrix-inversion)

When we have a big matrix, we can split the matrix into smaller matrices, and use formulas we know such as $ad-bc$ for the 2x2 matrix. In French, our teacher is also calling this `Calcul par développement`.

We are calling **minor** of a matrix $A$, the matrix $M_{i,p}$ created by removing the row $i$ and the column $p$ of $A$.

We are calling **cofactor** $C_{i,p} = (-1)^{i+p} * det(M_{i,p})$.

<hr class="sl">

## Formula

We will pick a column $p$ and remove it from our matrix $A$. It's most of the time the column with the biggest coefficients or the coefficients that are hard to deal with. Then, all we have to do is to evaluate this formula.

<div class="overflow-auto">
\[
det(A) = \sum_{i=1}^n a_{i,p} * C_{i,p}
\]
</div>

*Note*: this is a sum of the product of the coefficient of the column we removed by their cofactors.

<hr class="sr">

## Example

<div class="overflow-auto">
\[
M=\begin{pmatrix}-1 & 4 & -7 \\2 & -5 & 8 \\-3 & 6 & -9\end{pmatrix}
\]
</div>

We are picking the column $p=3 \to (-7,8,-9)$. The formula is

<div class="overflow-auto">
\[
\begin{split}
det(M) 
= a_{1,3} * C_{1,3} + a_{2,3} * C_{2,3} + a_{3,3} * C_{3,3} \\
= -7 * C_{1,3} + 8 * C_{2,3} + -9 * C_{3,3}
\end{split}
\]
</div>

* $C_{1,3} = (-1)^{4} * det(M_{1,3}) = det(M_{1,3}) = \textbf{-3}$

<div class="overflow-auto">
\[
det(M_{1,3})=det(\begin{pmatrix}2 & -5\\-3 & 6\end{pmatrix}) = -3
\]
</div>

* $C_{2,3} = (-1)^{5} * det(M_{2,3}) = -det(M_{2,3}) = \textbf{-6}$

<div class="overflow-auto">
\[
det(M_{2,3})=det(\begin{pmatrix} -1 & 4 \\ -3 & 6 \end{pmatrix}) = 6
\]
</div>

* $C_{3,3} = (-1)^{6} * det(M_{3,3}) = det(M_{3,3}) = \textbf{-3}$

<div class="overflow-auto">
\[
det(M_{2,3})=det(\begin{pmatrix} -1 & 4 \\ 2 & -5\end{pmatrix}) = -3
\]
</div>

Hence, the result is

<div class="overflow-auto">
\[
\begin{split}
det(M)
= -7 * C_{1,3} + 8 * C_{2,3} + -9 * C_{3,3} \\
= -7 * -3 + 8 * -6 + -9 * -3 \\
= 0 \\
\end{split}
\]
</div>