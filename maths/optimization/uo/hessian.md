# Hessian/Gradient

[Go back](..)

The gradient (first derivative) and the hessian (second derivative), will be used quite a lot in unconstrained optimization.

<hr class="sl">

## Gradient

We are calling **gradient**, noted nabla, the "derivative" of `f`. 

That's not a simple derivative in most cases since `f` usually have a multiples parameters. We will calculate partial derivatives. Let's go for use an example:

* $f(x,y)$
* we got two variables
* derivative of x, y is a constant: $\frac{\partial f}{\partial x}$
* derivative of y, x is a constant: $\frac{\partial f}{\partial y}$

And our gradient would be 

<div>
\[
\nabla f(x,y) = \begin{pmatrix}\frac{\partial f}{\partial x}\\\frac{\partial f}{\partial y}\end{pmatrix}
\]
</div>

<hr class="sr">

## Hessian

Following what you learned for the gradient, the **hessian** is the derivative of a gradient. We note it ``Hf`` if `f` is our function.

<hr class="sl">

## Exercise

What's the gradient and the hessian of this function?
<p>
\[
f(x, y) = 2x^2 + y^2 − 2xy + 4x
\]
</p>

<blockquote class="spoiler">
<p>Let's calculate our gradient</p>
<ul>
    <li class="pb-3">\(\frac{\partial f}{\partial x} = 4x + 0 + - 2 * 1 * y + 4 = 4x -2y + 4\)</li>
    <li>\(\frac{\partial f}{\partial y} = 2 * 0 + 2y + - 2 * x * 1 + 0 = 2y-2x\)</li>
</ul>

<p>So we have the gradient
\[ \nabla f(x,y) = \begin{pmatrix}4x -2y + 4\\2y-2x\end{pmatrix} \] </p>

Then round 2, the hessian

<ul>
<li>0,0 in x: \(4−0+0  = 4\)</li>
<li>0,0 in y: \(0−2∗1 = -2\)</li>
<li>1,0 in x: \(0 -2 * 1 + 0 = -2\)</li>
<li>1,0 in y: \(2*1-0  = 2\)</li>
</ul>

<p>So we have the hessian \[ Hf(x,y)=\begin{pmatrix}4&-2\\-2&2\end{pmatrix} \] I hope you took the time to do this easy one!
</p>
</blockquote>