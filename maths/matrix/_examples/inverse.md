# Inverse Example

<hr class="sep-both">

## Gauss Example

Solve $A^{-1}$ given the following invertible matrix $A$

<div class="overflow-auto">
\[
A=\begin{pmatrix} 3 & -2 & 4 \\ 2 & -4 & 5 \\1 & 8 & 2\end{pmatrix}
\]
</div>

* **Step 0**

<div>
\[
\begin{split}\begin{pmatrix}3 & -2 & 4 \\ 2 & -4 & 5 \\1 & 8 & 2\end{pmatrix}
\begin{pmatrix}1 & 0 & 0 \\0 & 1 & 0 \\ 0 & 0 & 1\end{pmatrix}\end{split}
\]
</div>

* **Step 1, 2, 3**
    * $L3 \iff L1$
    * $L2 \leftarrow L2 - 3 L_1$
    * $L3 \leftarrow L2 - 2 L_1$

<div>
\[
\begin{split}
\begin{pmatrix}
1 & 8 & 2 \\
0 & -26 & -2 \\
0 & -20 & 1 \\
\end{pmatrix}
\begin{pmatrix}
0 & 0 & 1 \\
1 & 0 & -3 \\
0 & 1 & -2 \\
\end{pmatrix}
\end{split}
\]
</div>

* ... a lot of steps ...

<div class="overflow-auto">
\[
\begin{split}\begin{pmatrix}1 & 0 & 0 \\0 & 1 & 0 \\ 0 & 0 & 1\end{pmatrix}
\begin{pmatrix}8/11 & -6/11 & -1/11 \\ -1/66 & -1/33 & 7/66 \\-10/33 & 13/33 & 4/33\end{pmatrix} = A^{-1}\end{split}
\]
</div>

The second matrix is $A^{-1}$.

<hr class="sl">

## Cofactors Example

Given the following invertible matrix $A$ since $det(A)=66$. Using the cofactor matrix, solve $A^{-1}$.

<div class="overflow-auto">
\[
A=\begin{pmatrix} 3 & -2 & 4 \\ 2 & -4 & 5 \\1 & 8 & 2\end{pmatrix}
\]
</div>

<blockquote class="spoiler">

<div class="overflow-auto">
\[
C = \begin{pmatrix}
+ det(\begin{pmatrix}-4 & 5 \\ 8 & 2\end{pmatrix}) & - det(\begin{pmatrix}2 & 5 \\ 1 & 2\end{pmatrix}) & + det(\begin{pmatrix}2 & -4 \\ 1 & 8\end{pmatrix}) \\
- det(\begin{pmatrix}-2 & 4 \\ 8 & 2\end{pmatrix}) & + det(\begin{pmatrix}3 & 4 \\ 1 & 2\end{pmatrix}) & - det(\begin{pmatrix}3 & -2 \\ 1 & 8\end{pmatrix}) \\
+ det(\begin{pmatrix}-2 & 4 \\ -4 & 5\end{pmatrix}) & - det(\begin{pmatrix}3 & 4 \\ 2 & 5\end{pmatrix}) & + det(\begin{pmatrix}3 & -2 \\ 2 & -4\end{pmatrix})
\end{pmatrix}
\]
\[
\Leftrightarrow C = \begin{pmatrix}
-48 & 1 & 20 \\
36 & 2 & -26 \\
6 & -7 & -8 \\
\end{pmatrix} 
\]
And
\[
C^T = \begin{pmatrix}
-48 & 36 & 6 \\
1 & 2 & -7 \\
20 & -26 & -8 \\
\end{pmatrix}
\]
</div>

Then we have

<div class="overflow-auto">
\[
\begin{split}
A^{-1} = \frac{1}{-66} *
\begin{pmatrix}
-48 & 36 & 6 \\
1 & 2 & -7 \\
20 & -26 & -8 \\
\end{pmatrix} \\
\Leftrightarrow
\begin{pmatrix}
48/66 & -36/66 & -6/66 \\
-1/66 & -2/66 & 7/66 \\
-20/66 & 26/66 & 8/66 \\
\end{pmatrix}
\Leftrightarrow
\begin{pmatrix}
8/11 & -6/11 & -1/11 \\
-1/66 & -1/33 & 7/66 \\
-10/33 & 13/33 & 4/33 \\
\end{pmatrix}
\end{split}
\]
</div>
</blockquote>