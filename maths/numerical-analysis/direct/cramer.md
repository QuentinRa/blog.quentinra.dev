# Cramer's rule

[Go back](../index.md)

Also called Cramer's formula.

<hr class="sl">

## About

* **Requirements**

The matrix must be invertible, for instance, if $A$ is a matrix of reals, we would want that $A \in Gl_n(\mathbb{R})$.

* **Complexity**

This is **the worst of the worst** (maybe not but...), the complexity for a matrix $n$ is $n$ times greater than the complexity of GAUSS method, since we are evaluating $n+1$ determinants.

<hr class="sr">

## Process

* calculate the determinant $d$ of $A$
  * for a 1x1 matrix it's $a$
  * for a 2x2 matrix it's $ac-bd$
  * you may refer to matrix course if you don't remember
* then for each column of your matrix $A$
  * replace a column with the vector $b$
  * evaluates determinant, $d_x$ for the column of the variable $x$
  * then $x$ value would be $\frac{d_x}{d}$

<hr class="sl">

## Example

For a 3x3 matrix $A$,

<div>
\[
A = \begin{pmatrix}
4 & 2 & 2 \\
2 & 10 & 7 \\
2 & 7 & 21 \\
\end{pmatrix}
\quad
b = \begin{pmatrix}
12 \\
-9 \\
-20 \\
\end{pmatrix}
\]
</div>

we will have $4$ determinants,

* $det(A) = 4 * (10\*21 - 7\*7)- 2 * (2\*21 - 2\*7) + 2 * (2\*7 - 2*10) = 576$
* $det(A_x) = 12 * (10\*21 - 7\*7) + 9 * (2\*21 - 2\*7) - 20 * (2\*7 - 2*10) = 2304$
* $det(A_y) = 4 * (-9\*21 - 7\*-20)- 2 * (12\*21 - 2\*-20) + 2 * (12\*7 - 2*-9) = -576$
* $det(A_z) = 4 * (10\*-20 + 9\*7)- 2 * (2\*-20 - 12\*7) + 2 * (2\*-9 - 12*10) = -576$

Hence, we have

* $x = \frac{2304}{576} = 4$
* $y = \frac{-576}{576} = -1$
* $z = \frac{-576}{576} = -1$