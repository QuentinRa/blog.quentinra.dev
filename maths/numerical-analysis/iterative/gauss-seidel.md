# Gauss-Seidel

[Go back](../index.md)

The Gauss-Seidel method is a particular case of SOR, where omega is 1. This time, you can only evaluate one part before starting, but we got the result is fewer steps. The Gauss-Seidel formula is

<div>
\[
X^{(k+1)} = (D-L)^{-1} * (b + U * X^{(k)})
\]
</div>

with

* **PART1**: $(D-L)^{-1}$

<hr class="sr">

## Gauss-Seidel in R

```r
# ...
##################################
# Complete here: add new variables
##################################
PART1 <- solve(D - L)

repeat {
	# update our vector of values with the formula
	Xk <- PART1 %*% (b + U %*% Xk)
	# ...
}
```

```r
# End: k= 6
# The result is
# 4.000032 -1.000037 -0.9999943
```