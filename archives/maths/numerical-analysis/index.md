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

A **differential equation**  is an equation that relates one or more derivatives of unknown functions.

If every derivative of the unknown functions is of one, independent variable, the differential equation is called an **Ordinary differential equation**, in contrast to a **partial differential equation**. The order of an ODE is the highest derivative.

### Example

$y\prime (x) = y(x)$ is an ordinary differential equation, while $\frac{\partial y}{\partial t} + \frac{\partial y}{\partial x} = 0$ is not.

More specifically, $y\prime (x) = y(x)$, that we generally write $y\prime - y = 0$, is a first-order linear differential equation.

<hr class="sr">

## Linear differential equation

A **linear differential equation** is a (ordinary) differential equation of the form 
<div>
\[ a_0(x) y + ... + a_n(x) y^{(n)} = b(x) \]
</div>

where $a_0, ..., a_n, b$ are differentiable functions.

### First-order linear differential equation

A **first-order linear differential equation** is a linear differential equation of the form 
<div>
\[  y\prime +a(x) y = b(x) \quad\quad (E)\]
</div>
that we know how to solve, and that you should know how to too.

There are two cases:

* If $b(x) = 0$, the solutions of $(E)$ are $y =\lambda e^{-A(x)}$ where $A$ is a primitive of $a$ and $\lambda \in \mathbb K$.
* Else, the solution of $(E)$ are $y =\lambda e^{-A(x)} + \tilde y$ where $\tilde y$ is a solution of $(E)$, that could generally easily be "guessed" ~~depending on the kindness of your teacher (more seriously, a method exists to find it if it is not the case)~~.

### Examples

* A solution of $y\prime = y$, which is equivalent to $y\prime - y = 0$, is $y = \exp$.
* Let $a > 0, b\in\mathbb R$ and $(E) : y\prime =- ay + b$, which is equivalent to $y\prime + ay = b$
	* The solutions of $y\prime + ay = 0$ are $\lbrace \lambda e^{-ax}| \lambda\in\mathbb R \rbrace$.
	* A solution of $(E)$ is $\tilde y = \frac ba$.
	* So we could conclude that the solutions of $(E)$ are of the form $\frac ba + \lambda e^{-ax}$, where $\lambda\in\mathbb R$ .

<hr class="sr">

## Why do we use a computer?

If we can solve an ODE and find the solutions, why do we need to use a computer? Because, in fact, we couldn't solve every ODE, the example of the first-order linear differential equation given in the previous section is an exception. That is why we use a computer, with which we can approximate the solution.

However, if you were attentive, you could notice in the previous examples that their solutions are not unique. In fact, there are infinite solutions to an ODE, which is a problem when we want to approximate something.

## Cauchy, or it's better when it's unique

To have a problem with a unique solution, we add constraints by fixing values to a certain point (there is the same number of constraints that the order of the ODE).

For example, $y\prime = y$ has $x\mapsto 0,\quad x\mapsto \exp (x),\quad x\mapsto 42\times \exp (x) $ as solutions, but $\exp$ is the unique solution to the problem
<div>
	\[ \left\lbrace \begin{array}{l}
		y\prime = y \\
		y(0) = 1
	\end{array} \right .\]
</div>

These problems, when we have a differential equation and initials values, are called **Cauchy problems**. 

Under certain conditions, the [Cauchy–Lipschitz theorem](https://en.wikipedia.org/wiki/Picard%E2%80%93Lindel%C3%B6f_theorem) ensures that the solution exists and is unique.

<hr class="sr">

## Euler

Let a Cauchy problem:
<div>
	\[ (E) : \left\lbrace \begin{array}{l}
		y\prime = f(t, y(t)) \\
		y(0) = y_0
	\end{array} \right .\]
</div>

that we want to approximate on the interval $[a, b]$.

We discretize $[a, b]$ in $N\in\mathbb N^*$ values : $t_0 = a < t_1 < ... < t_{N-1} < t_N = b$ .

Our goal is to approximate the solution with a sequence <br/>
$z_0 = y(t_0), z_1 \approx y(t_1), \dots, z_k \approx y(t_k), \dots , z_{N-1} \approx y (t_{N-1}$).

* [Taylor: the origin](ode/taylor.md)
* [Forward](ode/forward.md)
* [Backward](ode/backward.md)
* [Matrix: Reloaded](ode/matrix.md)

<hr class="sr">
	
## Runge-Kutta
	
Instead of calculating the $z_{k+1}$ directly, we calculate some intermediate values $k_i$ before.

The forward Euler method is a Runge-Kutta method (RK1), while the most used is RK4.

### The fundamental

The Runge-Kutta methods are based on the **fundamental theorem of calculus** :
<div>
	\[
	y(t + h) = y(t) + \int_t^{t+h} y\prime (x)dx
	\]
</div>

Applied to the ODE, we've got :
<div>
	\[
	y(t_{n+1}) = y(t_n) + \int_{t_n}^{t_{n+1}} f(x, y(x)) dx
	\]
</div>

What we do in the RK method is to approximate the integral with a quadrature rule.

### RK4
	
This method is more effective and easy to implement.

The sequence is defined like this : $z_0 = y_0$ and for all $0 < n < N$ :
<div>
	\[
	\left \lbrace
	\begin{array}{l}
		k_1 = f( t_n, z_n) \\
		\displaystyle k_2 = f \left ( t_n + \frac 12 h_n,  z_n + h_n\times \frac 12 k_1 \right ) \\
		\displaystyle k_3 = f \left ( t_n + \frac 12 h_n,  z_n + h_n\times \frac 12 k_2 \right ) \\
		\displaystyle k_4 = f \left ( t_n +  h_n,  z_n + h_n\times k_3 \right ) \\
		\displaystyle z_{n+1} = z_n + h_n \times \frac 16 \left ( k_1 + 2 k_2 + 2k_3 + k_4 \right )\\
	\end{array}
	\right .
	\]
</div>

with $h_n = t_{n+1} - t_n$ .

The coefficient could be summarize in the Butcher tableau :

<div>
	\[
	\begin{array}{r|llll}
		h_n & k_1 & k_2 & k_3 & k_4\\\\
		0 & {\color{blue} 0}  & 0 & 0 & 0\\\\
		\displaystyle \frac 12 & \displaystyle \frac 12 & {\color{blue} 0} & 0 & 0 \\\\
		\displaystyle \frac 12 & 0 & \displaystyle \frac 12 & {\color{blue} 0} & 0 \\\\
		1 & 0 & 0 & 1 & {\color{blue} 0} \\
		\hline \\
		&  \displaystyle \frac 16 & \displaystyle \frac 26  & \displaystyle \frac 26 & \displaystyle \frac 16
	\end{array}
	\]
</div>

We could easily see that it is an explicit method  because there is only zero in the <span style="color:blue;">blue diagonal</span> (each intermediate value don't depend of itself).

### Reference

* <https://fr.wikipedia.org/wiki/M%C3%A9thodes_de_Runge-Kutta>
* <https://en.wikipedia.org/wiki/Runge–Kutta_methods>

If you can understand French, [here is a short video](https://youtu.be/8SU_HBvmZS0?t=683) to show you a fun example of this course.

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
* <https://en.wikipedia.org/wiki/Condition_number>