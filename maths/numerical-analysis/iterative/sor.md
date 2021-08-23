# Successive over-relaxation (SOR)

[Go back](../index.md)

This is the same as the GAUSS-seidel method, but you will change it a bit the equations. We are introducing a variable $\omega$ which is usually $1.1$.

Then, the formula to create the new functions is looking like this for $x_{n+1}$.

<p>
\[
x_{n+1}' = \omega * x_{n+1} + (1 - \omega) * x_n
\]
</p>

<hr class="sl">

## Using a table

We are again solving this system, using **SOR**, and starting with $X = (0,0,0)$. We had

* $x_{n+1}(x, y, z) = \frac{12 - 2 * y - 2 * z}{4}$
* $y_{n+1}(x, y, z) = \frac{-9 - 2 * x - 7 * z}{10}$
* $z_{n+1}(x,y,z) = \frac{-20 - 2 * x - 7 * y}{21}$

but now we have

* $x'\_{n+1}(x, y, z) = 1.1 * x\_{n+1}(x, y, z) - 0.1 * x\_{n}(x, y, z)$
* $y'\_{n+1}(x, y, z) = 1.1 * y\_{n+1}(x, y, z) - 0.1 * y\_{n}(x, y, z)$
* $z'\_{n+1}(x, y, z) = 1.1 * z\_{n+1}(x, y, z) - 0.1 * z\_{n}(x, y, z)$

| var | i=0 | i=1 | i=2 | ... | $i\ge10$ |
| ------ | ------ | ------ | ------ | ------ | ------ |
| x | $x^{(0)} = 0$ | $X = (0,0,0)$ <br> $x^{(1)} = 1.1 * 3 - 0 = 3.3$ | $X = (3.3, -1.716, -0.764)$ <br> $x^{(2)} = 4.334$ | ... | $X = (?,?,?)$ <br> $x^{(10)} = 4$ |
| y | $y^{(0)} = 0$ | $X = (3.3,0,0)$ <br> $y^{(1)} = -1.716$ | $X = (4.334, -1.716, -0.764)$ <br> $y^{(2)} = -1.183$ | ... | $X = (?,?,?)$ <br> $x^{(10)} = -1$ |
| z | $z^{(0)} = 0$ | $X = (3.3,-1.716, 0)$ <br> $z^{(1)} = -0.764$ | $X = (4.334, -1.183, -0.764)$ <br> $z^{(2)} = -0.991$ | ... | $X = (?,?,?)$ <br> $x^{(10)} = -1$ |

<hr class="sl">

## Code in R

Here is how you could see this in R code. We are checking the convergence with $\epsilon = 0.001$.

```r
# our functions
# I removed the unused parameters to factorize the code
# with a wrapper (below)
xnp1 <- function (y, z) { (12 - 2 * y - 2 * z) / 4  }
ynp1 <- function (x, z) { (-9 - 2 * x - 7 * z) / 10 }
znp1 <- function (x, y) { (-20 - 2 * x - 7 * y) / 21  }

# convenient wrapper function
# f: the function called
# p1: the first parameter of f
# p2: the second parameter of f
# value: our variable value
omega <- 1.1
wrapper <- function (f, p1, p2, value) { omega * f(p1, p2) + (1 - omega) * value }

# call wrapper with each function
xnp1W <- function (x, y, z) { wrapper(xnp1, y, z, x) }
ynp1W <- function (x, y, z) { wrapper(ynp1, x, z, y) }
znp1W <- function (x, y, z) { wrapper(znp1, x, y, z) }

# THIS IS A COPY OF THE GAUSS-SEIDEL CODE, I ONLY MODIFIED
# THE FUNCTION CALLED
n <- 3
A <- matrix(c(4,2,2,2,10,7,2,7,21), nrow = n, ncol = n, byrow = TRUE)
b <- c(12,-9,-20)
k <- 0
Xk <- rep(0, each = n)
e <- matrix(rep(0.001, each = n))

repeat {
  # change the function called and their arguments
  Xk[1] <- xnp1W(x = Xk[1], y = Xk[2], z = Xk[3])
  Xk[2] <- ynp1W(x = Xk[1], y = Xk[2], z = Xk[3])
  Xk[3] <- znp1W(x = Xk[1], y = Xk[2], z = Xk[3])

  r <- abs((A %*% Xk) - b)
  if (sum(r < e) == 3) {
    cat("End: k=", k, "\n");
    cat("The result is\n")
    cat(Xk, "\n")
    break;
  }
  k <- k +1
}
```

The result is almost the same as for GAUSS-SEIDEL.

```r
# End: k= 6
# The result is
# 4.000032 -1.000037 -0.9999943
```

<hr class="sr">

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
  * omega > 0 and < 1: Jacobi
  * omega = 1: Gauss-Seidel
  * omega > 1: SOR
* x, the result, after k iterations
* D, a diagonal matrix
* L, an upper triangular matrix, multiplied by -1
* U, a lower triangular matrix, multiplied by -1

And, we must have **A = D - L - U** <span class="tms">(you may see **A = D + L + U** too, but the formula for $x^{(k+1)}$ is is different)</span>.