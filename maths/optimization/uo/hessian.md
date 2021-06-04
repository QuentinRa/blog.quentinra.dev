# Hessian/Gradient

[Go back](..)

## Gradient

We are calling **gradient**, noted nabla, the "derivative"
of `f`. 

That's not a simple derivative in most cases since
`f` usually have a multiples parameters. We will calculate
partial derivatives. Let's go for use an example:

<ul>
    <li>\(f(x,y)\)</li>
    <li>we got two variables</li>
    <li>derivative of x, y is a constant: \(\frac{\partial f}{\partial x}\)</li>
    <li>derivative of y, x is a constant: \(\frac{\partial f}{\partial y}\)</li>
</ul>

And our gradient would be 

<div>
\[
\nabla f(x,y) = \begin{pmatrix}\frac{\partial f}{\partial x}\\\frac{\partial f}{\partial y}\end{pmatrix}
\]
</div>

## Hessian

Following what you learned for the gradient, the **hessian** is the derivative
of a gradient. We note it ``Hf`` if `f` is our function.