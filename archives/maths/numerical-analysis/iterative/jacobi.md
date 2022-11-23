# Jacobi

[Go back](../index.md)

In the Jacobi method, the formula is based on two parts that you can evaluate first, and then at each iteration, you have to multiply your $X$ by the first part and add the second part.

<div>
\[
X^{(k+1)}
\Leftrightarrow D^{-1} * (L + U) * X^{(k)} + D^{-1} * b
\]
</div>

We got

* **PART1**: $D^{-1} * (L + U)$
* **PART2**: $D^{-1} * b$

<hr class="sr">

## Jacobi in R

```r
# ...
##################################
# Complete here: add new variables
##################################
D.inv <- solve(D)
PART1 <- D.inv %*% (L + U)
PART2 <- D.inv %*% b 

repeat {
	# update our vector of values
	Xk <- PART1 %*% Xk + PART2
    # ...
}
```

```r
# End: k= 22 
# The result is
# 3.999955 -1.000037 -1.000024
```