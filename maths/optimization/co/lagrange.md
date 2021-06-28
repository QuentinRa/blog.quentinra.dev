# Primal and dual

[Go back](..)

If you only have **equality constraints**, then 

* write all of your constraints, called h, equals to 0
* then write the Lagrangian L like this, with X
a vector of your variables
  
<span class="mathjax_process">
\(
L(X, \mu) = f(X) + \sum_{i=1}^{m} \mu_i * h_i(X)
\)
</span>

with mu the variables called Lagrange multipliers
and the values we will look for.

* Write the KKT (Karush-Kuhn-Tucker) conditions

<span class="mathjax_process">
\(
\nabla L(X, \mu) = \nabla f(X)+ \sum_{i=1}^{m} \mu_i * \nabla h_i(X)
= 0
\)
</span>

You can write a system and solve it, each equation must be equals
to 0 (and the equations ar the partial derivatives
of the Lagrangian for each variable).

* solve the system, you got x*, y*, ... = X*
  so your critical point. You will also find the
  lambda = Lagrange multipliers.

<hr class="sr">

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