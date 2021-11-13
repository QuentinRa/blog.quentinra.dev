# LU factorization

[Go back](../index.md)

This is also called LU decomposition or LowerUpper decomposition. We are transforming our matrix A into two matrices L and U, which are both diagonal matrices. Then, we are solving the equation with LU instead of A.

<hr class="sl">

## About

* **Requirements**

The matrix must be invertible, and every leading **minor** must be not null.

* **Complexity**

The complexity is $O(\frac{2n^3}{3})$.

<hr class="sr">

## Process

Your goal is to write $A = L * U$ with

* $L$: a lower strict diagonal matrix
* $U$: an upper diagonal matrix

It's quite easy. You will use the GAUSS elimination, but limited to this only one rule

<p>
\[
L_i \leftarrow L_i - k * L_j
\]
</p>

meaning you can only subtract a line by another line that will be multiplied by k. Please, **note all k values that you used**. Your main job is starting from **U**, and remove all values below the diagonal. U matrix should look like this one

<div>
\[
U_{3} = \begin{pmatrix}
* & * & * \\
0 & * & * \\
0 & 0 & * \\
\end{pmatrix}
\]
</div>

If you remoted the number at $a_{ij}$, using $k=7$ then in the L matrix, the value at $a_{ij}$ is 7. The L matrix should look like this one

<div>
\[
L_{3} = \begin{pmatrix}
1 & 0 & 0 \\
* & 1 & 0 \\
* & * & 1 \\
\end{pmatrix}
\]
</div>

Once you have these, to get $AX = b$, you need to

* solve $Y$ in $LY = b$
* then, you got $X$ by solving $UX = Y$

<hr class="sr">

## Example

Find the LU factorization of A and solve $AX = b$.

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

* **leading minors not null**, ok
  * $det(\Delta_1) = 4 \ne 0$
  * $det(\Delta_2) = 36 \ne 0$
  * $det(\Delta_3) = 576 \ne 0$
  * The steps are on the Cholesky factorization page
* **invertible**:  ok, $det(A) = det(\Delta_3) \neq 0$

So we're starting, my steps were

* $L_2 \leftarrow L_2 - {\color{blue}1/2} L_1$
* $L_3 \leftarrow L_3 - {\color{blue}1/2} L_1$

<p>
\[
\begin{pmatrix}
4 & 2 & 2 \\
0 & 9 & 6 \\
0 & 6 & 20 \\
\end{pmatrix}
\]
</p>

* $L_3 \leftarrow L_3 - {\color{blue}2/3} L_1 $

<p>
\[
U = \begin{pmatrix}
4 & 2 & 2 \\
0 & 9 & 6 \\
0 & 0 & 16 \\
\end{pmatrix}
\]
</p>

Using the $k$ we removed, I have

<p>
\[
L = \begin{pmatrix}
1 & 0 & 0 \\
1/2 & 1 & 0 \\
1/2 & 2/3 & 1 \\
\end{pmatrix}
\]
</p>

As we did for Cholesky, we are solving $LY=b$

* $x = 12$
* $y = -9 - \frac{12}{2} = -15$
* $z = -20 - \frac{12}{2} + \frac{2*15}{3} = -16$

So we have $Y = (12,-15,-16)$. And now, we are solving $UX=Y$

* $z = \frac{16}{-16} = -1$
* $y = \frac{-15 +6}{9} = -1$
* $x = \frac{12 + 2 + 2}{4} = 4$

Giving us $X = (4,-1,-1)$, as we expected.

<hr class="sl">

## LU factorization in R

Here is the code in R

```r
A <- matrix(c(4,2,2,2,10,7,2,7,21), nrow = 3, ncol = 3, byrow = TRUE)
b <- c(12,-9,-20)

res <- lu(A)
L <- res$L
U <- res$U
# L
#      [,1]      [,2] [,3]
# [1,]  1.0 0.0000000    0
# [2,]  0.5 1.0000000    0
# [3,]  0.5 0.6666667    1
# 
# U
#      [,1] [,2] [,3]
# [1,]    4    2    2
# [2,]    0    9    6
# [3,]    0    0   16

# check
identical(L %*% U, A)
# [1] TRUE

# LY = b
Y <- forwardsolve(L, b)
# [1]  12 -15 -16
# UX = Y
X <- backsolve(U, Y)
# [1]  4 -1 -1
```