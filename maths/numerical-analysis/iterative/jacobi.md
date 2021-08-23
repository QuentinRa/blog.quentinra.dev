# Jacobi

[Go back](../index.md)

In the Jacobi method, given a starting point $X^{(0)}$ (usually a vector of zeros), you will solve each equation with this point. You will get a new point, and start again.

<hr class="sl">

## Using a table

We are solving the system saw previously using **Jacobi**
method.

* $x_{n+1}(x, y, z) = \frac{12 - 2 * y - 2 * z}{4}$
* $y_{n+1}(x, y, z) = \frac{-9 - 2 * x - 7 * z}{10}$
* $z_{n+1}(x,y,z) = \frac{-20 - 2 * x - 7 * y}{21}$

We are using a vector a zeros as the default value but I think in some cases you can start with something else. As we got 3 variables, our starting point is $X = (0,0,0)$.

| var | i=0 | i=1 | i=2 | ... | $i\ge41$ |
| ------ | ------ | ------ | ------ | ------ | ------ |
| x | $x^{(0)} = 0$ | $X = (0,0,0)$ <br> $x^{(1)} = 3$ | $X = (3,-0.9,-0.95)$ <br> $x^{(2)} = 3.925$ | ... | $X = (?,?,?)$ <br> $x^{(41)} = 4$ |
| y | $y^{(0)} = 0$ | $X = (0,0,0)$ <br> $y^{(1)} = -0.9$ | $X = (3,-0.9,-0.95)$ <br> $y^{(2)} = -0.835$ | ... | $X = (?,?,?)$ <br> $x^{(41)} = -1$ |
| z | $z^{(0)} = 0$ | $X = (0,0,0)$ <br> $z^{(1)} = -0.95$ | $X = (3,-0.9,-0.95)$ <br> $z^{(2)} = -0.938$ | ... | $X = (?,?,?)$ <br> $x^{(41)} = -1$ |

<hr class="sr">

## Code this in R

Here how you could see this in R code. You should check
the convergence instead of doing ``n=10`` iterations.

```r
xnp1 <- function (x, y, z) { (12 - 2 * y - 2 * z) / 4  }
ynp1 <- function (x, y, z) { (-9 - 2 * x - 7 * z) / 10 }
znp1 <- function (x, y, z) { (-20 - 2 * x - 7 * y) / 21  }

# initial values
n <- 3 # 3x3
A <- matrix(c(4,2,2,2,10,7,2,7,21), nrow = n, ncol = n, byrow = TRUE)
b <- c(12,-9,-20)

# vector of 0
k <- 0
Xk <- rep(0, each = n)
# vector of 0.001
e <- matrix(rep(0.001, each = n))

repeat {
	# update our vector of values
	Xk <- c(
		xnp1(Xk[1], Xk[2], Xk[3]),
		ynp1(Xk[1], Xk[2], Xk[3]),
		znp1(Xk[1], Xk[2], Xk[3])
	)

	r <- abs((A %*% Xk) - b)
	# each absolute value of R is lesser than 0.001
	if (sum(r < e) == 3) {
		cat("End: k=", k, "\n");
		cat("The result is\n")
		cat(Xk)
		break;
	}
	k <- k +1
}
```

The result is almost the exact value of $X = (4,-1,-1)$. The more we decrease epsilon, the more the result is converging. 

```r
# End: k= 22
# The result is
# 3.999955 -1.000037 -1.000024
```

<hr class="sl">

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
writing a formula, some are using plus instead of minus, but we multiplied L and U by $-1$.