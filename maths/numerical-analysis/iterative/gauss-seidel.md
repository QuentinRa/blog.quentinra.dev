# Gauss-seidel

[Go back](../index.md)

Everything is the same as in Jacobi method so things won't
be as explained. The only difference is that in Jacobi,

* when evaluating x,y,z,... at iteration ``i``
* we used x,y,z,... values from the previous iteration
* but **now** we are using the last recent value
of our variable, meaning that If we just calculated x
then we will use this value otherwise we are using
the value of the previous iteration.

<table class="table table-bordered">
    <thead>
        <tr>
            <th>var</th>
            <th>i = 0</th>
            <th>i = 1</th>
            <th>i = 2</th>
            <th>...</th>
        </tr>
    </thead>
    <tbody>
        <tr>
            <td>x</td>
            <td>0</td>
            <td>xn+1(0,0,0) = -0.20</td>
            <td>xn+1(-0.20,0.15,-0.50) = 0.17</td>
            <td>...</td>
        </tr>
        <tr>
            <td>y</td>
            <td>0</td>
            <td>yn+1(-0.20,0,0) = 0.15</td>
            <td>...</td>
            <td>...</td>
        </tr>
        <tr>
            <td>z</td>
            <td>0</td>
            <td>zn+1(-0.20,0.15,0) = -0.50</td>
            <td>...</td>
            <td>...</td>
        </tr>
    </tbody>
</table>

<hr class="sr">

## Code this in R

Here how you could see this in R code. You should check
the convergence instead of doing ``n=10`` iterations.

```r
# our functions
xnp1 <- function (y, z) { (-1 + 2 * y - 3 * z) / 5  }
ynp1 <- function (x, z) { (2 + 3 * x - z ) / 9 }
znp1 <- function (x, y) { (3 - 2 * x + y) / -7  }

# initial values
v <- c(0, 0, 0)

# iterates
for (i in 0:10) {
  # use previous y and z
  v[1] <- xnp1(y = v[2], z = v[3])
  # use changed x and last z
  v[2] <- ynp1(x = v[1], z = v[3])
  # use changed x,y
  v[3] <- znp1(x = v[1], y = v[2])
  print(v)
}
```

<hr class="sl">

## More theoretically

Gauss-seidel formula is
<div>
  \[
    \displaylines{
      \begin{align}\begin{aligned}
    x^{k+1} = (D-L)^{-1} * (b + U * x^{k})
    \end{aligned}\end{align}
    }
  \]
</div>

with

* b, that's the b in Ax=b
* x, the result, after k iterations
* D, a diagonal matrix
* L, a upper triangular matrix, multiplied by -1
* U, a lower triangular matrix, multiplied by -1

In other words, **A = D - L - U**. Beware of this before
writing a formula, some are using plus instead of minus.