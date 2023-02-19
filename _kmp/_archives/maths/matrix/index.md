# Introduction

A matrix is like an Excel table. You got columns, rows, and values. When we have a system of equations, we can easily create a matrix from it, and use methods such as GAUSS to solve the system.

We are writing $A_{n,p}$ a matrix of $n$ lines and $p$ columns. The value at the $i$-nth line and the $j$-nth column is written $a_{ij}=a_{i,j}$. The coefficients are starting from 1.

<div class="overflow-auto">
\[
\begin{split}A=\ A_{n,p}=\ A_{np}=\ \begin{pmatrix}
\ a_{1,1} & \cdots & a_{1, p-1} \\
\vdots  & \cdots & \vdots  \\
\ a_{n-1,1} & \cdots & a_{n-1, p-1}
\end{pmatrix}\end{split}
\]
</div>

<details>
<summary>In <b>R</b>, you can create a matrix like this</summary>

```r
# THE GOAL
#       [,1] [,2] [,3]
# [1,]    1    0    0
# [2,]    0    1    0
# [3,]    0    0    1

# special method since the matrix is special
diag(3)
# more generaly (since n=p, ommit p)
matrix(c(1,0,0,0,1,0,0,0,1), 3)
# same as (set p, useless here)
matrix(c(1,0,0,0,1,0,0,0,1), n = 3, p = 3)
# same as (byrow instead of bycolumn)
matrix(c(1,0,0,0,1,0,0,0,1), 3, 3, byrow = T)

# a (i=2, j=2)
A[2, 2]
# 1
```
</details>

<hr class="sl">

## Linear System

A linear system is a set of equations that can be solved together. Solving one will give you the value of one variable, that you can use to solve another one until you solved everything.

What's convenient is that you can use a matrix for that because the GAUSS method (and a lot of other methods in Numerical analysis) needs a matrix. The rules are that the values in the matrix are the coefficient between the variables ($0$ if not found, $1$ if $x$ or $n$ if $n * x$). The last column is the vector $b$ made with the values after the equals (`second membre`).

* [Example (by yourself)](linear-system/example.md)
* [Example (in R)](linear-system/example-r.md)

<hr class="sr">

## Named matrices

In French, we will call these `Matrices remarquables`.

The matrix **you must remember** is called **Identity matrix** (`Matrice identité`) $Id_n$ or $I_n$. This is a diagonal matrix having $1$ on the diagonal, which mean we have $A_n * Id_n = Id_n * A_n = A_n$. In **R**, you can create it with `diag(n)`.

<table class="table table-striped border-dark table-bordered table-responsive">
<thead>
<tr>
<th>Zero matrix $O_{np}$</th>
<th>Square matrix $A_{n}$</th>
<th>Diagonal matrix $D_{n}$</th>
<th>Conjugate transpose $A^*$</th>
</tr>
</thead>
<tbody>
<tr>
<td>

`Matrice nulle` <br>
All values are zero. <br>
<div>
\[
O_{1,2}=\ \begin{pmatrix}
0&0
\end{pmatrix}
\]
</div>
</td>
<td>

`Matrice carré` <br>
We must have $i=j$. <br>
<div>
\[
A_{2}=\ \begin{pmatrix}
1&2\\
3&4\\
\end{pmatrix}
\]
</div>
</td>
<td>

`Matrice diagonale` <br>
Zero-Matrix with non-zero values on the diagonal. <br>
<div>
\[
D_{2}=\ \begin{pmatrix}
1&0\\
0&4\\
\end{pmatrix}
\]
</div>

In **R**, call `diag(c(1,4))`.
</td>
<td>

`Matrice conjuguée` <br>
Change the sign before the complex value $i$. <br>
If there are no complex values, then do the
transpose.

</td>
</tr>
</tbody>
</table>

