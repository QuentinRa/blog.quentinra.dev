# Introduction

We are writing $M_{n,p}$ a matrix of $n$ lines and $p$ columns.
The value at the $i$nth line and the $j$nth column is
written $a_{ij}=a_{i,j}$. The coefficients are starting from 1.

<div>
\[
\begin{split}M=\ M_{n,p}=\ M_{np}=\ \begin{pmatrix}
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
rules are

* [Rules to transform a linear system to a matrix](linear-system/rules.md)
* [Example](linear-system/example.md)

<hr class="sr">

## Named matrices

In French, we will call theses ``Matrices remarquables``.
The matrix you must remember is called **Identity matrix**
(``Matrice identité``) $Id_n$ or $I_n$. This is
a diagonal matrix having $1$ on the diagonal
giving us $A_n * Id_n = Id_n * A_n = A_n$.

<table class="table table-striped table-dark table-bordered">
<thead>
<tr>
<th>Zero matrix $O_{np}$</th>
<th>Square matrix $M_{n}$</th>
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
M_{2}=\ \begin{pmatrix}
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
M_{2}=\ \begin{pmatrix}
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

<table class="table table-striped table-dark table-bordered">
<thead>
<tr>
<th>Transpose matrix $A^{T}$</th>
<th>Vector $M_{1,n}/M_{n,1}$</th>
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
<div>
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
M_{1,2}=\ \begin{pmatrix}
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

<table class="table table-striped table-dark table-bordered">
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