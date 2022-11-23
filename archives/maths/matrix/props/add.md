# Add a matrix with another

[Go back](../index.md#basic-operations)

As long as the two matrices have the same number of lines and columns (=dimension), you can make the sum, which is the addition of their values, coefficient by coefficient.

<div class="overflow-auto">
\[
\begin{split}        \begin{pmatrix}
1 & 2 & 3 \\
4 & 5 & 6
 \end{pmatrix}
 +
 \begin{pmatrix}
0 & 1 & 2 \\
1 & 2 & 3
 \end{pmatrix} = \begin{pmatrix}
1 & 3 & 5 \\
5 & 7 & 9
 \end{pmatrix}\end{split}
\]
</div>

<hr class="sl">

## Code in R

```r
# matrix 3x3, with (1,2,3\\4,5,6\\7,8,9)
A <- matrix(1:9, 3, 3, byrow = TRUE)
# matrix of 1
B <- matrix(rep(1, length = 9), 3, 3, byrow = TRUE)

A+B
# 		[,1] [,2] [,3]
# [1,]    2    3    4
# [2,]    5    6    7
# [3,]    8    9   10
```