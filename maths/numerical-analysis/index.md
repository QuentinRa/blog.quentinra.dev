# Numerical analysis

The main goal of this course is to solve **Ax=b** (find the vector $x$, given a matrix $A$ and a resulting vector $b$) on a computer. You will learn

* how to solve it using the **direct methods**
* how to solve it using the **iterative methods**
* how to solve it using the **differential methods**

You should have some knowledge about matrices, such as inverting a matrix or finding the eigenvalues (``valeurs propres``). There is a [course on this website](../matrix/index.md), you may find more information there.

Most of this course will use **R language** to provide an example of how you could implement what you learned.

<hr class="sl">

## Introduction

Calculations are made using a computer, so they may be some mistakes. Here a some "mistakes"

* Round-off (`arrondi`): the machine may round your numbers
* Truncation (`troncature`): the machine may truncate your numbers
* Method (`méthode`): you are using the wrong method
* Problem (`problème`): you are trying to solve the wrong problem
* Calculation (`calcul`): you are doing the wrong calculation

You will need

* to estimate your errors (using **norms**)
* estimate the complexity/order of your algorithm

<hr class="sr">

## Norms

**A norm is a measure of an error**. We were using the **absolute value** $|x-x_{found}|$ to evaluate an error but as you can see below, that was not really useful

<div class="mb-3">
\[ \displaylines{
x=10^{-6}\\ x_{found}=2*10^{-6} \\ 
|x-x_{found}|=10^{-6}= \text{small error but $x_{found}$ is two times x !!!}}
\]
</div>

So we are using the **relative value** $\frac{|x-x_{found}|}{|x|}$ and we have $\frac{|x-x_{found}|}{|x|} = 1 = \text{not small}$.

* [Write norms](norms/basic.md)
* [Condition number](norms/cond.md)

<hr class="sl">

## Direct methods

Calculations are made in one go.

* [Cramer's rule](direct/cramer.md)
* [Triangular system](direct/triangular.md)
* [Cholesky factorization](direct/cholesky.md)
* [Gaussian elimination](direct/gauss.md)
* [LU factorization](direct/lu.md)

<hr class="sr">

## Iterative methods

An iterative method is a method approaching $x$. We are calling $x^{(k)}$, the result after $k$ iterations. We are usually stopping when the estimated error is lesser than $\epsilon$, the greatest error we are allowing.

* estimated error: $\frac{|| A x^{(k)} - b ||}{||b||}$
* epsilon is a positive value, usually we are using **0.001**
* stop when $\frac{|| A x^{(k)} - b ||}{||b||} \le \epsilon$

The algorithms you may use are

* [How we will do](iterative/how.md)
* [Jacobi method](iterative/jacobi.md)
* [Gauss–Seidel method](iterative/gauss-seidel.md)
* [Successive over-relaxation (SOR) method](iterative/sor.md)

<hr class="sl">

## Sources

* <https://fr.wikipedia.org/wiki/Cat%C3%A9gorie:Analyse_num%C3%A9rique>
* <http://math.univ-bpclermont.fr/~cindea/blog/post/intro-ana-num-interet/>
* <https://www.math.univ-paris13.fr/~halpern/teaching/MACS1_2010/systemes.pdf>
* <https://www.i2m.univ-amu.fr/perso/thierry.gallouet/licence.d/anum.d/anum-tg2.pdf>
* <https://www3.nd.edu/~zxu2/acms40390F12/Lec-7.3.pdf>
* <https://www.dcode.fr/norme-vecteur>
* <http://bibmath.net/dico/index.php?action=affiche&quoi=./r/relaxation.html>
* <https://www.sciencedirect.com/topics/engineering/gauss-seidel-method>
* <https://mathworld.wolfram.com/topics/RelaxationMethods.html>