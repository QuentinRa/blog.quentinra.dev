# Successive over-relaxation (SOR)

[Go back](../index.md)

Everything is the same as in GAUSS-seidel
method so things won't be as explained. 
The only difference is that in SOR,
we are modifying our functions
``xn+1``, ...

The rest is the same as with GAUSS-seidel.
We are setting a variable omega to 1.1. This value
may be given but if not I read that 1.1 is a good value.

So we must rewrite our functions like this
for x1 function ``xn+1``

<p>
\[
x_{n+1}' = \omega * x_{n+1} + (1 - \omega) * x1
\]
</p>

So the idea is that we simply multiply by omega
and add one minus omega multiplied by our variable value.

## Code in R

Here how you could see this in R code. You should check
the convergence instead of doing ``n=10`` iterations.

```r
# our functions
xnp1 <- function (y, z) { (-1 + 2 * y - 3 * z) / 5  }
ynp1 <- function (x, z) { (2 + 3 * x - z ) / 9 }
znp1 <- function (x, y) { (3 - 2 * x + y) / -7  }

# convenient wrapper function
# f : function called
# p1 : first parameter of f
# p2 : second parameter of f
# value : our variable value
wrapper <- function (f, p1, p2, value) { 1.1 * f(p1, p2) + (1 - 1.1) * value }

# call wrapper with each function
xnp1W <- function (x, y, z) { wrapper(xnp1, y, z, x) }
ynp1W <- function (x, y, z) { wrapper(ynp1, x, z, y) }
znp1W <- function (x, y, z) { wrapper(znp1, x, y, z) }

# initial values
v <- c(0, 0, 0)

# iterates
for (i in 0:10) {
  # use previous y and z
  v[1] <- xnp1W(x = v[1], y = v[2], z = v[3])
  # use changed x and last z
  v[2] <- ynp1W(x = v[1], y = v[2], z = v[3])
  # use changed x,y
  v[3] <- znp1W(x = v[1], y = v[2], z = v[3])
  print(v)
}
```

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