<table class="table table-striped border-dark table-bordered table-responsive">
<thead>
<tr>
<th>Transpose matrix $A^{T}$</th>
<th>Vector $A_{1,n}/A_{n,1}$</th>
<th>
Hermitian matrix ($\mathbb{C}$)<br>
Symmetric matrix ($\mathbb{R}$)
</th>
<th>
Unitary matrix ($\mathbb{C}$)<br>
Orthogonal matrix ($\mathbb{R}$)
</th>
</tr>
</thead>
<tbody>
<tr>
<td>

`Matrice transposée` <br>
Rows become columns. <br>
<div class="overflow-auto">
\[
A=\ \begin{pmatrix}
1&2
\end{pmatrix}
\quad
A^T=\ \begin{pmatrix}
1\\2
\end{pmatrix}
\]
</div>

Let $A$ a matrix, in **R** you can transpose $A$ with
<code>t(A)</code>.
</td>
<td>

`Matrice ligne/colonne` or `vecteur` <br>
A matrix with either one line or one column. <br>
<div>
\[
A_{1,2}=\ \begin{pmatrix}
1&2
\end{pmatrix}
\]
</div>
</td>
<td>

`Matrice symétrique` ($\mathbb{R}$) <br>
`Matrice hermitienne` ($\mathbb{C}$) <br>

This is a matrix equals to its transpose.
</td>
<td>

`Matrice orthogonale` ($\mathbb{R}$) <br>
`Matrice unitaire` ($\mathbb{C}$) <br>

This is a matrix whose inverse is equals to its transpose.
</td>
</tr>
</tbody>
</table>

<table class="table table-striped border-dark table-bordered table-responsive">
<thead>
<tr>
<th>Lower triangular $L$</th>
<th>Strictly lower triangular $L$</th>
<th>Upper triangular $U$</th>
<th>Strictly upper triangular $U$</th>
</tr>
</thead>
<tbody>
<tr>
<td>

`Matrice triangulaire inférieure (TI)` <br>
All values above the diagonal are 0.
</td>
<td>

`Matrice triangulaire inférieure stricte (TIS)` <br>
All values above the diagonal are 0,
including the diagonal.
</td>
<td>

`Matrice triangulaire supérieure (TS)` <br>
All values below the diagonal are 0.
</td>
<td>

`Matrice triangulaire supérieure stricte (TSS)` <br>
All values below the diagonal are 0,
including the diagonal.
</td>
</tr>
</tbody>
</table>

<hr class="sl">

## Basic operations

The basic operation you can use are

* [Add a matrix with another](props/add.md)
* $A - B$ is not possible, but you can do $A + -1 * B$
* [Multiply a matrix by a real](props/mul-real.md)
* [Multiply a matrix by a matrix](props/mul-matrix.md)
* $A / B$ is not possible, but you can do $A * B^{-1}$

<hr class="sr">

## Gaussian elimination

We have a system. We are converting it to a matrix. Then, using Gauss, we get a matrix with an increasing sequence of 0 before the coefficients $p_i$. We can convert back the matrix to a system.

<div class="overflow-auto">
\[
\begin{split}\begin{cases}ax + by + ... = s_1\\ax + by + ... = s_2\\  ...  \end{cases}
\Leftrightarrow
\begin{pmatrix}a & b & ... & | s_1 \\a & b & ... & | s_2 \\  \cdots \end{pmatrix}
\Leftrightarrow^{Gauss}
\begin{pmatrix}p_1 & v_1 & ... & | s_1 \\0 & p_2 & ... & | s_2  \\  \cdots \end{pmatrix}
\Leftrightarrow
\begin{cases}p_1 * x = s_1 + v_1 * s_2 + ... \\ p_2 * y = s_2 + ...  \end{cases}\end{split}
\]
</div>

* [Solving a matrix with Gauss](gauss/index.md)
* [Gauss - Example](gauss/example.md)

<hr class="sl">

## Matrix inversion

The determinant of $A$, $det(A)=|A|$ is a value that is indicating if we can invert or not a matrix. A matrix is invertible (also written as $A \in Gl_n(\mathbb{R})$) if **the determinant is not null**, so $det(A) \neq 0$.

