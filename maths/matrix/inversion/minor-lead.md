# Leading minors of a matrix

[Go back](../index.md#definiteness-of-a-matrix)

You may have read before in this course, that a minor of $A$, is the matrix $A$, after we removed a line and a column. Well, **leading minors** (also called **principal minors**) are easy to find too, at least as easy as calculating a bunch of determinants.

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

Then a **leading minor** would be evaluated as $\Delta_{i}=det(A_{i})$ giving us something like

<ul>
<li>\(\Delta_{1}=a_{11}\)</li>
<li>\(\Delta_{2}=det A_{2}= \begin{pmatrix}a_{11} & a_{12} \\ a_{21} & a_{22}\end{pmatrix} = a_{11} * a_{22} - a_{12} * a_{21}\)</li>
<li>...</li>
<li>\(\Delta_{n}=det(A)\)</li>
</ul>

We are calling $k$, for the **leading minor** $\Delta_k$, the order of the minor. This is the number of lines and columns we are picking, starting from 1, from the matrix $A$.