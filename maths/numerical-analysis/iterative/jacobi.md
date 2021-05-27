# Jacobi

[Go back](../index.md)

We are solving the system saw previously using ``Jacobi``
method.

* <span>
    \(
        x_{n+1}(x, y, z) = \frac{-1 + 2 * y - 3 * z}{5}
    \)</span>
* <span>
    \(
        y_{n+1}(x, y, z) = \frac{2 + 3 * x - z}{9}
    \)</span>
* <span>
    \(
        z_{n+1}(x,y,z) = \frac{3 - 2 * x + y}{-7}
    \)</span>

We are using a vector a zeros as default value but I think
in some cases you can start with something else.

<table class="table table-bordered">
    <thead>
        <tr>
            <th>var</th>
            <th>i = 0</th>
            <th>i = 1</th>
            <th>i = 2</th>
            <th>i = 3</th>
            <th>...</th>
        </tr>
    </thead>
    <tbody>
        <tr>
            <td>x</td>
            <td>0</td>
            <td>xn+1(0,0,0) = -0.20</td>
            <td>xn+1(-0.2,0.22,-0.43) = 0.15</td>
            <td>xn+1(0.15,0.2,-0.52) = 0.19</td>
            <td>...</td>
        </tr>
        <tr>
            <td>y</td>
            <td>0</td>
            <td>yn+1(0,0,0) = 0.22</td>
            <td>yn+1(-0.2,0.22,-0.43) = 0.2</td>
            <td>yn+1(0.15,0.2,-0.52) = 0.33</td>
            <td>...</td>
        </tr>
        <tr>
            <td>z</td>
            <td>0</td>
            <td>zn+1(0,0,0) = -0.43</td>
            <td>zn+1(-0.2,0.22,-0.43) = -0.52</td>
            <td>zn+1(0.15,0.2,-0.52) = -0.42</td>
            <td>...</td>
        </tr>
    </tbody>
</table>

We can do it a lot of times but when we are seing that values
tend to converge, here (i=10) to

* x = 0.186
* y = 0.33
* z = -0.422

so we can stop.

## Code this in R

Here how you could see this in R code. You should check
the convergence instead of doing ``n=10`` iterations.

```r
# our functions
xnp1 <- function (x, y, z) { (-1 + 2 * y - 3 * z) / 5  }
ynp1 <- function (x, y, z) { (2 + 3 * x - z ) / 9 }
znp1 <- function (x, y, z) { (3 - 2 * x + y) / -7  }

# initial values
v <- c(0, 0, 0)

# iterates for i in [0, 10]
for (i in 0:10) {
  # update our vector of values
  v <- c(
    xnp1(v[1], v[2], v[3]),
    ynp1(v[1], v[2], v[3]),
    znp1(v[1], v[2], v[3])
  )
  print(v)
}
```

## More theoretically

Jacobi formula is
<div>
  \[
    \displaylines{
      \begin{align}\begin{aligned}
    x^{k+1}
    \Leftrightarrow D^{-1} * (L + U) * x^k + D^{-1} * b
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