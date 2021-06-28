# Quadratic problems

[Go back](..)

A quadratic problem is something like

<div class="mathjax_process">
\[
\min f(x) = \frac{1}{2} X^t * A * X + b^T X
\]
</div>

with

* **X** the vector for your variables like x,y,...
* **A** the matrix in Ax=b
* **b** the vector of results in Ax=b

After a bit of calculations [hidden], you got
these formulas

<ul>
<li class="mathjax_process">\(\nabla f(X) = AX-b\)</li>
<li class="mathjax_process">\(H_{f}(X) = A\)</li>
</ul>

I have seen it use quite a lot in **constrained optimization**
(on the web)
but we didn't work on this enough so I don't know much.