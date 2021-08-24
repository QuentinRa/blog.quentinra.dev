# Eigendecomposition steps

[Go back](../index.md#eigendecomposition-of-a-matrix)

The steps for the eigendecomposition are

* calculate $\lambda{I_n}-A_n$
* solve the lambdas (eigenvalues) in $det(\lambda{I_n}-A_n) = 0$
  * you should have $n$ eigenvalues $\lambda_n$
  * the order does not matter
* Now you got $D$, the eigen values are on the diagonal
* **for each eigen value**
  * solve $A = \lambda x$
  * you can write write it as a system

<div>
\[
\begin{split}\left \{
\begin{array}{r c l}
ax + by + ... = \lambda * x \\
...
\end{array}
\right .\end{split}
\]
</div>

* each result (the vector (x,y, ...)) is a eigenvector
* by concatenating all of your eigenvectors, you get $P$
* solve $P^{-1}$
* check $P*D^1*P^{-1}=A$