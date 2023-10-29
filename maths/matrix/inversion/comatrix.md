# Cofactor matrix

[Go back](../index.md#matrix-inversion)

The cofactor matrix of $A$, called `co-matrice`/`Com(A)` in French, is the matrix of the cofactors.

<div class="overflow-auto">
\[
C = 
\begin{bmatrix}
C_{11}&C_{12}&\cdots &C_{1n}\\
C_{21}&C_{22}&\cdots &C_{2n}\\
\vdots &\vdots &\ddots &\vdots \\
C_{n1}&C_{n2}&\cdots &C_{nn}
\end{bmatrix}
\]
</div>

Once you created this matrix, the inverted matrix formula is

<div>
\[
A^{-1} =
\frac{1}{det(A)} C^T
\]
</div>

<hr class="sl">

## Example

Given the following invertible matrix $A$ since $det(A)=66$. Using the cofactor matrix, solve $A^{-1}$.

<div class="overflow-auto">
\[
A=\begin{pmatrix} 3 & -2 & 4 \\ 2 & -4 & 5 \\1 & 8 & 2\end{pmatrix}
\]
</div>

<blockquote class="spoiler">

<div class="overflow-auto">
\[
C = \begin{pmatrix}
+ det(\begin{pmatrix}-4 & 5 \\ 8 & 2\end{pmatrix}) & - det(\begin{pmatrix}2 & 5 \\ 1 & 2\end{pmatrix}) & + det(\begin{pmatrix}2 & -4 \\ 1 & 8\end{pmatrix}) \\
- det(\begin{pmatrix}-2 & 4 \\ 8 & 2\end{pmatrix}) & + det(\begin{pmatrix}3 & 4 \\ 1 & 2\end{pmatrix}) & - det(\begin{pmatrix}3 & -2 \\ 1 & 8\end{pmatrix}) \\
+ det(\begin{pmatrix}-2 & 4 \\ -4 & 5\end{pmatrix}) & - det(\begin{pmatrix}3 & 4 \\ 2 & 5\end{pmatrix}) & + det(\begin{pmatrix}3 & -2 \\ 2 & -4\end{pmatrix})
\end{pmatrix}
\]
\[
\Leftrightarrow C = \begin{pmatrix}
-48 & 1 & 20 \\
36 & 2 & -26 \\
6 & -7 & -8 \\
\end{pmatrix} 
\]
And
\[
C^T = \begin{pmatrix}
-48 & 36 & 6 \\
1 & 2 & -7 \\
20 & -26 & -8 \\
\end{pmatrix}
\]
</div>

Then we have

<div class="overflow-auto">
\[
\begin{split}
A^{-1} = \frac{1}{-66} *
\begin{pmatrix}
-48 & 36 & 6 \\
1 & 2 & -7 \\
20 & -26 & -8 \\
\end{pmatrix} \\
\Leftrightarrow
\begin{pmatrix}
48/66 & -36/66 & -6/66 \\
-1/66 & -2/66 & 7/66 \\
-20/66 & 26/66 & 8/66 \\
\end{pmatrix}
\Leftrightarrow
\begin{pmatrix}
8/11 & -6/11 & -1/11 \\
-1/66 & -1/33 & 7/66 \\
-10/33 & 13/33 & 4/33 \\
\end{pmatrix}
\end{split}
\]
</div>

</blockquote>

<hr class="sl">

## Code in R

```r
library('MASS') # fractions
library('matlib') # rowCofactors

# I don't know how we can find Ct in R
# but you got some code here
# https://stackoverflow.com/questions/29046934/calculate-matrix-of-cofactors-in-r
# here is my version
# takes a matrix, return the cofactor matrix
cofactorMatrix <- function (A){
    n <- dim(A)[1]
    values <- NULL
    for (i in 1:n) {
        values <- c(values, rowCofactors(A, i))
    }
    return(matrix(values, n, n, byrow = TRUE))
}

A <- matrix(c(3,2,1,-2,-4,8,4,5,2), nrow = 3, ncol = 3)
C <- matrix(cofactorMatrix(A), nrow = 3, ncol = 3)
A.inv <- t(C) * (-1/66)

# print (as fractions)
fractions(A.inv)
#       [,1]   [,2]   [,3]
# [1,]   8/11  -6/11  -1/11
# [2,]  -1/66  -1/33   7/66
# [3,] -10/33  13/33  4/33
```