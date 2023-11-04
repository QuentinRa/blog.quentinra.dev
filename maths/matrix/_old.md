# Eigendecomposition of a matrix

This is called `Réduction d’endomorphisme` in French. The goal is to calculate $A^n$ or $exp(A)$. Our goal is to calculate some matrix so that we have $A^n = P * D^n * P^{-1}$

* $D$: diagonal matrix, the eigenvalues of $A$ are on the diagonal
* $P$: an invertible matrix so that we have our formula

Some vocabulary

* Eigendecomposition: $A x = \lambda x$
* an **eigenvector** (`Vecteur propre`): $x$
* an **eigenvalue** (`Valeur propre`): $\lambda$
* **Spectrum** of a matrix $\sigma(A)$: set of all eigenvalues
* Rho, $\rho$ : the highest eigenvalue

You get the eigenvalues (according to Cayley–Hamilton theorem) by solving the following **characteristic polynomial** (`Polynôme caractéristique`). The polynomial's **degree** (`degré`) is $n$.

@
det(\lambda{I_n}-A_n) = 0
@

* [Eigendecomposition - steps](eigen/steps.md)
* [Eigendecomposition - example](eigen/example.md)