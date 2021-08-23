# Gauss elimination

[Go back](../index.md)

We are simply using GAUSS, as you did in the matrix course. We are stopping when the matrix is triangular, and switching to the method for triangular system (we could continue with GAUSS).

<hr class="sl">

## About

* **Requirements**

None.

* **Complexity**

The complexity is $O(n^3)$.

<hr class="sr">

## Process

This method is the same as explained in the matrix course.

<hr class="sl">

## Example

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

We are applying GAUSS on

<p>
\[
\begin{pmatrix}
4 & 2 & 2 & 12 \\
2 & 10 & 7 & -9 \\
2 & 7 & 21 &-20 \\
\end{pmatrix}
\]
</p>

Steps 1 to 3

* $L_1 \leftarrow L_1 * 1/4$
* $L_2 \leftarrow L_2 - 2*L_1$
* $L_3 \leftarrow L_3 - 2*L_1$

<p>
\[
\begin{pmatrix}
1 & 2/4 & 2/4 & 3 \\
0 & 9 & 6 & -15 \\
0 & 6 & 20 & -26 \\
\end{pmatrix}
\]
</p>

Steps 4 and 5

* $L_2 \leftarrow L_2/9$
* $L_3 \leftarrow L_3 - 6 * L_2$

<p>
\[
\begin{pmatrix}
1 & 2/4 & 2/4 & 3 \\
0 & 1 & 2/3 & -5/3 \\
0 & 0 & 16 & -16 \\
\end{pmatrix}
\]
</p>

Step 6

* $L_3 \leftarrow L_3/16$

<p>
\[
\begin{pmatrix}
1 & 2/4 & 2/4 & 3 \\
0 & 1 & 2/3 & -5/3 \\
0 & 0 & 1 & -1 \\
\end{pmatrix}
\]
</p>

This is a **triangular system**

* $z = -1$
* $y = -5/3 + 2/3 = -3/3 = -1$
* $x = 3 + 2/4 + 2/4 = 4$

As always, we got the same result: $X = (4,-1,-1)$.

<hr class="sr">

## Gauss elimination in R

This is not a function solving a matrix using GAUSS, but I didn't want to code it (you may add it).

```r
A <- matrix(c(4,2,2,2,10,7,2,7,21), nrow = 3, ncol = 3, byrow = TRUE)
b <- c(12,-9,-20)

solve(A, b)
# [1]  4 -1 -1
```

If you can install a library, then you got what you want in the ``matlib`` library.

```r
library('matlib')

gaussianElimination(A, b)
# steps
gaussianElimination(A, b, verbose = T)
```