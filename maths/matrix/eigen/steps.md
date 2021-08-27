# Eigendecomposition steps

[Go back](../index.md#eigendecomposition-of-a-matrix)

The steps for the eigendecomposition are

* calculate $\lambda{I_n}-A_n$
* solve the lambdas (eigenvalues) in $det(\lambda{I_n}-A_n) = 0$
  * you should have $n$ eigenvalues $\lambda_n$
  * the order does not matter
* Now you got $D$, the eigenvalues are on the diagonal
* **for each eigenvalue**
  * you can solve $A - \lambda_n * Id_n = 0$
  * you can write it as a system

<div>
\[
\begin{split}\left \{
\begin{array}{r c l}
(a_1 - \lambda_n) x + b_1 y + ... = 0 \\
a_2 x + (b_2 - \lambda_n) y + ... = 0 \\
...
\end{array}
\right .\end{split}
\]
</div>

* each result (the vector (x,y, ...)) is an eigenvector
* by concatenating all of your eigenvectors, you get $P$
* solve $P^{-1}$
* check $P\*D^1\*P^{-1}=A$