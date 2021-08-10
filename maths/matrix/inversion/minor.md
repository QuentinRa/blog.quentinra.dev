# Minor of a matrix

[Go back](../index.md#matrix-inversion)

Given a matrix $A$

<div>
\[
\begin{split}A= \begin{pmatrix}
        a_{11} & a_{12} & \cdots & a_{1n} \\
        a_{21} & a_{22} & \cdots & a_{2n} \\
        \vdots & \vdots & \ddots & \vdots \\
        a_{n1} & a_{n2} & \cdots & a_{nn}
\end{pmatrix}\end{split}
\]
</div>

Then the minor would be  $\Delta_{i}=det(A_{i})$
giving us something like

<ul>
<li>\(\Delta_{1}=a_{11}\)</li>
<li>\(\Delta_{2}=det A_{2}= \begin{pmatrix}a_{11} & a_{12} \\ a_{21} & a_{22}\end{pmatrix} = a_{11} * a_{22} - a_{12} * a_{21}\)</li>
<li>...</li>
<li>\(\Delta_{n}=det(A)\)</li>
</ul>

<hr class="sl">

## Cofactor expansion

In French, our teacher is also calling this
``Calcul par développement``. We usually pick
the column $p$ with the greatest coefficient, and
remove it. We are multiplying each coefficient
by $(-1)^{i+1}$ and $det(A')$ with $A'$ a matrix
without the row $i$ and of course the column $p$.
The formula would be something like this.

<div class="overflow-auto">
\[
\sum_{i=1}^n (-1)^{i+1} * a_{i,p} * det(A')
\]
</div>