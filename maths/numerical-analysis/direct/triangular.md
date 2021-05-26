# Triangular system

[Go back](../index.md)

``Requirement`` : matrix must be triangular

``Process`` :

It's quite easy to solve. The first line or the last line is
like ``x = 5`` or `t = 7`. So you got one variable then go up or down
and replace this variable in your equation. You only have one variable
each time so that's quite easy.

## Example

Note that the last column is b, and the rest is A.
Your variables are x, y, z for the 1rst, 2nd and 3rd column.

<p>
\[
\begin{pmatrix}
1 & 2 & 3 & 12 \\ 
0 & 4 & 5 & 3 \\
0 & 0 & 6 & 6
\end{pmatrix}
\]
</p>

Here we start at the end so

* ``6z = 6`` means `z = 1`
* ``4 y + 5 z = 3`` so `y = (3 - 5*1) / 4` means `y  = -0.5`
* ``x + 2 y + 3z = 12`` so `x = 12 - 2 * 0.5 - 3 * 1` means `x  = 8`

And you got it.