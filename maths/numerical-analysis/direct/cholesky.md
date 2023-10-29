# Cholesky factorization

[Go back](../index.md)

This is also called Cholesky decomposition. We are transforming our matrix A into two triangular matrices, L and L transpose. We are using them instead of solving the system with A.

<hr class="sl">

## About

* **Requirements**

The matrix must be 

* **invertible** ($det(A) \neq 0$),
* **symmetric** ($A = A^t$),
* and **positive definite**.

> As a side note, a matrix is **positive definite** if all of its **eigenvalues are positive**. It may be hard, so another method is to check that every leading **minor** of A is greater than 0 (check the definite matrix section in the matrix course).

* **Complexity**

The complexity is $O(n^3)$.

<hr class="sr">

## Process

Our goal is to convert our matrix to a **lower triangular matrix** like this one (example for 3x3)

<p>
\[
L^t = \begin{pmatrix}
l_{11} & 0 & 0 \\
l_{21} & l_{22} & 0 \\
l_{31} & l_{32} & l_{33} \\
\end{pmatrix}
\]
</p>

You only have to use the following formulas, and replace the values in the lower triangular matrix. Note that we are starting from the top-left corner.

* **FIRST FORMULA**

<p>
\[
l_{ii} = \sqrt{a_{ii} - \sum_{k=1}^{i-1} l^2_{ik}}
\]
</p>

This is the square of the **value on the diagonal** minus all the **values** (to square) on the **same line**, but **before** ours.

* **SECOND FORMULA**

<p>
\[
l_{ij} = \frac{a_{ij} - \sum_{k=1}^{j-1} l_{ik} * l_{jk} }{a_{ii}}
\]
</p>

This is **our value** minus, the sum of the products of

* the value of the **previous column same line**
* by the value of **the previous column of the previous line**
* (until we don't have a previous column)

Then, we are dividing the result by the value on the diagonal.

* **THEN THE GOAL Ax=b**

Your first goal will be to get the matrix $L^t$, using the formulas. Once you do, transpose it, and you will have $L$. Now, you got two jobs

* we should have $A = L^t * L$
* solve $Y$ in $L^t * Y = b$
* then $X$ is the result of solving $L * X = Y$

<hr class="sl">

## Example

Find the Cholesky factorization of A and solve $AX = b$.

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

* **symmetric**: ok (transpose it if you're not seeing it)
* **positive definite**
  * $det(\Delta_1) = 4 \gt 0$
  * $det(\Delta_2) = 4 * 10 - 2 * 2 = 36 \gt 0$
  * $det(\Delta_3)$
    * $= 4 * (10 * 21 - 7 * 7) - 2 * (2* 21 -2 * 7) + 2 * ( 2 * 7 - 2 * 10)$
    * $= 4 * 161 - 68 = 3 * 161 + 93$
    * $= (3*16)*10 + 100 - 7 + 3 = 576 \gt 0$
  * so the matrix is positive definite
* **invertible**:  ok, $det(A) = det(\Delta_3) \neq 0$

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
L^t = \begin{pmatrix}
2 & 0 & 0 \\
1 & 3 & 0 \\
1 & 2 & 4 \\
\end{pmatrix}
\quad
L = \begin{pmatrix}
2 & 1 & 1 \\
0 & 3 & 2 \\
0 & 0 & 4 \\
\end{pmatrix}
\]
</p>

Now we will use **triangular factorization** with $L^t Y = b$ and **solve y**.

<p>
\[
\begin{pmatrix}
2 & 0 & 0 & 12 \\
1 & 3 & 0 & -9\\
1 & 2 & 4 & -20\\
\end{pmatrix}
\]
</p>

Giving us $Y = (6, -5, -4)$

* $x = 6$
* $y = \frac{-9 -6}{3} = \frac{-15}{3} = -5$
* $z = \frac{-20 -6 + 10}{4} = \frac{-16}{4} = -4$

Now we are solving $X$

<p>
\[
\begin{pmatrix}
2 & 1 & 1 & 6 \\
0 & 3 & 2 & -5\\
0 & 0 & 4 & -4\\
\end{pmatrix}
\]
</p>

Giving us $X = (4,-1,-1)$

* $z = -4/4 = -1$
* $y = \frac{-5--2}{3} = \frac{-3}{3} = -1$
* $x = \frac{6 +1 +1}{2} = \frac{8}{2} = 4$
* So we have: $X = (4,-1,-1)$

We got the **same result** that we got when we used Cramer's rule, so we are good.

<hr class="sl">

## Cholesky factorization in R

Here is the code in R

```r
A <- matrix(c(4,2,2,2,10,7,2,7,21), nrow = 3, ncol = 3, byrow = TRUE)
b <- c(12,-9,-20)

# Cholesky
A.chol <- chol(A)
# [,1] [,2] [,3]
# [1,]    2    1    1
# [2,]    0    3    2
# [3,]    0    0    4
A.chol.t <- t(A.chol)
# [,1] [,2] [,3]
# [1,]    2    0    0
# [2,]    1    3    0
# [3,]    1    2    4

# check
identical(t(A.chol) %*% A.chol, A)

# solve Ay = b
Y <- forwardsolve(A.chol.t, b)
# [1]  6 -5 -4
X <- backsolve(A.chol, Y)
# 4 -1 -1
```