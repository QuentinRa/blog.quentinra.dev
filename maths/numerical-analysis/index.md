# Numerical analysis

The main goal of this course is to solve
**Ax=b** (find x) on a computer. You will learn

* direct methods
* iterative methods
* differentials methods

You should have some knowledge about matrix such as
inverting a matrix or finding the eigenvalues
(valeur propres).

Most of this course will use ``R`` language
to provide an example of how you could implements
theses.

<hr class="sl">

## Introduction

Calculations are made using a computer so they may be
some mistakes. Here a some "mistakes"

* ``Round-off``: machine may round your numbers
* ``Truncationf``: machine may truncate your numbers
* ``method``: you are using the wrong method
* ``problem``: you are trying to solve the wrong problem
* ``calculation``: you are doing the wrong calculation

You will need

* to estimate your errors (using **norms**)
* estimate the complexity/order of your algorithm

<hr class="sr">

## Norms

<p><b>A norm is a measure of an error</b>.
We usually
used the <code>absolute value</code>
\(|x-x_{found}|\)
to evaluate an error but as you can see bellow, that
was not really useful
</p>

<div class="mb-3">
\[ \displaylines{
x=10^{-6}\\ y=2*10^{-6} \\ 
|x-y|=10^{-6}= \text{small error but y is two times x !!!}} \]
</div>

<p>So we are using the <code>relative value</code>
\( \frac{|x-x_{found}|}{|x|} \)
and we have
\( \frac{|x-y|}{|x|} = 1 = \text{not small} \)
.
</p> 

* [Write norms](norms/basic.md)
* [Condition number](norms/cond.md)

<hr class="sl">

## Direct methods

Calculations are made in one go.

* [Cramer formula](direct/cramer.md)
* [triangular system](direct/triangular.md)
* [Cholesky factorization](direct/cholesky.md)
* [Gauss method](direct/gauss.md)
* [LU factorization](direct/lu.md)

<hr class="sr">

## Iterative methods

<p>
We will iterates some processes and try to have our
values \( x^{(k)} \)  converging to our real values.
In most case, we stop when
\(
\frac{|| A x^{(k)} - b ||}{||b||} \le \epsilon
\)
with epsilon our error. It's a positive value, usually set
as <b>0.001</b>.
</p>

* [How we will do](iterative/how.md)
* [Jacobi method](iterative/jacobi.md)
* [Gauss seidel method](iterative/gauss-seidel.md)
* [SOR method](iterative/sor.md)

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