# LU factorization

[Go back](../index.md)

``Requirement`` : invertible and all eigen values must be strictly positives

``Process`` :

We want to split our matrix A in two matrix

* L : lower strict diagonal matrix
* U : upper diagonal matrix

It's quite easy. You will
do GAUSS elimination, but only using this
rule

<p>
\[
L_i <- L_i - k * L_j
\]
</p>

meaning you can only subtract a line by another line
that will multiplied by k. Please **take note
of all k values that you used**. You main job is starting
from **U** and remove all values below the diagonal.
U matrix should look like this one

<div>
\[
U_{33} = \begin{pmatrix}
* & * & * \\
0 & * & * \\
0 & 0 & * \\
\end{pmatrix}
\]
</div>

<p>
If you remoted
the number at <span>\(a_{ij}\)</span>
using k=7 then in L matrix, value at
<span>\(a_{ij}\)</span> is 7.
L matrix should look like this one
</p>

<div>
\[
L_{33} = \begin{pmatrix}
1 & 0 & 0 \\
* & 1 & 0 \\
* & * & 1 \\
\end{pmatrix}
\]
</div>

And that's it.
