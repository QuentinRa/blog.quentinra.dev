# Cholesky factorization

[Go back](../index.md)

``Requirement`` : invertible, symmetric and all eigen values must be strictly positives

``Process`` :

* check requirements
    * invertible means det(A) not 0
    * symmetric means A = transpose of A
    * check eigen values

* Then we will use theses formula

For a value on the diagonal

<p>
\[
l_{ii} = \sqrt{a_{ii} - \sum_{k=1}^{i-1} l^2_{ik}}
\]
</p>

meaning in words that will have the value on the diagonal minus
all the values of the same line before ours. And we will use
this one for other coefficients

<p>
\[
l_{ij} = \frac{a_{ij} - \sum_{k=1}^{j-1} l_{ik} * l_{jk} }{a_{ii}}
\]
</p>

meaning in words that we will have your value minus
all the values of the previous column same line multiplied
by the previous column of the previous line until we don't have a previous
column. Divide everything by the value on the diagonal.

* our aim is to have a matrix like this one (example for 3x3)

<p>
\[
\begin{pmatrix}
1 & 0 & 0 \\
2 & 3 & 0 \\
4 & 5 & 6 \\
\end{pmatrix}
\]
</p>

where 1,2, ... until six are the value we are looking for. We will check
the value at 1, then at 2, ... using our formulas.

