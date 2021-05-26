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

## Example

Demonstrate that this matrix admit a LU factorization
and give it.

<p>
\[
A = \begin{pmatrix}
3 & 6 & 9 \\
-6 & -10 & -13 \\
-9 & -22 & -36 \\
\end{pmatrix}
\]
</p>

**Checks**

* <span>
        \( d1 = 3 > 0 \) </span>
* <span>
        \( d2 = 3 * -10 - 6 * -6 = -30+36 = 6 > 0 \) </span>
* <span class="row w-100 overflow-auto">
        \(
            d3 = 3 * (-10 * -36 - -13 * -22)
            - -6 * (6 * -36 - 9 * -22) + 
            -9 * (6 * -13 - 9 * -10)
            = 222 - 108 - 108 = 6 > 0
        \)</span>

* and d3 != 0 so invertible

**Find**

Apply GAUSS find find U. Some steps here...

<blockquote class="spoiler overflow-auto">
\[
U = \begin{pmatrix}
3 & 6 & 9 \\
-6 & -10 & -13 \\
-9 & -22 & -36 \\
\end{pmatrix}
\Leftrightarrow
\begin{pmatrix}
3 & 6 & 9 \\
0 & 2 & 5 \\
0 & -4 & -9 \\
\end{pmatrix}
\Leftrightarrow
\begin{pmatrix}
3 & 6 & 9 \\
0 & 2 & 5 \\
0 & 0 & 1 \\
\end{pmatrix}
\]

My steps were
<ol>
<li>Line2 + 2 * Line1 = Line2 - <b>k=-2</b> * Line1</li>
<li>Line3 + 3 * Line1 = Line2 - <b>k=-3</b> * Line1</li>
<li>Line3 + 2 * Line2 = Line3 - <b>k=-2</b> * Line2</li>
</ol>
</blockquote>

So we got our L

<blockquote class="spoiler overflow-auto">
\[
L = \begin{pmatrix}
1 & 0 & 0 \\
-2 & 1 & 0 \\
-3 & -2 & 1 \\
\end{pmatrix}
\]

using the k we used in U, at the place where we replaced
the value by 0.
</blockquote>