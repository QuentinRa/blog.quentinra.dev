# Cramer's rule

[Go back](../index.md)

Also called Cramer's formula.

<hr class="sl">

## About

* **Requirements**

The matrix must be invertible ($det(A) \neq 0$).

* **Complexity**

This is **the worst of the worst** (maybe not, but...). For a matrix $A_n$, we are making $n$ times more operations than in the GAUSS method, since we are evaluating $n+1$ determinants. Additionally, we have to calculate $n$ divisions.

<hr class="sr">

## Process

* calculate the determinant $d$ of $A$
  * for a 1x1 matrix, it's $a$
  * for a 2x2 matrix, it's $ad-bc$
  * you may refer to matrix course if you don't remember
* then for each column of your matrix $A$
  * replace a column with the vector $b$
  * evaluates determinant, $d_x$ if you replaced the column of the variable $x$
  * then $x$ value would be $\frac{d_x}{d}$

<hr class="sl">

## Example

For a 3x3 matrix $A$,

<div>
\[
A = \begin{pmatrix}
4 & 2 & 2 \\
2 & 10 & 7 \\
2 & 7 & 21 \\
\end{pmatrix}
\quad
b = \begin{pmatrix}
12 \\
-9 \\
-20 \\
\end{pmatrix}
\]
</div>

we will have $4$ determinants,

* $det(A) = 4 * (10\*21 - 7\*7)- 2 * (2\*21 - 2\*7) + 2 * (2\*7 - 2*10) = 576$
* $det(A_x) = 12 * (10\*21 - 7\*7) + 9 * (2\*21 - 2\*7) - 20 * (2\*7 - 2*10) = 2304$
* $det(A_y) = 4 * (-9\*21 - 7\*-20)- 2 * (12\*21 - 2\*-20) + 2 * (12\*7 - 2*-9) = -576$
* $det(A_z) = 4 * (10\*-20 + 9\*7)- 2 * (2\*-20 - 12\*7) + 2 * (2\*-9 - 12*10) = -576$

Hence, we have

* $x = \frac{2304}{576} = 4$
* $y = \frac{-576}{576} = -1$
* $z = \frac{-576}{576} = -1$
* So $X = (4,-1,-1)$

<hr class="sr">

## Cramer's rule in R

I made this function

```r
A <- matrix(c(4,2,2,2,10,7,2,7,21), nrow = 3, ncol = 3, byrow = TRUE)
b <- c(12,-9,-20)

cramer.solve <- function (A, b) {
	# checks
	if (dim(A)[1] != dim(A)[2]) stop("A must be a square matrix")
	if (length(b) != dim(A)[1]) stop("b's length must be equals to the A's length")

	n <- dim(A)[1]
	# exit if n is invalid
	if (n == 0) return(NULL)

	# starting
	X <- NULL
	d <- det(A)

	for (i in 1:n) {
		# making a copy to make things easier
		copy <- A
		# replace the column
		copy[,i] <- b
		# add the result to our vector
		X <- c(X, det(copy) / d)
	}
	return(x)
}

cramer.solve(A, b)
```