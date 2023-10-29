# Example

[Go back](../index.md#linear-system)

In the previous example, we had rewritten the given system, and it gave us the matrix $A$, and the vector $b$.

<div>
\[
A = \begin{split}\begin{pmatrix}
1 & -1 & 2\\
1 & 2 & 0
\end{pmatrix}
\quad
b = \begin{pmatrix}3 \\ 0\end{pmatrix}
\end{split}
\]
</div>

<hr class="sl">

## Solving using GAUSS

We used the GAUSS method (you got more methods in the numerical analysis course), which could be coded as follows in **R**

```r
library('matlib')

A <- matrix(c(1,-1,2,1,2,0), nrow = 2, byrow = T)
b <- c(3,0)

gaussianElimination(A, b)
#      [,1] [,2]       [,3] [,4]
# [1,]    1    0  1.3333333    2
# [2,]    0    1 -0.6666667   -1
# [3,]    0    0  0.0000000    0
```

<hr class="sl">

## Results

We are converting our matrix back to a system

* $x_1 = 2 - \frac{4}{3} x_3$
* $x_2 = -1 + \frac{2}{3} x_3$