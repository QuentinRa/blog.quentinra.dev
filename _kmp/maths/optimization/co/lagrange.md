# Primal and dual

[Go back](..)

This is a method allowing us to transform a constrained problem (primal), into an unconstrained problem (dual).

<hr class="sl">

You will have to write a Lagrangian like this

<span class="mathjax_process">
\(
L(X, \mu, \lambda) = f(X) + 
\sum_{i=1}^{m} \mu_i * h_i(X) + 
\sum_{i=1}^{p} \lambda_i * g_i(X)
\)
</span>

* **X** is a vector of all your variables like (x,y, ...)
* **mu** and **lambda** are Lagrange multipliers (unknowns=`inconnues` that we will be looking for)
* **gi** are the inequalities constraints (*)
* **hi** are the equalities constraints (*)

(*) p is the number of inequalities and m the number of equalities that could be 0. Note that you must write the equation as `... = 0` and your function is on the left side.

* Once you got **L**, write what we call the **KKT** (Karush-Kuhn-Tucker) conditions

<p class="mathjax_process">
\(
\nabla L(X, \mu, \lambda) = 0
\)
</p>

* and solve it

You will do the partial derivative of the Lagrangian for each of your variables equals 0. That's a system, so you "simply" have to solve it.

**Note**: my teachers are only calculating all the partial derivatives of the variables (x,y,...), but some are also doing it for lambda.

You will get your critical point `X*` (x*, y*, ...) and your unknowns (mu1, ..., lambda1, ...).

<hr class="sr">

## Lagrangian / KKT Help

In a lot of cases, finding the unknowns is not as easy as solving the system, especially if you have inequality constraints. Most of the time, you will still have lambda/mu inside X*.

Lambdas/mus are positive or null, so you might have a 

* if (lambda == 0), X*=...
* else X*=...
* do not forget to eliminate solution not passing the conditions.

<hr class="sr">

## Primal and dual

Also, when you got inequality constraints, then most of the time you will have more work to do. It seems that before doing so, we should check that the points to be **regulars** (I'm sure of it, but my teacher does not seem to be doing it).

A primal problem **P**

<p>
\[
\min\limits_{X} f(X)\ s.c.\ 
\begin{cases}
h(X) = 0\\
g(X) \le 0
\end{cases}
\]
</p>

is the same as maximizing a dual problem **D**

<p>
\[
\max\limits_{\lambda\ge0,\mu\ge0} \theta(\lambda,\mu)
= \inf\limits_{\lambda\ge0,\mu\ge0} L(X, \mu, \lambda)
\]
</p>

* **note**: if a g(X) is violated (>0) then the only way to have the maximum is for mu/lambda to be 0.
* **note 2**: inf for min (or sup instead of max) but I think this doesn't really matter (to your casual student).
* **note 3**: If the constraints are greater equals than 0, simply multiply by minus 1.

If the **duality gap** (`saut de dualité`) between P and D is 0 (meaning the dual is equals to the primal) then there is no duality gap.

Note that the dual problem is an unconstrained problem, so you can solve it using what we learned before.

<hr class="sl">

## Alternative

Do not use this method, it's quite simple, but that's not what we are expecting you to do, and not as powerful as the real one.

You got a function `f` under constraints to minimize, then that means you'll have to maximum the dual solution.

Let's say you got a vector `b` which is the right-side of your inequalities, then the function to maximize in the dual will have the b values as indices for x,y, (n variables if b length = n)...

* write your new function `f'` using `b`, b is a vector of values
* write a matrix of the coefficients of your constraints. The first column will be the first constraint coefficient in `f'`. The right-side is `<= ?` with `?` the coefficient of the first variable (since the first column) in `f`
* now you got a new function, new constraints
* then optimize the function using any method you know of (simplex? polygon?...)
* you got `x*, y*, ...`
* replace in each constraint, if the left-side is equal to the right side, then the constraint is said to be **binding** (`saturée` in French). If the constraint is not bound, then that's means in the `primal`, the constraint is null (=0).
* now, maybe you got rid of one or more variables