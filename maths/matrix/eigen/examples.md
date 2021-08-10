# Eigendecomposition example

[Go back](../index.md#eigendecomposition-of-a-matrix)

Let's look for the eigendecomposition of $A$

<div class="overflow-auto">
\[
\begin{split}
A = 
\begin{pmatrix}
1&2\\
2&4\end{pmatrix}
\end{split}
\]
</div>

<hr class="sl">

## Step 1

Calculate $X = \lambda{I_n}-A_n$

<div class="overflow-auto">
\[
X = \begin{split}\begin{pmatrix}\lambda & 0 \\0 & \lambda \end{pmatrix}
− \begin{pmatrix}1&2\\2&4\end{pmatrix}
=
\begin{pmatrix}
\lambda-1 & -2 \\
-2 & \lambda -4
\end{pmatrix}\end{split}
\]
</div>

<hr class="sr">

## Step 2

Solve $det(\lambda{I_n}-A_n) = 0$.
We know that $det(A_2) = ad-bc$ is
so we have

<div class="overflow-auto">
\[
\begin{split}
det(X) = (\lambda-1) * (\lambda -4) - (-2*-2) = 0
\\ \Leftrightarrow
\lambda^2 -4\lambda - \lambda +4  -4
\\ \Leftrightarrow
\lambda^2 - 5\lambda 
\\ \Leftrightarrow
(\lambda -0)(\lambda - 5)
\end{split}
\]
</div>

We got $\lambda_1=0$ and $\lambda_2=5$.

<hr class="sl">

## Step 3 (0)

<div class="overflow-auto">
\[
\begin{split}\begin{cases}
1x + 2y = 0x\\
2x + 4y = 0y
\end{cases}
=^{collinearity}
\begin{cases}
1x + 2y = 0\\
\end{cases}
=
\begin{cases}
x = -2y\\
\end{cases}\end{split}
\]
</div>

The first eigenvector is

<div>
\[
\begin{pmatrix}-2\alpha \\1\alpha \end{pmatrix}
\]
</div>

If $y$ increase by $1$, then $x$ increase by $-2$.
If $y$ increase by $\alpha$, then $x$ increase by $-2\alpha$.

<hr class="sr">

## Step 3 (1)

<div class="overflow-auto">
\[
\begin{split}\begin{cases}
1x + 2y = 5x\\
2x + 4y = 5y
\end{cases}
=
\begin{cases}
-4x + 2y = 0\\
2x + -1y = 0
\end{cases}
=^{collinearity}
\begin{cases}
2x + -1y = 0
\end{cases}
=
\begin{cases}
2x = y
\end{cases}\end{split}
\]
</div>

The second eigenvector is

<div>
\[
\begin{pmatrix}1\alpha \\2\alpha \end{pmatrix}
\]
</div>

If $x$ increase by $1$, then $y$ increase by $2$.
If $x$ increase by $\alpha$, then $y$ increase by $2\alpha$.

<hr class="sl">

## Step 4

We can create $P$

<div class="overflow-auto">
\[
\begin{split}P = \begin{pmatrix}-2&1\\1&2\end{pmatrix}\end{split}
\]
</div>

<hr class="sr">

## Step 5

We solve $P^{-1}$

<div class="overflow-auto">
\[
\begin{split}\begin{pmatrix}-2&1&  | & 1 & 0 \\1&2 & | & 0 & 1\end{pmatrix}
\Leftrightarrow^{L1  \leftarrow L1 + 3L2}
\begin{pmatrix}1&7&  | & 1 & 3 \\1&2 & | & 0 & 1\end{pmatrix}
\Leftrightarrow^{L2  \leftarrow L2 + -1*L1}
\\
\begin{pmatrix}1&7&  | & 1 & 3 \\0&-5 & | & -1 & -2\end{pmatrix}
\Leftrightarrow^{L2  \leftarrow L2 + -\frac{1}{5}}
\begin{pmatrix}1&7&  | & 1 & 3 \\0&1 & | & \frac{1}{5} & \frac{2}{5}\end{pmatrix}
\\
\Leftrightarrow^{L1  \leftarrow L1 + -7*L2}
\begin{pmatrix}1&0&  | & -\frac{2}{5} & \frac{1}{5} \\0&1 & | & \frac{1}{5} & \frac{2}{5}\end{pmatrix}
\\\text{giving us} \ P^{-1} =
\begin{pmatrix}-\frac{2}{5} & \frac{1}{5} \\\frac{1}{5} & \frac{2}{5}\end{pmatrix}\end{split}
\]
</div>

<hr class="sl">

## Step 6

We can create $P$

<div class="overflow-auto">
\[
\begin{split}A^n=PD^nP^{-1}=\begin{pmatrix}-2&1\\1&2\end{pmatrix} * \begin{pmatrix}0^n&0\\0&5^n\end{pmatrix}
* \begin{pmatrix}-\frac{2}{5} & \frac{1}{5} \\\frac{1}{5} & \frac{2}{5}\end{pmatrix}\end{split}
\]
</div>