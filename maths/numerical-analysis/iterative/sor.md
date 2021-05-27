# Successive over-relaxation (SOR)

[Go back](../index.md)

...

## More theoretically

SOR formula is
<div>
  \[
    \displaylines{
      \begin{align}\begin{aligned}
    x^{k+1} = (\frac{1}{\omega} D - L)^{-1}
    * (b + [((\frac{1}{\omega} - 1) * D + U) * x^k])
    \end{aligned}\end{align}
    }
  \]
</div>

with

* b, that's the b in Ax=b
* omega is a number usually
  * omega > 0 and < 1 : jacobi
  * omega = 1 : gauss-seidel
  * omega > 1 : SOR
* x, the result, after k iterations
* D, a diagonal matrix
* L, a upper triangular matrix, multiplied by -1
* U, a lower triangular matrix, multiplied by -1

In other words, **A = D - L - U**. Beware of this before
writing a formula, some are using plus instead of minus.