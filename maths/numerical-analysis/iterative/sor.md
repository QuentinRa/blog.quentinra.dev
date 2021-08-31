# Successive over-relaxation (SOR)

[Go back](../index.md)

The method SOR is introducing a new variable $\omega$ (omega). When omega is **1**, then this is the Gauss-Seidel formula. When omega is **lesser than one**, you should use the Jacobi method. And finally, when **omega is greater than one**, then you should use this method.

Since we are using this method, we are picking an omega greater than one, which is usually $\omega=1.1$. The SOR formula is

<div>
\[
X^{k+1} = (\frac{1}{\omega} D - L)^{-1}
* (b + [((\frac{1}{\omega} - 1) * D + U) * X^{(k)}])
\]
</div>

with

* omega is a number usually
  * omega > 0 and < 1: Jacobi
  * omega = 1: Gauss-Seidel
  * omega > 1: SOR
* **PART1**: $(\frac{1}{\omega} D - L)^{-1}$
* **PART2**: $((\frac{1}{\omega} - 1) * D + U)$

<hr class="sr">

## Example using the theory

Using the code we wrote for the Jacobi method,

```r
# ...
##################################
# Complete here: add new variables
##################################
omega <- 1.1
PART1 <- solve(((1/omega) * D) - L)
PART2 <- (1/omega - 1) * D + U

repeat {
    # update our vector of values with the formula
	Xk <- PART1 %*% (b + PART2 %*% Xk)
    # ...
}
```