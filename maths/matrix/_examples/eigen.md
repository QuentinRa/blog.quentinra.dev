# Eigendecomposition example

Let's look for the eigendecomposition of $A$

<div class="overflow-auto">
\[
\begin{split}
A = 
\begin{pmatrix}
1&2\\
2&4\end{pmatrix}
\end{split}
\]
</div>

```r
A <- matrix(c(1,2,2,4), nrow = 2)
```

<hr class="sl">

## Step 1

Calculate $X = \lambda{I_n}-A_n$

<div class="overflow-auto">
\[
X = \begin{split}\begin{pmatrix}\lambda & 0 \\0 & \lambda \end{pmatrix}
− \begin{pmatrix}1&2\\2&4\end{pmatrix}
=
\begin{pmatrix}
\lambda-1 & -2 \\
-2 & \lambda -4
\end{pmatrix}\end{split}
\]
</div>

<hr class="sr">

## Step 2

Solve $det(\lambda{I_n}-A_n) = 0$. We know that $det(A_2) = ad-bc$, so we have

<div class="overflow-auto">
\[
\begin{split}
det(X) = (\lambda-1) * (\lambda -4) - (-2*-2) = 0
\\ \Leftrightarrow
\lambda^2 -4\lambda - \lambda +4  -4
\\ \Leftrightarrow
\lambda^2 - 5\lambda 
\\ \Leftrightarrow
(\lambda -0)(\lambda - 5)
\end{split}
\]
</div>

We got $\lambda_1=0$ and $\lambda_2=5$.

```r
eigen(A)$values
# [1] 5 0
# ok
```

<hr class="sl">

## Step 3 ($\lambda_0$)

<div class="overflow-auto">
\[
\begin{split}\begin{cases}
1x + 2y = 0x\\
2x + 4y = 0y
\end{cases}
=^{collinearity}
\begin{cases}
1x + 2y = 0\\
\end{cases}
=
\begin{cases}
x = -2y\\
\end{cases}\end{split}
\]
</div>

The first eigenvector is

<div>
\[
\begin{pmatrix}-2\alpha \\1\alpha \end{pmatrix}
\]
</div>

```r
gaussianElimination(A-0*diag(2), c(0,0))
#     [,1] [,2] [,3]
# [1,]    1    2    0
# [2,]    0    0    0
```

<hr class="sr">

## Step 3 ($\lambda_1$)

<div class="overflow-auto">
\[
\begin{split}\begin{cases}
1x + 2y = 5x\\
2x + 4y = 5y
\end{cases}
=
\begin{cases}
-4x + 2y = 0\\
2x + -1y = 0
\end{cases}
=^{collinearity}
\begin{cases}
2x + -1y = 0
\end{cases}
=
\begin{cases}
2x = y
\end{cases}
=
\begin{cases}
x = \frac{y}{2}
\end{cases}
\end{split}
\]
</div>

The second eigenvector is

<div>
\[
\begin{pmatrix}0.5\alpha \\1\alpha \end{pmatrix}
\]
</div>

```r
gaussianElimination(A-5*diag(2), c(0,0))
#     [,1] [,2] [,3]
# [1,]    1 -0.5    0
# [2,]    0  0.0    0
```

<hr class="sl">

## Step 4

We can create $P$

<div class="overflow-auto">
\[
\begin{split}P = 
\begin{pmatrix}
-2&0.5\\
1&1
\end{pmatrix}
\end{split}
\]
</div>

```r
P <- matrix(c(-2,1,0.5,1), 2)
```

<hr class="sr">

## Step 5

We solve $P^{-1}$

<div class="overflow-auto">
\[
\begin{split}
\begin{pmatrix}-2&0.5&  | & 1 & 0 \\1&1 & | & 0 & 1\end{pmatrix}
\Leftrightarrow^{L1  \leftarrow -0.5 L1}
\begin{pmatrix}1&-0.25&  | & -0.5 & 0 \\1&1 & | & 0 & 1\end{pmatrix}
\\\Leftrightarrow^{L2  \leftarrow L2 - L1}
\begin{pmatrix}1&-0.25&  | & -0.5 & 0 \\0&1.25 & | & 0.5 & 1\end{pmatrix}
\Leftrightarrow^{L2  \leftarrow 0.8 * L2}
\begin{pmatrix}1&-0.25&  | & -0.5 & 0 \\0&1 & | & 0.4 & 0.8\end{pmatrix}
\\\Leftrightarrow^{L1  \leftarrow L1 + 0.25 * L2}
\begin{pmatrix}1&0&  | & -0.4 & 0.2 \\0&1 & | & 0.4 & 0.8\end{pmatrix}
\end{split}
\]
</div>

```r
P.inv <- solve(P)
#      [,1] [,2]
# [1,] -0.4  0.2
# [2,]  0.4  0.8

# check
identical(P %*% P.inv, diag(2))
# [1] TRUE
```

<hr class="sl">

## Step 6

We can create $A^n$

<div class="overflow-auto">
\[
\begin{split}A^n=PD^nP^{-1}=\begin{pmatrix}-2&0.5\\1&1\end{pmatrix} * \begin{pmatrix}0^n&0\\0&5^n\end{pmatrix}
* \begin{pmatrix}-0.4 & 0.2 \\0.4 & 0.8\end{pmatrix}\end{split}
\]
</div>

```r
D <- matrix(c(0,0,0,5), 2)

identical(A, P %*% D^1 %*% P.inv)
# [1] TRUE
identical(A %*% A, P %*% D^2 %*% P.inv)
# [1] TRUE
identical(A %*% A %*% A, P %*% D^3 %*% P.inv)
# [1] TRUE
```