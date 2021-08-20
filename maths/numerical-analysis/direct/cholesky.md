# Cholesky factorization

[Go back](../index.md)

<hr class="sl">

## About

* **Requirements**

The matrix must be **invertible**, **symmetric** and **positive definite**.

> As a side note, a matrix is **positive definite** if all of its **eigenvalues are positive**. It's may be hard, so another method is to check that every **minors** of A is $\gt 0$ (check the definite matrix section in the matrix course).

* **Complexity**

The complexity is $O(n^3)$.

<hr class="sr">

## Process

* check the requirements
  * invertible means $det(A) \neq 0$
  * symmetric means $A = A^t$
  * check the definiteness of $A$

Our goal is to convert our matrix to a **lower triangular matrix** like this one (example for 3x3)

<p>
\[
\begin{pmatrix}
l_{11} & 0 & 0 \\
l_{21} & l_{22} & 0 \\
l_{31} & l_{32} & l_{33} \\
\end{pmatrix}
\]
</p>

You only have to use the following formulas, and replace the values in the lower triangular matrix. Note that we are starting from the top-left corner.

**FIRST FORMULA**

<p>
\[
l_{ii} = \sqrt{a_{ii} - \sum_{k=1}^{i-1} l^2_{ik}}
\]
</p>

This is the square of the **value on the diagonal** minus all the **values** on the **same line**, but **before** ours.

**SECOND FORMULA**

<p>
\[
l_{ij} = \frac{a_{ij} - \sum_{k=1}^{j-1} l_{ik} * l_{jk} }{a_{ii}}
\]
</p>

This is the **our value** minus, the sum of the products of

* the value of the **previous column same line**
* by **the previous column of the previous line**
* (until we don't have a previous column)

Then, we are dividing the result by the value on the diagonal.

<hr class="sl">

# Example

Find cholesky factorization of A then find solve Ax = b.

<p>
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
</p>

We are **checking** that A is

* symmetric: ok (transpose it if you're not seeing it)
* definiteness
  * $det(\Delta_1) = 4 \gt 0$
  * $det(\Delta_2) = 4 * 10 - 2 * 2 = 36 \gt 0$
  * $det(\Delta_3)$
    * $= 4 * (10 * 21 - 7 * 7) - 2 * (2* 21 -2 * 7) + 2 * ( 2 * 7 - 2 * 10)$
    * $= 4 * 161 - 68 = 3 * 161 + 93$
    * $= (3*16)*10 + 100 - 7 + 3 = 576 \gt 0$
  * so the matrix is positive definite
* invertible:  ok, $$det(A) = $det(\Delta_3) \neq 0$

Then we are **starting** your job

* $l_{11} = \sqrt{4} = 2$
* $l_{21} = 2 / l_{11} = 1$
* $l_{22} = \sqrt{10 - 1^2} = 3$
* $l_{31} = 2 / l_{11} = 1$
* $l_{32} = \frac{7 - (1 * 1)}{3} = 2$
* $l_{33} = \sqrt{21 - 2^2 - 1^1} = 4$

Giving us the matrix

<p>
\[
\begin{pmatrix}
2 & 0 & 0 \\
1 & 3 & 0 \\
1 & 2 & 4 \\
\end{pmatrix}
\]
</p>

Now we will use **triangular factorization** with b and solve x.

<p>
\[
\begin{pmatrix}
2 & 0 & 0 & 12 \\
1 & 3 & 0 & -9\\
1 & 2 & 4 & -20\\
\end{pmatrix}
\]
</p>

Giving us

* $x = 6$
* $y = \frac{-9 -6}{3} = \frac{-15}{3} = -5$
* $z = \frac{-20 -6-10}{4} = \frac{-36}{4} = -9$