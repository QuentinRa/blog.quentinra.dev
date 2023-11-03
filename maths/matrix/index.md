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

We often create a matrix $A$ for the equations, a vector $b$ for the right-hand side. And the matrix $S$, is made by concatenating the two.

<div>
\[
A = \begin{split}\begin{pmatrix}
1 & -1 & 2 & 3 \\
1 & 2 & 0 & 0
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

## 👻 To-do 👻

Stuff that I found, but never read/used yet.

<div class="row row-cols-lg-2"><div>

* [old](_old.md)
</div><div>
</div></div>