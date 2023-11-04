# Determinant Example

<hr class="sep-both">

## Gauss Example 1

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

<hr class="sep-both">

## Gauss Example 2

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

<hr class="sep-both">

## Cofactors Example

<div class="overflow-auto">
\[
M=\begin{pmatrix}-1 & 4 & -7 \\2 & -5 & 8 \\-3 & 6 & -9\end{pmatrix}
\]
</div>

We are picking the column $p=3 \to (-7,8,-9)$. The formula is

<div class="overflow-auto">
\[
\begin{split}
det(M) 
= a_{1,3} * C_{1,3} + a_{2,3} * C_{2,3} + a_{3,3} * C_{3,3} \\
= -7 * C_{1,3} + 8 * C_{2,3} + -9 * C_{3,3}
\end{split}
\]
</div>

* $C_{1,3} = (-1)^{4} * det(M_{1,3}) = det(M_{1,3}) = \textbf{-3}$

<div class="overflow-auto">
\[
det(M_{1,3})=det(\begin{pmatrix}2 & -5\\-3 & 6\end{pmatrix}) = -3
\]
</div>

* $C_{2,3} = (-1)^{5} * det(M_{2,3}) = -det(M_{2,3}) = \textbf{-6}$

<div class="overflow-auto">
\[
det(M_{2,3})=det(\begin{pmatrix} -1 & 4 \\ -3 & 6 \end{pmatrix}) = 6
\]
</div>

* $C_{3,3} = (-1)^{6} * det(M_{3,3}) = det(M_{3,3}) = \textbf{-3}$

<div class="overflow-auto">
\[
det(M_{2,3})=det(\begin{pmatrix} -1 & 4 \\ 2 & -5\end{pmatrix}) = -3
\]
</div>

We can then calculate the determinant:

<div class="overflow-auto">
\[
\begin{split}
det(M)
= -7 * C_{1,3} + 8 * C_{2,3} + -9 * C_{3,3} \\
= -7 * -3 + 8 * -6 + -9 * -3 \\
= 0 \\
\end{split}
\]
</div>