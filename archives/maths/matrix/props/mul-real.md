# Multiply a matrix by a real

[Go back](../index.md#basic-operations)

This is as simple as you could guess. Simply multiply each coefficient by the real.

<div class="overflow-auto">
\[
\begin{split}-2 *
\begin{pmatrix}
1 & 2 & 3 \\
4 & 5 & 6
\end{pmatrix}
\ = \
\begin{pmatrix}
-2 & -4 & -6 \\
-8 & -10 & -12
\end{pmatrix}\end{split}
\]
</div>

<hr class="sl">

## Code in R

```r
# matrix 3x3, with (1,2,3\\4,5,6\\7,8,9)
A <- matrix(1:9, 3, 3, byrow = TRUE)

A * -1
#     [,1] [,2] [,3]
# [1,]   -1   -2   -3
# [2,]   -4   -5   -6
# [3,]   -7   -8   -9
```