# Introduction

We are writing $A_{n,p}$ a matrix of $n$ lines and $p$ columns.
The value at the $i$nth line and the $j$nth column is
written $a_{ij}=a_{i,j}$. The coefficients are starting from 1.

<div class="overflow-auto">
\[
\begin{split}A=\ A_{n,p}=\ A_{np}=\ \begin{pmatrix}
\ a_{1,1} & \cdots & a_{1, p-1} \\
\vdots  & \cdots & \vdots  \\
\ a_{n-1,1} & \cdots & a_{n-1, p-1}
\end{pmatrix}\end{split}
\]
</div>

<hr class="sl">

## Linear System

A linear system is a set of equations that can
solved together. Solving one, will give you a variable
value that you can use to solve another one until you
solved everything.

What's convenient is that you can use a matrix for
that because the GAUSS method (and a lot of other methods
in Numerical analysis) needs a matrix. The
rules are that the values in the matrix are the
coefficient between the variables ($0$ if not found,
$1$ if $x$ or $n$ if $n * x$). The last column is
the vector $b$ made with the values after the equals operator.

* [Example](linear-system/example.md)

<hr class="sr">

## Named matrices

In French, we will call theses ``Matrices remarquables``.
The matrix you must remember is called **Identity matrix**
(``Matrice identité``) $Id_n$ or $I_n$. This is
a diagonal matrix having $1$ on the diagonal
giving us $A_n * Id_n = Id_n * A_n = A_n$.

<table class="table table-striped table-dark table-bordered table-responsive">
<thead>
<tr>
<th>Zero matrix $O_{np}$</th>
<th>Square matrix $A_{n}$</th>
<th>Diagonal matrix $D_{n}$</th>
<th>Conjugate transpose $A^T/A^*$</th>
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
A_{2}=\ \begin{pmatrix}
1&2\\
3&4\\
\end{pmatrix}
\]
</div>
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

<table class="table table-striped table-dark table-bordered table-responsive">
<thead>
<tr>
<th>Transpose matrix $A^{T}$</th>
<th>Vector $A_{1,n}/A_{n,1}$</th>
<th>
Hermitian matrix $A$ ($\mathbb{C}$)<br>
Symmetric matrix $A$ ($\mathbb{R}$)
</th>
<th>
Unitary matrix $A$ ($\mathbb{C}$)<br>
Orthogonal matrix $A$ ($\mathbb{R}$)
</th>
</tr>
</thead>
<tbody>
<tr>
<td>

`Matrice transposée` <br>
Thr rows becomes the lines and inversely. <br>
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

A matrix equals to its transpose.
</td>
<td>

`Matrice orthogonale` ($\mathbb{R}$) <br>
`Matrice unitaire` ($\mathbb{C}$) <br>

A matrix whose inverse is
equals to its transpose.
</td>
</tr>
</tbody>
</table>

<table class="table table-striped table-dark table-bordered table-responsive">
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
* $A - B$ is not possible but you can do $A + -1 * B$
* [Multiply a matrix by a real](props/mul-real.md)
* [Multiply a matrix by a matrix](props/mul-matrix.md)
* $A / B$ is not possible but you can do $A * B^{-1}$

<hr class="sr">

## Gaussian elimination

We have a system. We are converting it to a matrix.
Then using Gauss, we get a matrix with an increasing sequence of 0 before
the coefficients $p_i$. We can convert back the matrix to a system.

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

The determinant of $A$, $det(A)=|A|$ is a value which
indicate if we can invert or not a matrix. A matrix
is invertible (also written as $A \in Gl_n(\mathbb{R})$)
if **the determinant is not null** so $det(A) \neq 0$.

* Determinant properties
  * Let $A_{1,1}=\begin{pmatrix} a \end{pmatrix}$, $det(A) = a$
  * $det(AB) = det(A) * det(B)$
  * $det(A^t) = det(A)$
  * Let $A$ a diagonal matrix, $det(A)$=product of the diagonal values
  * The property above is working for upper/lower diagonal matrix
* You can calculate the determinant
  * using the [simplified formula for 2x2 matrix](inversion/2x2.md)
  * using the [cofactor expansion](inversion/minor.md)
  * using [GAUSS elimination](inversion/gauss-det.md)

Then, once you have checked the determinant, you
can invert a matrix using

* using [GAUSS elimination](inversion/gauss-inv.md)
* using [the cofactor matrix "comatrix"](inversion/comatrix.md)

<hr class="sr">

## Eigendecomposition of a matrix

This is called `Réduction d’endomorphisme` in French.
The goal is to calculate $A^n$ or $exp(A)$. Our goal
is to calculate some matrix so that
we have $A^n = P * D^n * P^{-1}$

* $D$: diagonal matrix, the eigen values of $A$ are on the diagonal
* $P$: an invertible matrix so that we have our formula

Some vocabulary

* Eigendecomposition: $A x = \lambda x$
* an **eigenvector** (`Vecteur propre`): $x$
* an **eigenvalue** (`Valeur propre`): $\lambda$
* **Spectrum** of a matrix $\sigma(A)$: set of all eigen values
* Rho, $\rho$ : the highest eigen value

You get the eigen values (according
to Cayley–Hamilton theorem) by solving the
following **characteristic polynomial** (`Polynôme caractéristique`).
The polynomial's **degree** (`degré`) is $n$.

@
det(\lambda{I_n}-A_n) = 0
@

* [Eigendecomposition steps](eigen/steps.md)
* [Eigendecomposition examples](eigen/examples.md)

<hr class="sl">

## Sources

* <https://en.wikipedia.org/wiki/Matrix_(mathematics)>
* <https://en.wikipedia.org/wiki/List_of_named_matrices>
* <https://en.wikipedia.org/wiki/Determinant>
* <https://en.wikipedia.org/wiki/Eigendecomposition_of_a_matrix>
* <https://en.wikipedia.org/wiki/Eigenvalues_and_eigenvectors>