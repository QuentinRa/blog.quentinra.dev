# Using the gradient and the hessian

[Go back](..)

Now that you have the **gradient**, you need to test
each value for your variables x,y,... where you have

<p>
\[ \nabla f(X) = \begin{pmatrix}0\\\vdots\\0\end{pmatrix} \] 
</p>

When you got your points, called **critical points**

* if you got one then that's the minimum (global)
* else you need to replace for each point x,y,z,...
inside your hessian. 

For each hessian, if it's

* **definite positive**: the point is a minimum local (strict)
* **definite negative**: the point is a maximum local (strict)
* **definite semi-positive**: the point is a minimum global
* **definite semi-negative**: the point is a maximum global
* **indefinite**: the point is a saddle point

To find if the hessian is definite/indefinite, you can

1. evaluate each determinant, using the minor of a matrix
2. check eigenvalues

<hr class="sr">

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

<hr class="sl">

**eigenvalues**

* **definite positive**: all eigen values > 0
* **definite negative**: all eigen values < 0
* **definite semi-positive**: almost eigen values > 0, one equal = 0
* **definite semi-negative**: almost eigen values < 0, one equal = 0
* **indefinite**: one > 0 and another < 0

<hr class="sr">

## End of the example

What's the gradient and the hessian
of this function?
<p>
\[
f(x, y) = 2x^2 + y^2 − 2xy + 4x
\]
</p>

The result was

<blockquote class="spoiler">
<p>The gradient
\[ \nabla f(x,y) = \begin{pmatrix}4x -2y + 4\\2y-2x\end{pmatrix} \] </p>

<p>The hessian
\[ Hf(x,y)=\begin{pmatrix}4&-2\\-2&2\end{pmatrix} \]
</p>
</blockquote>

Now as explained, you should find all the critical
points so the values giving you 

<p>
\[ \nabla f(x,y) = \begin{pmatrix}0\\0\end{pmatrix} \] 
</p>

<blockquote class="spoiler">
I'm not good at this so I used GAUSS
<div class="overflow-auto mathjax_process">
\begin{pmatrix}4x -2y + 4 = 0\\2y-2x = 0\end{pmatrix}
\Leftrightarrow
\begin{pmatrix}4x -2y = -4\\-2x + 2y = 0\end{pmatrix}
I'm removing x and y
\begin{pmatrix}
4 & -2 & -4\\
-2 & 2 & 0\\
\end{pmatrix}
Then divide the first line by 4
\begin{pmatrix}
1 & -1/2 & -1\\
-2 & 2 & 0\\
\end{pmatrix}
Eliminate the first column
\begin{pmatrix}
1 & -1/2 & -1\\
0 & 1 & -2\\
\end{pmatrix}
Eliminate the second column
\begin{pmatrix}
1 & 0 & -2\\
0 & 1 & -2\\
\end{pmatrix}
</div>

So we only have one critical point and that's
(x=-2, y=-2). Since we only have one point, that's
the minimum.

<p>
\[
f(-2, -2) = -4
\]
</p>
</blockquote>