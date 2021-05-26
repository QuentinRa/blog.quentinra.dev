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

# Example

Find cholesky factorization of A then find solve Ax = b.

<p>
\[
A = \begin{pmatrix}
4 & 2 & 2 \\
2 & 10 & 7 \\
2 & 7 & 21 \\
\end{pmatrix}
\]
</p>

and

<p>
\[
b = \begin{pmatrix}
12 \\
-9 \\
-20 \\
\end{pmatrix}
\]
</p>


We are checking that A is

* symmetric : done, just give it a look or transpose it
* eigen values, I'm using minor of matrix A

    * <span>
        \( d1 = 4 > 0 \) </span>
    * <span>
        \( d2 = 4 * 10 - 2 * 2 = 36 > 0 \) </span>
    * <span class="row w-100 overflow-auto">
        \(
            d3 = 4 * (10 * 21 - 7 * 7) - 2 * (2* 21 -2 * 7) + 2 * ( 2 * 7 - 2 * 10)
            = 4 * 161 - 68 = 3 * 161 + 93 > 0
        \)</span>
    * so that's okay
* and det(A) is not 0 (see d3) so everything is fine

then we start your job

* <span class="row w-100 overflow-auto">
    \(
    l_{11} = \sqrt{4} = 2
    \)</span>
* <span class="row w-100 overflow-auto">
    \(
    l_{21} = 2 / l_{11} = 1
    \)</span>
* <span class="row w-100 overflow-auto">
    \(
    l_{22} = \sqrt{10 - 1^2} = 3
    \)</span>
* <span class="row w-100 overflow-auto">
    \(
    l_{31} = 2 / l_{11} = 1
    \)</span>
* <span class="row w-100 overflow-auto">
    \(
    l_{32} = \frac{7 - (1 * 1)}{3} = 2
    \)</span>
* <span class="row w-100 overflow-auto">
    \(
    l_{33} = \sqrt{21 - 2^2 - 1^1} = 4
    \)</span>


<p>
\[
\begin{pmatrix}
2 & 0 & 0 \\
1 & 3 & 0 \\
1 & 2 & 4 \\
\end{pmatrix}
\]
</p>

Now we will use GAUSS with b and solve x.

<p>
\[
\begin{pmatrix}
2 & 0 & 0 & 12 \\
1 & 3 & 0 & -9\\
1 & 2 & 4 & -20\\
\end{pmatrix}
\]
</p>

some steps here...

<blockquote class="spoiler overflow-auto">
\[
\begin{pmatrix}
1 & 0 & 0 & 6 \\
1 & 3 & 0 & -9\\
1 & 2 & 4 & -20\\
\end{pmatrix}
=
\begin{pmatrix}
1 & 0 & 0 & 6 \\
0 & 3 & 0 & -15\\
0 & 2 & 4 & -26\\
\end{pmatrix}
=
\begin{pmatrix}
1 & 0 & 0 & 6 \\
0 & 1 & 0 & -5\\
0 & 2 & 4 & -26\\
\end{pmatrix}
=
\begin{pmatrix}
1 & 0 & 0 & 6 \\
0 & 1 & 0 & -5\\
0 & 0 & 4 & -16\\
\end{pmatrix}
=
\begin{pmatrix}
1 & 0 & 0 & 6 \\
0 & 1 & 0 & -5\\
0 & 0 & 1 & -4\\
\end{pmatrix}
\]

My steps were
<ol>
<li>Line1 * 1/2</li>
<li>Line2 - Line1, Line3 - Line1</li>
<li>Line2 * 1/3</li>
<li>Line3 - 2 * Line2</li>
<li>Line3 * 1/4</li>
</ol>
</blockquote>

and we got

* x = 6
* y = -5
* z = -4