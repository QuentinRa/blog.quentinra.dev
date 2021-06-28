# Primal and dual

[Go back](..)

You will have to write a Lagrangian like this

<span class="mathjax_process">
\(
L(X, \mu, \lambda) = f(X) + 
\sum_{i=1}^{m} \mu_i * h_i(X) + 
\sum_{i=1}^{p} \lambda_i * g_i(X)
\)
</span>

* **X** is a vector of all your variables like (x,y, ...)
* **mu** and **lambda** are Lagrange multipliers (unknowns=`inconnues`
  that we will be looking for)
* **gi** are the inequalities constraints (*)
* **hi** are the equalities constraints (*)

(*) p is the number of inequalities and m the 
number of equalities that could be 0. Note that
you must write the equation as ``... = 0`` and
your function is the left-side.

* Once you got **L**, write what we call
the **KKT** (Karush-Kuhn-Tucker) conditions

<p class="mathjax_process">
\(
\nabla L(X, \mu, \lambda) = 0
\)
</p>

* and solve it

You will do the partial derivative of 
the Lagrangian for each of your variables
equals to 0. That's a system so you "simply"
have to solve it.

<hr class="sr">

## Alternative

Do not use this method, it's quite simple but not
what we are expecting you to do, and not as powerful
as the real one.

You got a function ``f`` under constraints
to minimize, then that's means you'll have to
maximum the dual solution.

Let's say you got a vector ``b`` which are the
right-site of your inequalities, then the function
to maximize in the dual will have the b values as
indices for x,y, (n variables if b length = n)...

* write your new function ``f'`` using ``b``,
  b is a vector of values
* write a matrix of the coefficients of your 
  constraints. The first column will be the
  first constraint coefficient in ``f'``. The
  right-side is ``<= ?`` with `?` the coefficient
  of the first variable (since first column) in ``f``
* now you got a new function, new constraints
* then optimize the function using any method you 
  know of (simplex? polygon?...)
* you got ``x*, y*, ...``
* replace in each constraint, if the left-side
  is equals to the right-side, then the constraint
  is said to be **binding** (`saturée` in French). 
  If the constraint is not bound, then that's means
  in the ``primal``, the constraint is null (=0).
* now, maybe you got rid of one or more variables