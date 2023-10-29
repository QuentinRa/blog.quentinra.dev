# GAUSS elimination

[Go back](../index.md#matrix-inversion)

To find the determinant, you need to reduce a matrix to an upper diagonal matrix, then use the property "$det(A)$=product of the values on the diagonal" to find the determinant.

If you swapped lines, then multiply the result by

* $det(A) = det(A) * (-1)^s$
* with $s$ the number of swaps

<hr class="sl">

## Example 1

What's the determinant of A?

<p>
\[
A = \begin{pmatrix}
0 & 1 & 0 & 0 \\
1 & 0 & 0 & 0 \\
0 & 0 & 0 & 1 \\
0 & 0 & 1 & 0
\end{pmatrix}
\]
</p>

<blockquote class="spoiler">
\[
\begin{split}\begin{pmatrix}
0 & 1 & 0 & 0 \\
1 & 0 & 0 & 0 \\
0 & 0 & 0 & 1 \\
0 & 0 & 1 & 0
\end{pmatrix}
 \Leftrightarrow^{L1  \leftrightarrow L2}
\begin{pmatrix}
1 & 0 & 0 & 0 \\
0 & 1 & 0 & 0 \\
0 & 0 & 0 & 1 \\
0 & 0 & 1 & 0
\end{pmatrix}
 \Leftrightarrow^{L3  \leftrightarrow L4}
\begin{pmatrix}
1 & 0 & 0 & 0 \\
0 & 1 & 0 & 0 \\
0 & 0 & 1 & 0 \\
0 & 0 & 0 & 1
\end{pmatrix}\end{split}
\]

The determinant is $det(A) = 1\*1\*1\*1 = 1$ but
since we swapped lines 2 times, then
$det(A) = 1 * (-1)^2 = 1$.
</blockquote>

<hr class="sl">

## Example 2

What's the determinant of A?

<p>
\[
A = \begin{pmatrix}
1 & 2 & 3 \\
2 & 3 & 4 \\
3 & 4 & 5
\end{pmatrix}
\]
</p>

<blockquote class="spoiler">
\[
\begin{split}\begin{pmatrix}
1 & 2 & 3 \\
2 & 3 & 4 \\
3 & 4 & 5
\end{pmatrix}
\Leftrightarrow^{L_2  \leftarrow  L_2 + -2*L_1 } \begin{pmatrix}
1 & 2 & 3 \\
0 & -1 & -2 \\
3 & 4 & 5
\end{pmatrix}
\Leftrightarrow^{L_3  \leftarrow  L_3 + -3*L_1 }
\\
\begin{pmatrix}
1 & 2 & 3 \\
0 & -1 & -2 \\
0 & -2 & -4
\end{pmatrix}
\Leftrightarrow^{L_3  \leftarrow  L_3 + 2*L_2 } \begin{pmatrix}
1 & 2 & 3 \\
0 & -1 & -2 \\
0 & 0 & 0
\end{pmatrix}\end{split}
\]

The determinant is $det(A) = 1\*-1\*0 = 0$.
</blockquote>