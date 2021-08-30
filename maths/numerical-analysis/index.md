# Numerical analysis

The goal of this course is to learn how to obtain a numerical approximation of a solution to a mathematical problem, using a computer and algorithms.

<hr class="sl">

# Matrix

The goal of this section is to solve a system on a computer. We will use matrices, and try to solve AX=b. We will have a lot of methods, and we will see their requirements, their implementation in R, and their complexity.

The main goal of this section is to solve **AX=b** (find the vector $X$, given a matrix $A$ and a resulting vector $b$) on a computer. You will learn

* how to solve it using the **direct methods**
* how to solve it using the **iterative methods**
* how to solve it using the **differential methods**

You should have some knowledge about matrices, such as inverting a matrix or finding the eigenvalues (``valeurs propres``). There is a [course on this website](../matrix/index.md), you may find more information there.

Most of this course will use **R language** to provide an example of how you could implement what you learned. 

<hr class="sr">

## Note before starting

A lot of times, we are writing $Ax=b$, but $x$ is a vector, so it's quite disturbing when you are later introducing a variable $x$. I tried replacing $X$ with $x$, when it makes things more readable.

<div>
\[
\begin{split}
\begin{cases}
4x + 2y + 2z = 12 \\
2x + 10y + 7z = -9 \\
2x + 7y + 21z = -20 \\
\end{cases}
\Leftrightarrow \\\\
A = \begin{pmatrix}
4 & 2 & 2 \\
2 & 10 & 7 \\
2 & 7 & 21 \\
\end{pmatrix}
\quad
b = \begin{pmatrix}
12 \\
-9 \\
-20 \\
\end{pmatrix}
\quad
X = \begin{pmatrix}
x \\
y \\
z \\
\end{pmatrix}
\end{split}
\]
</div>

And **the solution is** $X = (4,-1,-1)$. If you're checking, $A * X$ should be equals to $b$. You can also replace $x$ (4), $y$ (-1), and $z$ (-1) in the equations, and check if the system is consistent.

*We will use this system as a reference in every exercise from now on*.

<hr class="sl">

## Introduction

Calculations are made using a computer, so they may be some mistakes. Here a some examples

* Round-off (`arrondi`): the machine may round your numbers
* Truncation (`troncature`): the machine may truncate your numbers
* Method (`méthode`): you are using the wrong method
* Problem (`problème`): you are trying to solve the wrong problem
* Calculation (`calcul`): you are doing the wrong calculation

Hence, we will need before starting,

* to estimate our errors (using **norms**)
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

An iterative method is a method approaching $X$. We are calling $X^{(k)}$, the result after $k$ iterations. We are usually stopping when the estimated error is lesser than $\epsilon$, the greatest error we are allowing.

* estimated error: $\frac{|| A X^{(k)} - b ||}{||b||}$
* epsilon is a positive value, usually we are using **0.001**
* stop when $\frac{|| A X^{(k)} - b ||}{||b||} \le \epsilon$

The algorithms you may use are

* [How we will do](iterative/how.md)
* [Jacobi method](iterative/jacobi.md)
* [Gauss–Seidel method](iterative/gauss-seidel.md)
* [Successive over-relaxation (SOR) method](iterative/sor.md)

<hr class="sl">

# Ordinary differential equation (ODE)

An **differential equation**  is an equation that relates one or more derivatives of an unknown functions. If every derivative of the unknown functions are of one independent variable, the differential equation is called an **Ordinary differential equation**, in contrast of a **partial differential equation**. The order of an ODE is the highest derivative.

### Example

$y\prime (x) = y(x)$ is a first-order ordinary differential equation, while $\frac{\partial y}{\partial t} + \frac{\partial y}{\partial x} = 0$ is not.

<hr class="sr">

## Linear differential equation

A **linear differential equation** is a differential equation of the form 
<div>
\[ a_0(x) y + ... + a_n(x) y^{(n)} = b(x) \]
</div>

where $a_0, ..., a_n, b$ are diffentiable equations.

### First-order linear differential equation

A **first-order linear differential equation** is a linear differential equation of the form 
<div>
\[  y\prime +a(x) y = b(x) \quad\quad (E)\]
</div>
that we know how to solve, and that you should know how to too.

There is two cases :

* If $b(x) = 0$, the solutions of $(E)$ are $y =\lambda e^{-A(x)}$ where $A$ is a primitive of $a$ and $\lambda \in \mathbb K$.
* Else, the solution of $(E)$ are $y =\lambda e^{-A(x)} + y_0$ where $y_0$ is a solution of $(E)$, that could be easily finded (or with a method).

### Examples

* A solution of $y\prime = y$, which is equivalent to $y\prime - y = 0$, is $y = \exp$.
* Let $a > 0, b\in\mathbb R$ and $(E) : y\prime =- ay + b$, which is equivalent to $y\prime + ay = b$
	* The solutions of $y\prime + ay = 0$ are $\lbrace \lambda e^{-ax}| \lambda\in\mathbb R \rbrace$.
	* A solution of $(E)$ is $y_0 = \frac ba$.
	* So we could conclude that the solutions of $(E)$ are of the form $y_0 + \lambda e^{-ax}$, where $\lambda\in\mathbb R$ .

<hr class="sl">

## Sources

* <https://fr.wikipedia.org/wiki/Cat%C3%A9gorie:Analyse_num%C3%A9rique>
* <https://en.wikipedia.org/wiki/Ordinary_differential_equation>
* <http://math.univ-bpclermont.fr/~cindea/blog/post/intro-ana-num-interet/>
* <https://www.math.univ-paris13.fr/~halpern/teaching/MACS1_2010/systemes.pdf>
* <https://www.i2m.univ-amu.fr/perso/thierry.gallouet/licence.d/anum.d/anum-tg2.pdf>
* <https://www3.nd.edu/~zxu2/acms40390F12/Lec-7.3.pdf>
* <https://www.dcode.fr/norme-vecteur>
* <http://bibmath.net/dico/index.php?action=affiche&quoi=./r/relaxation.html>
* <https://www.sciencedirect.com/topics/engineering/gauss-seidel-method>
* <https://mathworld.wolfram.com/topics/RelaxationMethods.html>
* <https://www.mathportal.org/calculators/matrices-calculators/matrix-decomposition-calculator.php>
* <https://aaronschlegel.me/cholesky-decomposition-r-example.html>