* Determinant properties
  * Let $A_{1,1}=\begin{pmatrix} a \end{pmatrix}$, then we have $det(A) = a$
  * $det(AB) = det(A) * det(B)$
  * $det(A^t) = det(A)$
  * Let $A$, a diagonal matrix, $det(A)$=product of the values on the diagonal
  * The property above is working for upper/lower diagonal matrices
* You can calculate the determinant
  * using the [simplified formula for 2x2 matrix](inversion/2x2.md)
  * using the [cofactor expansion](inversion/minor.md)
  * using [GAUSS elimination](inversion/gauss-det.md)
  * in **R**, use the function `det` as follows `det(A)`

Then, once you have checked the determinant, you can invert a matrix using

* using [GAUSS elimination](inversion/gauss-inv.md)
* using [the cofactor matrix "comatrix"](inversion/comatrix.md)

<hr class="sr">

## Definiteness of a matrix

Many times, you will be asked to check the definiteness of a matrix. You can either find the eigenvalues ($\lambda$, as you can learn in the next section), or check the leading minors ($\Delta$, that you will learn in this section).

|          Name              | **eigenvalues** | **minors** |
|----------------------------|-----------------|-----------------|
| **positive definite** <br> `définie positive`| $\forall k,\quad \lambda_k \gt 0$ | $\forall k,\quad \Delta_k  \gt 0$ |
| **positive semi-definite**<br>`semi-définie positive`| $\forall \text{k aside $k=e$},\quad \lambda_k \gt 0,\quad \lambda_{e} = 0$ | $\forall k < n,\quad \Delta_{k}>0 \text{. and } \Delta_{n}=0$ |
| **negative definite** <br> `définie négative` | $\forall k,\quad \lambda_k \lt 0$ | $\forall k,\quad (-1)^k \Delta_k \gt 0$ |
| **negative semi-definite** <br>`semi-définie négative` | $\forall \text{k aside $k=e$},\quad \lambda_k \lt 0,\quad \lambda_{e} = 0$ | $\forall k < n,\quad (-1)^k\Delta_{k}>0 \text{. and } \Delta_{n}=0$ |
| **indefinite** <br> `indéfinie`| $\exists k\exists n,\quad \lambda_k \gt 0,\quad \lambda_n \lt 0$ | $\Delta_{n} < 0$, and the dimension n is pairwise |

* [Leading minors of a matrix](inversion/minor-lead.md)
* [Leading minors of a matrix - example](inversion/minor-ex.md)

<hr class="sl">

## Eigendecomposition of a matrix

This is called `Réduction d’endomorphisme` in French. The goal is to calculate $A^n$ or $exp(A)$. Our goal is to calculate some matrix so that we have $A^n = P * D^n * P^{-1}$

* $D$: diagonal matrix, the eigenvalues of $A$ are on the diagonal
* $P$: an invertible matrix so that we have our formula

Some vocabulary

* Eigendecomposition: $A x = \lambda x$
* an **eigenvector** (`Vecteur propre`): $x$
* an **eigenvalue** (`Valeur propre`): $\lambda$
* **Spectrum** of a matrix $\sigma(A)$: set of all eigenvalues
* Rho, $\rho$ : the highest eigenvalue

You get the eigenvalues (according to Cayley–Hamilton theorem) by solving the following **characteristic polynomial** (`Polynôme caractéristique`). The polynomial's **degree** (`degré`) is $n$.

@
det(\lambda{I_n}-A_n) = 0
@

* [Eigendecomposition - steps](eigen/steps.md)
* [Eigendecomposition - example](eigen/example.md)

<hr class="sl">

## Sources

* <https://en.wikipedia.org/wiki/Matrix_(mathematics)>
* <https://en.wikipedia.org/wiki/List_of_named_matrices>
* <https://en.wikipedia.org/wiki/Determinant>
* <https://en.wikipedia.org/wiki/Eigendecomposition_of_a_matrix>
* <https://en.wikipedia.org/wiki/Eigenvalues_and_eigenvectors>
* <https://en.wikipedia.org/wiki/Definite_matrix>
* <https://en.wikipedia.org/wiki/Minor_(linear_algebra)>