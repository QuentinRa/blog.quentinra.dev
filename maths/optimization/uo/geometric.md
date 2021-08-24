# Geometric programming (GP)

[Go back](..)

This is some sort of constrained optimization, but the only constraint is that all values are strictly positives. Usually, that's some function looking like that

<div>
\[
\min_{x \gt 0,\ \ y \gt 0} g(X) = ... + ... + ...
\]
</div>

Having **m** terms and **n** variables (and X is the vector of variables).

<hr class="sl">

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

Write a system of equations using the matrix. 
A column of your matrix is a row of the system. 
Each row of your matrix is a variable
``delta_i`` where i is the row number.
Each line of the system is equal to *0*.

<p>\[\sum\limits_{i=1}^{m} \alpha_{ij}\delta_{i} = 0\]</p>

Then add another equation: **the sum of all deltas is 1**.
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
Then as you could guess, try to check if these values in
your gradient is giving a vector of zeros.

<hr class="sr">

## Example

Apply the steps on

<p>
\[
\min_{x \gt 0,\ \ y \gt 0} g(x, y) = 8x + \frac{y}{x}+ \frac{1}{y}
\]
</p>

**Create the matrix**

<p>
\[
\begin{pmatrix}
1 & 0 \\
-1 & 1 \\
0 & -1
\end{pmatrix}
\]
</p>

The first line is 1 (x power is 1) and 0 (y not found)
in 8x.

**System**

We got 2 equations (the last two)
since we had 2 columns and 3 deltas since
we got 3 lines in our matrix.

<p>
\[
\begin{split}\left\lbrace\begin{array}{l}
\delta_{i}>0  \,\,\forall i=1,2,3  \\
\delta_{1} + \delta_{2} + \delta_{3} = 1 \\
\delta_{1} - \delta_{2} =0 \\
\delta_{2} - \delta_{3} =0 \\
\end{array}\right.\end{split}
\]
</p>

The 3rd line is ``1 delta1 -1 delta2 + 0 delta3``
since we got (1,-1,0) in our first column.

Let's solve this

<p>
\[
\begin{cases}
(1) & \delta_{1} = \delta_{2} \ so\ \ \delta_{2} = \delta_{1} \\
(2) & \delta_{2} = \delta_{3}\\
but & \delta_{1} + \delta_{2} + \delta_{3} = 1\\
so\ (3) & \delta_{2} + \delta_{2} + \delta_{2} = 1\\
(4) & 3 \delta_{2} = 1 \\
(5) & \delta_{2} = 1/3 \\
so & \delta_{1} = \delta_{2} = \delta_{3} = 1/3 \\
\end{cases}
\]
</p>

**Find the solution**

<p>
\[
\nu(\delta)= (\frac{8}{\frac{1}{3}}) ^ {\frac{1}{3}} *
        (\frac{1}{\frac{1}{3}}) ^ {\frac{1}{3}} * (\frac{1}{\frac{1}{3}}) ^ {\frac{1}{3}} *
= 24 ^ {\frac{1}{3}} *  3 ^ {\frac{1}{3}} * 3 ^ {\frac{1}{3}}
= 8 ^ {\frac{1}{3}} * 3 ^ {\frac{1}{3} + \frac{1}{3} + \frac{1}{3}}
= 8 ^ {\frac{1}{3}} * 3
= 2 * 3 = 6
\]
</p>

**critical point?**

<p>
\begin{split}\left\lbrace\begin{array}{l}
8x = 2 \\  \\
\frac{y}{x} = 2 \\  \\
\frac{1}{y} = 2
\end{array}\right.\end{split}
</p>

Note that 2 is equals to ``6 (sol) * 1/3 (delta_i)``.
We got 

<p>
\[
\begin{cases}
x*=2/8=1/4\\
y*=1/2
\end{cases}
\]
</p>

The gradient is

<p>
\[
\begin{split}\nabla f(X) = \begin{pmatrix}   8 - y/x^2  \\   1/x - 1/y^2 \\\end{pmatrix}\end{split}
\]
</p>

<p>
\[
\begin{cases}
8 - (1/2)/(1/4)^2 = 0 \\
1/(1/4) - 1/(1/2)^2 = 0
\end{cases}
\]
</p>

So that's a critical point!

**not convex?**

<p>
\[
\begin{split}Hf(X) = \begin{pmatrix}
2y/x^3 & -1/x^2 \\
-1/x^2 & 2/y^3 \\
\end{pmatrix}\end{split}
\]
</p>

Complete here... You must find a point giving us
an indefinite hessian.