# Gauss Example

[Go back](../index.md#gaussian-elimination)

We will solve the following system using the GAUSS method.

<div class="overflow-auto">
\[
\begin{split}\left \{
\begin{array}{r c l}
0 - x_2 + 2x_3 + 13x_4 = 5 \\
x_1 - 2x_2 + 3x_3 + 17x_4 = 4 \\
-x_1 + 3x_2 - 3x_3 - 20x_4 = -1 \\
\end{array}
\right .\end{split}
\]
</div>

<hr class="sl">

## The corresponding matrix is

<blockquote class="overflow-auto spoiler">
\[
\begin{split}\ \begin{pmatrix}
\ 0 & -1 & 2 & 13 & 5 \\
\ 1 & -2 & 3 & 17 & 4 \\
\ -1 & 3 & -3 & -20 & -1
\end{pmatrix}\end{split}
\]
</blockquote>

<hr class="sr">

## Step 1

Operation: $L_1 \iff L_2$

<blockquote class="overflow-auto spoiler">
\[
\begin{split}\ \begin{pmatrix}
\ 1 & -2 & 3 & 17 & 4 \\
\ 0 & -1 & 2 & 13 & 5 \\
\ -1 & 3 & -3 & -20 & -1
\end{pmatrix}\end{split}
\]
</blockquote>

<hr class="sl">

## Step 2

Operation: $L_3 = L_3 + L_1$

<blockquote class="overflow-auto spoiler">
\[
\begin{split}\ \begin{pmatrix}
\ 1 & -2 & 3 & 17 & 4 \\
\ 0 & -1 & 2 & 13 & 5 \\
\ 0 & 1 & 0 & -3 & 3
\end{pmatrix}\end{split}
\]
</blockquote>

<hr class="sr">

## Step 3

Operation: $L_3 = L_3 + L_2$

<blockquote class="overflow-auto spoiler">
\[
\begin{split}\ \begin{pmatrix}
\ 1 & -2 & 3 & 17 & 4 \\
\ 0 & -1 & 2 & 13 & 5 \\
\ 0 & 0 & 2 & 10 & 8
\end{pmatrix}\end{split}
\]
</blockquote>

At this point, the matrix is in the **row echelon form**. We could write back the system

<blockquote class="overflow-auto spoiler">
\[
\begin{split}\left \{
\begin{array}{r c l}
x_1 - 2x_2 + 3x_3 + 17x_4 = 4\\
- x_2 + 2x_3 + 13x_4 = 5\\
2x_3 + 10x_4 = 8\\
\end{array}
\right .\end{split}
\]
</blockquote>

But let's continue until we get the reduced row echelon form!

<hr class="sl">

## Step 4

Operation: $L_3 = L_3/2$

<blockquote class="overflow-auto spoiler">
\[
\begin{split}\ \begin{pmatrix}
\ 1 & -2 & 3 & 17 & 4 \\
\ 0 & -1 & 2 & 13 & 5 \\
\ 0 & 0 & 1 & 5 & 4
\end{pmatrix}\end{split}
\]
</blockquote>

<hr class="sr">

## Step 5

Operation: $L_3 = L_1/-1$

<blockquote class="overflow-auto spoiler">
\[
\begin{split}\ \begin{pmatrix}
\ 1 & -2 & 3 & 17 & 4 \\
\ 0 & 1 & -2 & -13 & -5 \\
\ 0 & 0 & 1 & 5 & 4
\end{pmatrix}\end{split}
\]
</blockquote>

<hr class="sl">

## Step 6

Operation: $L_1 = L_1 - 3 L_3$ and $L_2 = L_2 + 2 L_3$

<blockquote class="overflow-auto spoiler">
\[
\begin{split}\ \begin{pmatrix}
\ 1 & -2 & 0 & 2 & -8 \\
\ 0 & 1 & 0 & -3 & 3 \\
\ 0 & 0 & 1 & 5 & 4
\end{pmatrix}\end{split}
\]
</blockquote>

<hr class="sr">

## Step 7

Operation: $L_1 = L_1 + 2 L_2$

<blockquote class="overflow-auto spoiler">
\[
\begin{split}\ \begin{pmatrix}
\ 1 & 0 & 0 & -4 & -2 \\
\ 0 & 1 & 0 & -3 & 3 \\
\ 0 & 0 & 1 & 5 & 4
\end{pmatrix}\end{split}
\]
</blockquote>

<hr class="sl">

## Result

We are converting it back to a system

<blockquote class="overflow-auto spoiler">
\[
\begin{split}\left \{
\begin{array}{r c l}
x_1 - 4x_4 = -2\\
x_2 - 3x_4 = 3\\
x_3 + 5x_4 = 4\\
\end{array}
\right .\end{split}
\]
</blockquote>

Giving us

<blockquote class="overflow-auto spoiler">
\[
\begin{split}\left \{
\begin{array}{r c l}
x_1 = -2 + 4x_4\\
x_2  = 3 + 3x_4\\
x_3 = 4 - 5x_4\\
\end{array}
\right .\end{split}
\]
</blockquote>