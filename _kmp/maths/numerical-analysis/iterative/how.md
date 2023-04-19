# How we will do

[Go back](../index.md)

Jacobi, Gauss-Seidel, and SOR are almost the same. We will have to rewrite your matrix $A$ in 3 matrices, which are either diagonal matrices or triangular matrices.

* $A = D - L - U$
* $A$ is our matrix
* $D$ is a diagonal matrix with the coefficients on the diagonal of $A$
* $L$ is a lower triangular matrix, with the coefficient below the diagonal of $A$, **multiplied by -1**
* $U$ is an upper triangular matrix, with the coefficient above the diagonal of $A$, **multiplied by -1**

This is as easy as you could guess, we had

<div>
\[
A = \begin{pmatrix}4&2&2\\2&10&7\\2&7&21\\\end{pmatrix}
\quad
b = \begin{pmatrix}12\\-9\\-20\\\end{pmatrix}
\]
</div>

So we have

<div>
\[
D = \begin{pmatrix}4&0&0\\0&10&0\\0&0&2\\\end{pmatrix}
\quad
L = \begin{pmatrix}0&0&0\\-2&0&0\\-2&-7&0\\\end{pmatrix}
\quad
U = \begin{pmatrix}0&-2&-2\\0&0&-7\\0&0&0\\\end{pmatrix}
\]
</div>

We will always be starting with $X^{(0)} = (0,0,0)$, since we weren't given a starting value, and we will try to get $X^{(k)} \approx^{\epsilon=0.001} (4,-1,-1)$.

<hr class="sl">

## Code in R

As the code is quite similar, every method will be completing this sample of code

```r
# initialization of our variables
# our matrix
A <- matrix(c(4,2,2,2,10,7,2,7,21), nrow = 3, ncol = 3)
# DLU
D <- diag(c(4,10,21))
U <- matrix(-c(0,0,0,2,0,0,2,7,0), 3, 3)
L <- matrix(-c(0,2,2,0,0,7,0,0,0), 3, 3)
# X^{(0)}
Xk <- c(0,0,0)
# b
b <- c(12,-9,-20)
# AX-b should be lesser than a vector a epsilon 0.001
e <- matrix(rep(0.001, each = 3))
k <- 0
##################################
# Complete here: add new variables
##################################

repeat {
	# update our vector of values with the formula
	Xk <- ###### COMPLETE HERE ########### 

    # checking if the result is near enough of the real result
	r <- abs((A %*% Xk) - b)
	# each absolute value of R is lesser than 0.001
	if (sum(r < e) == 3) {
		# print
		cat("End: k=", k, "\n");
		cat("The result is\n")
		cat(Xk, "\n")
		break;
	}
	k <- k +1
}
```

<hr class="sr">

## Side note

Some of you may have seen $A = D + L + U$ instead of $A = D - L - U$, this isn't wrong, but every formula will be different from the one here. I will use minus as it's the one my teacher is using.