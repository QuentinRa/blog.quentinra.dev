# Using the gradient and the hessian

[Go back](..)

Now that you have the **gradient**, you need to test each value for your variables x,y,... where you have

<p>
\[ \nabla f(X) = \begin{pmatrix}0\\\vdots\\0\end{pmatrix} \] 
</p>

When you got your points, called **critical points**

* if you got one, then that's the minimum (global)
* else you need to replace for each point x,y,z,... inside your hessian. 

For each hessian, if it's

* **positive definite**: the point is a minimum local (strict)
* **negative definite**: the point is a maximum local (strict)
* **positive semi-definite**: the point is a minimum global
* **negative semi-definite**: the point is a maximum global
* **indefinite**: the point is a saddle point

To find if the definiteness of the hessian, please check the matrix course. For a matrix 2x2,

* $\Delta_{1} \gt 0 \text{ and } \Delta_{2} \gt 0$: minimum local
* $\Delta_{1} \gt 0 \text{ and } \Delta_{2} \lt 0$: saddle point
* $\Delta_{1} \lt 0 \text{ and } \Delta_{2} \gt 0$: maximum local
* $\Delta_{1} \lt 0 \text{ and } \Delta_{2} \lt 0$: saddle point

<hr class="sr">

## End of the example

In the previous example, your job was to find the gradient and the hessian of this function.

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

Now as explained, you should find all the critical points so the values giving you 

<p>
\[ \nabla f(x,y) = \begin{pmatrix}0\\0\end{pmatrix} \] 
</p>

<blockquote class="spoiler">
I'm not good at this, so I used GAUSS
<div class="overflow-auto mathjax_process">
\[
\begin{pmatrix}4x -2y + 4 = 0\\2y-2x = 0\end{pmatrix}
\Leftrightarrow
\begin{pmatrix}4x -2y = -4\\-2x + 2y = 0\end{pmatrix}
\]
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

So we only have one critical point, and that's (x=-2, y=-2). Since we only have one point, that's the minimum.

<p>
\[
f(-2, -2) = -4
\]
</p>
</blockquote>