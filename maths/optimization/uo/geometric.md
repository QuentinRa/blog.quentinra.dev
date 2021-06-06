# Geometric programming (GP)

[Go back](..)

This is some sort of constrained optimization but the only
constraint is that all values are strictly positives.

Usually, that's some function looking like that

<div>
\[
\min_{x \gt 0,\ \ y \gt 0} g(X) = ... + ... + ...
\]
</div>

Having **m** terms and **n** variables (here X is the set of variables).

<div class="sl"></div>

## Steps

**Matrix**

<p>
Create a matrix <span>\(M_{m,n}\)</span> so we
will have <b>m</b> rows and <b>n</b> columns.
A value such as <span>\(a_{i,j}\)</span>
is the power of the <b>j</b>-nth variable in the
<b>i</b>-nth term.
</p>

* ``0`` if not found
* ``1`` if no power
* ``-n`` if the variable is under a fraction bar
* ``n`` else

**System**

Write a system of equals using the matrix. A column of your matrix 
is a row of the system. Each row of your matrix is a variable
``delta_i`` where i is the row number. Each line of the system
is equal to *0*.

<p>\[\sum\limits_{i=1}^{m} \alpha_{ij}\delta_{i} = 0\]</p>

Then add another equation : **the sum of all deltas is 1**.
And solve and find all deltas.

<div><b>Find the solution</b> \(\nu\) (nu)</div>

<p>
Simply evaluate this equation with the values that you found.
Note that <span>\(c_i\)</span> stands for the coefficient of i-nth term.
</p>

<div>
\[
\nu(\delta)=\prod\limits_{i=1}^{m} \big( \frac{c_{i}}{\delta_{i}}\big)^{\delta_{i}}
\]
</div>

**Check it's a critical point**

<div>
System of equations, for each terms m, you write
the term equals to <span>\(\nu(\delta) * delta_i\)</span>
</div>

You solve the system, and will have ``x*``, `y*`, ...
Then as you could guess, try to check if theses values in
your gradient are giving a vector of zeros.