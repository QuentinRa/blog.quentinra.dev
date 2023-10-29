# Multiply a matrix by a matrix

[Go back](../index.md#basic-operations)

If the number of columns of a matrix $M1_{n1, \ {\color{red}c}}$ is the same as the number of lines of a matrix $M2_{\ {\color{red}c}, p2}$ then you can multiply $M1$ by $M2$

* the result is a matrix $M$: $M1_{n1,c} * M2_{c, p2} = M_{n1,p2}$.
* $M1 * M2$ **DOES NOT mean** that we can do $M2 * M1$.

<hr class="sl">

## Example

Here is an example of what you need to do

<div class="overflow-auto">
\[
\begin{split}\ \ \  \  \  \  \  \  \  \  \  \  \ \  \  \  \  \  \  \  \  \  \  \ \  \
M1\ \begin{pmatrix}
\color{blue}{1} & 4 \\
\color{blue}{2} & 5  \\
\color{blue}{3} & 6
\end{pmatrix}\end{split}
\]
\[
\begin{split}M2
\begin{pmatrix}
\color{red}{9} & \color{red}{8} & \color{red}{7} \\
6 & 5 & 4
\end{pmatrix}
\
M
\begin{pmatrix}
\color{red}{9}*\color{blue}{1}+\color{red}{8}*\color{blue}{2}+\color{red}{7}*\color{blue}{3}=46 & 9*4+8*5+7*6=118 \\
6*1+5*2+4*3=28 & 6*4+5*5+4*6=73
\end{pmatrix}\end{split}
\]
</div>

As for an explanation

* we usually put your matrix in a reverse L
  * on top, the first matrix
  * on the left side, the second matrix
  * and in the corner, the resulting matrix
* for the value $a_{\color{red}{1}\color{blue}{1}}$ of the resulting matrix, we are doing

<div>
\[
\sum_{i=1}^n a_{{\color{red}1},i} * b_{i, \color{blue}{1}}
\]
</div>

<hr class="sl">

## Code in R

```r
# matrix 3x3, with (1,2,3\\4,5,6\\7,8,9)
A <- matrix(1:9, 3, 3, byrow = TRUE)
# matrix of 1
B <- matrix(rep(1, length = 9), 3, 3, byrow = TRUE)

A %*% B
#       [,1] [,2] [,3]
# [1,]    6    6    6
# [2,]   15   15   15
# [3,]   24   24   24
```