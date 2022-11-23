# Quadratic problems

[Go back](..)

A quadratic problem is something like this:

@
\min f(x) = \frac{1}{2} X^t * A * X + b^T X
@

with

* **X** the vector for your variables like x,y,...
* **A** the matrix in Ax=b
* **b** the vector of results in Ax=b

After some calculations [hidden], you got these formulas

* $\nabla f(X) = AX-b$
* $H_{f}(X) = A$

I have seen it use quite a lot in **constrained optimization** (on the web) but we didn't work on this enough, so I don't know much.