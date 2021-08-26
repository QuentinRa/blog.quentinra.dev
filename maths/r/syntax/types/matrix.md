# Matrix

[Go back](../../index.md)

This is the same as a matrix in Math. This is a vector of vectors. The function is `matrix(data, nrow, ncol)`.

```r
matrix(1:6, nrow = 2, ncol = 3)
#       [,1] [,2] [,3]
# [1,]    1    3    5
# [2,]    2    4    6

matrix(1:6, nrow = 2, ncol = 3, byrow = T)
#       [,1] [,2] [,3]
# [1,]    1    2    3
# [2,]    4    5    6
```

<hr class="sl">

## Indexes

This is the same as for vectors, but you got two indexes separated by a comma `,`. The format is `[line, column]`. If you omit one, then the whole line/column will be returned (or the whole matrix if both are omitted).

```r
m[,] # whole matrix
m[1,] # first line
m[,1] # first column
m[1,1] # value at 1,1 (first line, first column)
```

Sometimes, you will have to use `m[i,j,drop=FALSE]` because R is dereferencing your matrix to a vector.

<hr class="sr">

## Functions

* `t(m)`: transpose
* `solve(m)`: inverse a matrix
* `solve(A,b)`: solve $Ax=b$
* `diag(...)`: create a diagonal matrix
* `m1 %*% m2`: scalar product
* `eigen(m)`: eigenvalues

<hr class="sl">

## Utilities

* `dim(m)`: dimension
* `ncol(m)`: number of columns
* `nrow(m)`: number of rows
* `cbind(vector1, matrix1, matrix2, vector2, ...)`: merge into one matrix (left to right)
* `rbind(matrix1, matrix2, vector1, vector2, ...)`: merge into one matrix (top to bottom)
* `dimnames(m)`: column/rows names
* `colnames(m)`: column names
* `rownames(m)`: rows names

As you should remember, you can override the values by placing them at the left side of the operator `<-`.

```r
y <- 1:9
# a vector
# [1] 1 2 3 4 5 6 7 8 9

# a vector with a dimension is a matrix
dim(y) <- c(3,3)
y
#     [,1] [,2] [,3]
# [1,]  1    4    7
# [2,]  2    5    8
# [3,]  3    6    9
```