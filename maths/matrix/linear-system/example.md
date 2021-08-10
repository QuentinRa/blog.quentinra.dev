# Example

[Go back](../index.md#linear-system)

We got the system

<div>
\[
\begin{split}\left \{
\begin{array}{r c l}
x_1 \ \ - \ \ x_2 + 2x_3 = 3 \\
x_1 \ \ + \ 2x_2 \ \ \ \ \ \ \ \ \ \ = 0
\end{array}
\right .\end{split}
\]
</div>

<hr class="sl">

The matrix is

<div>
\[
\begin{split}\begin{pmatrix}
\ 1 & -1 & 2 & 3 \\
\ 1 & 2 & 0 & 0
\end{pmatrix}\end{split}
\]
</div>

<hr class="sr">

Using GAUSS method (omitted for now), we got
the matrix

<div>
\[
\begin{split}\begin{pmatrix}
\ 1 & 0 & 4/3 & 6 \\
\ 0 & 1 & -2/3 & 3
\end{pmatrix}\end{split}
\]
</div>

<hr class="sl">

That we convert back to a system

* $x_1 = 6 - \frac{4}{3} x_3$
* $x_2 = 3 + \frac{2}{3} x_3$

To make it more explicit, I converted back
the first line to $x_1 + 0x_2 + \frac{4}{3} x_3 = 6$
which means that $x_1 = 6 - \frac{4}{3} x_3$.