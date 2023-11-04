# GAUSS elimination

[Go back](../index.md#matrix-inversion)

You will use GAUSS like you always did, but you will work on two matrices. Given your matrix $A_n$, you will have to reduce it so that it becomes $I_n$. While, at the same time, repeating every step you did on $A$, on a matrix $I_n$, which will result in $A^{-1}$.

<hr class="sl">

## Code in R

```r
library('MASS') # fractions

A <- matrix(c(3,2,1,-2,-4,8,4,5,2), nrow = 3, ncol = 3)

# solve and convert to fractions
fractions(solve(A))
#     [,1]   [,2]   [,3]  
# [1,]   8/11  -6/11  -1/11
# [2,]  -1/66  -1/33   7/66
# [3,] -10/33  13/33   4/33
```
