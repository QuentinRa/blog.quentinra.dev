# Triangular systems

[Go back](../index.md)

This method is quite easy, and probably one of the most useful, as the other methods are splitting the matrix A into two triangular matrices since this is more efficient.

<hr class="sl">

## About

* **Requirements**

The matrix must be triangular.

* **Complexity**

This is a GAUSS elimination, starting in the row-echelon form, so we have a complexity lesser than $O(n^3)$. In fact, we have $O(\frac{n^3}{4})$.

<hr class="sr">

## Process

It's quite easy to solve. The first line or the last line is like $x = 5$ (lower triangular) or $t = 7$ (upper triangular). All you have to do is to go up or down and replace the variables with their values. You only have one variable in each equation, and this is why I told you that it was easy.

<hr class="sl">

## Example

Given this matrix $A$ and this vector $b$,

<div>
\[
A = \begin{pmatrix}
1 & 2 & 3 \\
0 & 4 & 5 \\
0 & 0 & 6 \\
\end{pmatrix}
\quad
b = \begin{pmatrix}
12 \\
3 \\
6 \\
\end{pmatrix}
\]
</div>

We are creating the following matrix,

<p>
\[
S = \begin{pmatrix}
1 & 2 & 3 & 12 \\ 
0 & 4 & 5 & 3 \\
0 & 0 & 6 & 6
\end{pmatrix}
\]
</p>

We are considering the variables x, y, z, respectively the 1rst, 2nd, and 3rd columns.

* $6z = 6$ so $z = 1$
* $4 y + 5 z = 3 \Leftrightarrow y = (3 - 5*1) / 4$ so $y  = -0.5$
* $x + 2 y + 3z = 12 \Leftrightarrow x = 12 - 2 * -0.5 - 3 * 1$ so $x  = 10$
* So we have $X = (10, -0.5, 1)$

<hr class="sr">

## Solving a triangular system in R

Let's create two matrices, so we are solving a lower triangular matrix and an upper triangular matrix.

```r
d <- c(1,2,3,0,4,5,0,0,6)
UpperA <- matrix(d, nrow = 3, ncol = 3, byrow = TRUE)
LowerA <- matrix(rev(d), nrow = 3, ncol = 3, byrow = TRUE)
# UpperA
#      [,1] [,2] [,3]
# [1,]    1    2    3
# [2,]    0    4    5
# [3,]    0    0    6
# LowerA
# [,1] [,2] [,3]
# [1,]    6    0    0
# [2,]    5    4    0
# [3,]    3    2    1
b <- c(12,3,6)
```

We are calling our functions

```r
backsolve(UpperA, b)
# [1] 10.0 -0.5  1.0
# we are good: x=10.0 y=-0.5 z=1.0
# X = (10, -0.5, 1)

# exercise: try to check this one too
forwardsolve(LowerA, b)
# [1]  2.00 -1.75  3.50
```