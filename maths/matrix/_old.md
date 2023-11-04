# Matrix inversion

* You can calculate the determinant
  * using the [cofactor expansion](inversion/minor.md)
  * using [GAUSS elimination](inversion/gauss-det.md)

Then, once you have checked the determinant, you can invert a matrix using

* using [GAUSS elimination](inversion/gauss-inv.md)
* using [the cofactor matrix "comatrix"](inversion/comatrix.md)

<hr class="sr">

## Definiteness of a matrix

Many times, you will be asked to check the definiteness of a matrix. You can either find the eigenvalues ($\lambda$, as you can learn in the next section), or check the leading minors ($\Delta$, that you will learn in this section).

|          Name              | **eigenvalues** | **minors** |
|----------------------------|-----------------|-----------------|
| **positive definite** <br> `définie positive`| $\forall k,\quad \lambda_k \gt 0$ | $\forall k,\quad \Delta_k  \gt 0$ |
| **positive semi-definite**<br>`semi-définie positive`| $\forall \text{k aside $k=e$},\quad \lambda_k \gt 0,\quad \lambda_{e} = 0$ | $\forall k < n,\quad \Delta_{k}>0 \text{. and } \Delta_{n}=0$ |
| **negative definite** <br> `définie négative` | $\forall k,\quad \lambda_k \lt 0$ | $\forall k,\quad (-1)^k \Delta_k \gt 0$ |
| **negative semi-definite** <br>`semi-définie négative` | $\forall \text{k aside $k=e$},\quad \lambda_k \lt 0,\quad \lambda_{e} = 0$ | $\forall k < n,\quad (-1)^k\Delta_{k}>0 \text{. and } \Delta_{n}=0$ |
| **indefinite** <br> `indéfinie`| $\exists k\exists n,\quad \lambda_k \gt 0,\quad \lambda_n \lt 0$ | $\Delta_{n} < 0$, and the dimension n is pairwise |

* [Leading minors of a matrix](inversion/minor-lead.md)
* [Leading minors of a matrix - example](inversion/minor-ex.md)

<hr class="sl">

## Eigendecomposition of a matrix

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