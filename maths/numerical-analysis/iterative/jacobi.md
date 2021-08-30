# Jacobi

[Go back](../index.md)

In the Jacobi method, you will be given a starting point $X^{(0)}$ which is usually a vector of zeros. You will solve each equation with this point, and get a new point $X^{(1)}$. Then you will iterate again and again, until you got a "good enough" result.

<hr class="sl">

## Using a table

We are using a vector of zeros for our starting point is $X^{(0)} = (0,0,0)$. As a remember, we had

* $x^{(k)} = \frac{12 - 2 * y - 2 * z}{4}$
* $y^{(k)} = \frac{-9 - 2 * x - 7 * z}{10}$
* $z^{(k)} = \frac{-20 - 2 * x - 7 * y}{21}$

| var | i=0 | i=1 | i=2 | ... | $i\ge41$ |
| ------ | ------ | ------ | ------ | ------ | ------ |
| x | $x^{(0)} = 0$ | $X^{(0)} = (0,0,0)$ <br> $x^{(1)} = 3$ | $X^{(1)} = (3,-0.9,-0.95)$ <br> $x^{(2)} = 3.925$ | ... | $X^{(40)} = (?,?,?)$ <br> $x^{(41)} = 4$ |
| y | $y^{(0)} = 0$ | $X^{(0)} = (0,0,0)$ <br> $y^{(1)} = -0.9$ | $X^{(1)} = (3,-0.9,-0.95)$ <br> $y^{(2)} = -0.835$ | ... | $X^{(40)} = (?,?,?)$ <br> $x^{(41)} = -1$ |
| z | $z^{(0)} = 0$ | $X^{(0)}  = (0,0,0)$ <br> $z^{(1)} = -0.95$ | $X^{(1)} = (3,-0.9,-0.95)$ <br> $z^{(2)} = -0.938$ | ... | $X^{(40)} = (?,?,?)$ <br> $x^{(41)} = -1$ |

We got $X^{(41)} = (4, -1, -1)$ which is the solution we wanted.

<hr class="sr">

## Jacobi in R

Here is how you could see this in R code. We are checking the convergence with $\epsilon = 0.001$.

```r
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
	Xk <- c(
		xk(y = Xk[2], z = Xk[3]),
		yk(x = Xk[1], z = Xk[3]),
		zk(x = Xk[1], y = Xk[2])
	)

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
    x^{(k+1)}
    \Leftrightarrow D^{-1} * (L + U) * x^{(k)} + D^{-1} * b
    \end{aligned}\end{align}
    }
  \]
</div>

with

* b, that's the b in Ax=b
* x, the result, after k iterations
* D, a diagonal matrix
* L, an upper triangular matrix, multiplied by -1
* U, a lower triangular matrix, multiplied by -1

And, we must have **A = D - L - U** <span class="tms">(you may see **A = D + L + U** too, but the formula for $x^{(k)}$ is different)</span>.