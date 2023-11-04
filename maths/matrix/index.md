# Matrix Theory

<div class="row row-cols-lg-2"><div>

A matrix is a two-dimensional table with columns, rows, and values. We use the notation $A_{n,p}$ for a matrix of $n$ lines and $p$ columns. The value at the $i$-nth line and the $j$-nth column is written $a_{ij}=a_{i,j}$.

<div class="overflow-auto">
\[
\begin{split}A=\ A_{n,p}=\ A_{np}=\ \begin{pmatrix}
\ a_{1,1} & \cdots & a_{1, p-1} \\
\vdots  & \cdots & \vdots  \\
\ a_{n-1,1} & \cdots & a_{n-1, p-1}
\end{pmatrix}\end{split}
\]
</div>

⚠️ The coefficients $i$ and $j$ are starting from 1.

📚 The number of columns and lines is called the dimension.
</div><div>

A linear system is a set of equations that can be solved together. Matrices are often used to represent and solve linear systems of equations.

<div>
\[
\begin{split}\left \{
\begin{array}{r c l}
x_1 \ \ - \ \ x_2 + 2x_3 = 3 \\
x_1 \ \ + \ 2x_2 \ \ \ \ \ \ \ \ \ \ = 0
\end{array}
\right .\end{split}
\]
</div>

We create a matrix $A$ for the variables coefficients, a vector $b$ for the right-hand side. The matrix $S$ is made by concatenating the two.

<div>
\[
A = \begin{split}\begin{pmatrix}
1 & -1 & 2 \\
1 & 2 & 0
\end{pmatrix}
\quad
b = \begin{pmatrix}3 \\ 0\end{pmatrix}
\quad
S = \begin{pmatrix}
\ 1 & -1 & 2 & 3 \\
\ 1 & 2 & 0 & 0
\end{pmatrix}
\end{split}
\]
</div>
</div></div>

<hr class="sep-both">

## Basic Operations

<div class="row row-cols-lg-2"><div>

#### Addition between matrices

To add two matrices, they must have the same dimensions. The addition is defined by the sum coefficient by coefficient.

<div class="overflow-auto">
\[
\begin{split}        \begin{pmatrix}
1 & 2 & 3 \\
4 & 5 & 6
 \end{pmatrix}
 +
 \begin{pmatrix}
0 & 1 & 2 \\
1 & 2 & 3
 \end{pmatrix} = \begin{pmatrix}
1 & 3 & 5 \\
5 & 7 & 9
 \end{pmatrix}\end{split}
\]
</div>

#### Subtraction

The subtraction is not defined, but we can do $A + -1 * B$.

#### Scalar multiplication

Multiply each coefficient by the scalar.

<div class="overflow-auto">
\[
\begin{split}-2 *
\begin{pmatrix}
1 & 2 & 3 \\
4 & 5 & 6
\end{pmatrix}
\ = \
\begin{pmatrix}
-2 & -4 & -6 \\
-8 & -10 & -12
\end{pmatrix}\end{split}
\]
</div>
</div><div>

#### Matrix multiplication

The required is for both matrices to share a common row/column value `c` so that we have: $M1_{n1, \ {\color{red}c}} * M2_{\ {\color{red}c}, p2}$. The result is $M_{n1,p2}$.

<div class="overflow-auto mb-2">
\[
\begin{split}\ \ \  \  \  \  \  \  \  \  \  \  \ \  \  \  \  \  \  \  \  \  \  \ \  \
M1\ \begin{pmatrix}
\color{yellow}{1} & 4 \\
\color{yellow}{2} & 5  \\
\color{yellow}{3} & 6
\end{pmatrix}\end{split}
\]
\[
\begin{split}M2
\begin{pmatrix}
\color{red}{9} & \color{red}{8} & \color{red}{7} \\
6 & 5 & 4
\end{pmatrix}
\
M
\begin{pmatrix}
\color{red}{9}*\color{yellow}{1}+\color{red}{8}*\color{yellow}{2}+\color{red}{7}*\color{yellow}{3}=46 & 9*4+8*5+7*6=118 \\
6*1+5*2+4*3=28 & 6*4+5*5+4*6=73
\end{pmatrix}\end{split}
\]
</div>

For each coefficient, we are doing the following operation:

<div>
\[
M_{\color{red}{u}\color{yellow}{v}} = \sum_{i=1}^c M1_{{\color{red}u},i} * M2_{i, \color{yellow}{v}}
\]
</div>

#### Matrix division

$A / B$ is not possible, but you can do $A * B^{-1}$ <small>(inverse of a matrix)</small>.
</div></div>

<hr class="sep-both">

## Special matrices

<p></p>

<table class="table table-bordered table-striped border-dark">
<thead>
<tr><th>Identity matrix $Id_n$ or $I_n$</th></tr>
</thead>
<tbody>

<tr><td>This is a diagonal matrix having $1$ on the diagonal, which mean we have $A_n * Id_n = Id_n * A_n = A_n$.</td></tr>

</tbody></table>

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

Zero-Matrix with non-zero values on the diagonal. <br>
<div>
\[
D_{2}=\ \begin{pmatrix}
1&0\\
0&4\\
\end{pmatrix}
\]
</div>
</td>
<td>

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
</td>
<td>

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

This is a matrix equals to its transpose.
</td>
<td>

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

All values above the diagonal are 0.
</td>
<td>

All values above the diagonal are 0, including the diagonal.
</td>
<td>

All values below the diagonal are 0.
</td>
<td>

All values below the diagonal are 0, including the diagonal.
</td>
</tr>
</tbody>
</table>

<hr class="sep-both">

## Gaussian elimination

<div class="row row-cols-lg-2"><div>

Gauss can be used to solve a system represented as a matrix. The goal is to get a matrix with a strictly increasing number of zeros before the leading coefficients/pivots $p_i$; which are the first non-null values.

The result of Gauss is called the row echelon form. It all leading coefficients are $1$ and there is only $0$ in their columns, the result is called a reduced row echelon form.

<div class="overflow-auto">
\[
\begin{split}
\begin{pmatrix}a_1 & b_1 & ... & s_1 \\a_2 & b_2 & ... & s_2 \\  \cdots \end{pmatrix}
\Leftrightarrow^{Gauss}
\begin{pmatrix}p_1 & v_1 & ... & s_1' \\0 & p_2 & ... & s_2'  \\  \cdots \end{pmatrix}
\Leftrightarrow
\begin{cases}
p_1 * x = s_1' + v_1 * s_2' + \ldots \\
p_2 * y = s_2' + \ldots
\end{cases}\end{split}
\]
</div>
</div><div>

The operations you can use are to transform the matrix are:

* Swapping two rows: $L_i \iff L_j$
* Adding a row: $L_i = L_i + L_j$
* Adding a row, multiplied by $c$: $L_i \leftarrow L_i + cL_j$
* Subtracting a row: $L_i \leftarrow L_i + -1 * L_j$
* Dividing a row by $c$: $L_i \leftarrow L_i + \frac{1}{c} * L_j$
* Multiply a row by $c$: $L_i \leftarrow c * L_i$

📚 All other operations are examples from $L_i \leftarrow a * L_i + b * L_j$.

➡️ See also: [Gauss Example](_examples/gauss.md).
</div></div>

<hr class="sep-both">

## Inverse of a matrix

<div class="row row-cols-lg-2"><div>

The inverse of a matrix when multiplied by the original matrix, results in the identity matrix. In mathematical notation, $A^{-1}$ represents the inverse of $A$. Only square matrices may be invertible.

<div class="overflow-auto">
\[
\begin{split}
A_n * A_n^{-1} = A_n^{-1} * A_n = I_n
\end{split}
\]
</div>

The determinant $det(A)$ or $|A|$ is a scalar that we can calculate. When $det(A) \neq 0$, the matrix is invertible, e.g., $A \in Gl_n(\mathbb{R})$.

* $A_{1}=\begin{pmatrix} a \end{pmatrix} \quad \to \quad det(A) = a$
* $D_{n}=\ldots \quad \to \quad det(A) = \prod_1^n a_{ii}$
* $det(AB) = det(A) * det(B)$
* $det(A^t) = det(A)$
* For a square matrix $A_2$: 

<div class="overflow-auto">
\[
\begin{split}
A_2=\begin{pmatrix} a & b \\ c & d \end{pmatrix}
\quad
\to
\quad
det(A) = ad-bc
\end{split}
\]
</div>

➡️ The formulas above are also working for upper/lower triangular matrices. Simply consider then the same as $D_n$.
</div><div>

...
</div></div>

<hr class="sep-both">

## 👻 To-do 👻

Stuff that I found, but never read/used yet.

<div class="row row-cols-lg-2"><div>

* [old](_old.md)
</div><div>
</div></div>