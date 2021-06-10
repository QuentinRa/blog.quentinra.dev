# Using the gradient and the hessian

[Go back](..)

Now that you have the **gradient**, you need to test
each values for your variables x,y,... where you have

<p>
\[ \nabla f(X) = \begin{pmatrix}0\\\vdots\\0\end{pmatrix} \] 
</p>

When you got your points, if you got one then that's the minimum
(global), else you need to replace for each point x,y,z,...
inside your hessian. For each hessian, if it's

* **definite positive**: point is a minimum local (strict)
* **definite negative**: point is a maximum local (strict)
* **definite semi-positive**: point is a minimum global
* **definite semi-negative**: point is a maximum global
* **indefinite**: saddle point

In order to know the definite/indefinite properties, you can

1. evaluate each determinant, using the minor of a matrix
2. check eigenvalues

<div class="sr"></div>

**Minor of a matrix**

<p>
\begin{split}A= \begin{pmatrix}
        a_{11} & a_{12} & \cdots & a_{1n} \\
        a_{21} & a_{22} & \cdots & a_{2n} \\
        \vdots & \vdots & \ddots & \vdots \\
        a_{n1} & a_{n2} & \cdots & a_{nn}
 \end{pmatrix}\end{split}
</p>

<div>
Then the minor would be
<span>\(\Delta_{i}=det(A_{i})\)</span>
giving us something like
<ul>
<li>\(\Delta_{1}=a_{11}\)</li>
<li>\(\Delta_{2}=det A_{2}= \begin{pmatrix}a_{11} & a_{12} \\ a_{21} & a_{22}\end{pmatrix} = a_{11} * a_{22} - a_{12} * a_{21}\)</li>
<li>...</li>
<li>\(\Delta_{n}=det(A)\)</li>
</ul>
</div>

Then

<ul>
    <li><b>definite positive</b>: <span>\(\forall k, \Delta_{k}>0\)</span></li>
    <li><b>semi-definite positive</b>: <span>\(\forall k, (-1)^k\Delta_{k}>0\)</span></li>
    <li><b>definite negative</b>: <span>\(\forall k < n, \Delta_{k}>0 \text{. and } \Delta_{n}=0\)</span></li>
    <li><b>semi-definite negative</b>: <span>\(\forall k < n, (-1)^k\Delta_{k}>0 \text{. and } \Delta_{n}=0\)</span></li>
    <li><b>indefinite</b>: <span>\(\Delta_{n} < 0\)</span> and the dimension n is pair</li>
</ul>

Some help for matrix 2x2

<ul>
    <li>\(\Delta_{1} \gt 0 \text{ and } \Delta_{2} \gt 0 \) : minimum local</li>
    <li>\(\Delta_{1} \gt 0 \text{ and } \Delta_{2} \lt 0 \) : saddle point</li>
    <li>\(\Delta_{1} \lt 0 \text{ and } \Delta_{2} \gt 0 \) : maximum local</li>
    <li>\(\Delta_{1} \lt 0 \text{ and } \Delta_{2} \lt 0 \) : saddle point</li>
</ul>

<div class="sl"></div>

**eigenvalues**

* **definite positive**: all eigen values > 0
* **definite negative**: all eigen values < 0
* **definite semi-positive**: almost eigen values > 0, one equal = 0
* **definite semi-negative**: almost eigen values < 0, one equal = 0
* **indefinite**: one > 0 and another < 0