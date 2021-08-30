# Gauss-seidel

[Go back](../index.md)

The Gauss-Seidel method is very similar to the Jacobi method, but you don't way the end of the iteration to update, and use the new $X$.

<hr class="sl">

## Using a table

We are using a vector of zeros for our starting point is $X^{(0)} = (0,0,0)$. As a remember, we had

* $x^{(k+1)} = \frac{12 - 2 * y - 2 * z}{4}$
* $y^{(k+1)} = \frac{-9 - 2 * x - 7 * z}{10}$
* $z^{(k+1)} = \frac{-20 - 2 * x - 7 * y}{21}$

| var | i=0 | i=1 | i=2 | ... | $i\ge10$ |
| ------ | ------ | ------ | ------ | ------ | ------ |
| x | $x^{(0)} = 0$ | $X^{(0)} = (0,0,0)$ <br> $x^{(1)} = 3$ | $X^{(1)} = (3, -1.5, -0.738)$ <br> $x^{(2)} = 4.119$ | ... | $X^{(9)} = (?,?,?)$ <br> $x^{(10)} = 4$ |
| y | $y^{(0)} = 0$ | $X^{(0)} = (3,0,0)$ <br> $y^{(1)} = -1.5$ | $X^{(1)} = (4.119, -1.5, -0.738)$ <br> $y^{(2)} = -1.207$ | ... | $X^{(9)} = (4,?,?)$ <br> $x^{(10)} = -1$ |
| z | $z^{(0)} = 0$ | $X^{(0)} = (3,-1.5, 0)$ <br> $z^{(1)} = -0.738$ | $X^{(1)} = (4.119, -1.207, -0.738)$ <br> $z^{(2)} = -0.9428$ | ... | $X^{(9)} = (4,-1,?)$ <br> $x^{(10)} = -1$ |

Again, we got $X^{(10)} = (4,-1,-1)$, but this time we only made 10 iterations for the result to converge.

<hr class="sr">

## Gauss-seidel in R

Here is how you could see this in R code. We are checking the convergence with $\epsilon = 0.001$.

```r
# our functions
xk <- function (y, z) { (12 - 2 * y - 2 * z) / 4  }
yk <- function (x, z) { (-9 - 2 * x - 7 * z) / 10 }
zk <- function (x, y) { (-20 - 2 * x - 7 * y) / 21  }

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
	# use previous y and z
	Xk[1] <- xk(y = Xk[2], z = Xk[3])
	# use changed x and last z
	Xk[2] <- yk(x = Xk[1], z = Xk[3])
	# use changed x,y
	Xk[3] <- zk(x = Xk[1], y = Xk[2])

	r <- abs((A %*% Xk) - b)
	# each absolute value of R is lesser than 0.001
	if (sum(r < e) == 3) {
		cat("End: k=", k, "\n");
		cat("The result is\n")
		cat(Xk, "\n")
		break;
	}
	k <- k +1
}
```

The result is almost the exact value of $X = (4,-1,-1)$. The more we decrease epsilon, the more the result is converging.

```r
# End: k= 6
# The result is
# 4.000196 -1.000071 -0.9999951
```

<hr class="sl">

## More theoretically

Gauss-seidel formula is
<div>
  \[
    \displaylines{
      \begin{align}\begin{aligned}
    X^{(k+1)} = (D-L)^{-1} * (b + U * X^{(k)})
    \end{aligned}\end{align}
    }
  \]
</div>

with

* b, that's the b in Ax=b
* $X^{(k)}$: the result, after k iterations
* D, a diagonal matrix
* L, an upper triangular matrix, multiplied by -1
* U, a lower triangular matrix, multiplied by -1

And, we must have **A = D - L - U** <span class="tms">(you may see **A = D + L + U** too, but the formula for $X^{(k+1)}$ is is different)</span>.

<hr class="sr">

## Example using the theory

Using the code we wrote for the Jacobi method,


```r
# ... cf Jacobi ...
# evaluated once
DL.inv <- solve(D - L)

repeat {
    # we are only changing this line
	Xk <- DL.inv %*% (b + U %*% Xk)
	# ... cf Jacobi ...
}
```