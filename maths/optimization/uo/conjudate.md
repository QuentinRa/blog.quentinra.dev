# Conjugate gradient method

[Go back](..)

...

**Steps**

<p>
The first value
<code class="mathjax_process">\(X^{(0)}\)</code>
is given most of the time but you may try with a
vector of zeros if not.
</p>

We will calculate the gradient, then

<ul>
<li><code class="mathjax_process">\(g^{(n)} =
\nabla f(X^{(n)}) \)</code></li>
<li><code class="mathjax_process">\(d^{(0)} =
- g^{(0)} \)</code></li>
<li><code class="mathjax_process">\(\lambda^{(n)} =
- \frac{g^{(n)t} \, d^{(n)}}{d^{(n)t}\,A\, d^{(n)}}\)</code>.
Note if you don't remember, that the little <code>t</code>
is the transpose of a vector <span>
\(
\begin{pmatrix}0\\1\end{pmatrix}^t =
\begin{pmatrix}0&1\end{pmatrix}
\)
</span>
</li>
</ul>

Then the formula for X is

<div>
\[
{X}^{(n+1)}={X}^{(n)} 
+ \lambda^{(n)} * d^{(n)}
\]
</div>

and for d

<div>
\[
\beta^{(n)}=
- \frac{g^{(n+1)t} * A d^{(n)}}{d^{(n)t} * A d^{(n)}}
\]
\[
d^{(n+1)}=- g^{(n+1)}+
\beta^{(n)} \,d^{(n)}
\]
</div>

You should stop when

<div>
\[
g^{(n)} = 
\begin{pmatrix}
0 \\ \vdots \\ 0
\end{pmatrix}
\]
</div>

<hr class="sr">

## Example

<p>
\[
f(x, y) = 4x^2 + 4y^2 − 2xy -5x
\]
</p>

Using conjugate gradient method, starting from
(0,0), find a critical point.

<blockquote class="spoiler">
<p>The gradient is
\[ \nabla f(x,y) = \begin{pmatrix}8x -2y - 5
\\8y -2x\end{pmatrix} \] </p>

<p><b>First iteration</b></p>
<ul>
<li class="mathjax_process">\(g^{(0)} =
\nabla f(X^{(0)}) = 
\begin{pmatrix}
-5\\0
\end{pmatrix}
\)
</li>
<li class="mathjax_process">\(d^{(0)} =
- g^{(0)} =
\begin{pmatrix}
5\\0
\end{pmatrix}
\)
</li>
<li class="mathjax_process">\(\lambda^{(0)} =
- 
\frac{
\begin{pmatrix}
-5&0
\end{pmatrix}
*
\begin{pmatrix}
5\\0
\end{pmatrix}
}{
\begin{pmatrix}
5&0
\end{pmatrix}
*
\begin{pmatrix}
8&-2\\-2&8
\end{pmatrix}
*
\begin{pmatrix}
5\\0
\end{pmatrix}
}
=
- \frac{-25}{
\begin{pmatrix}
40&-10
\end{pmatrix}
*
\begin{pmatrix}
5\\0
\end{pmatrix}
}
=
- \frac{-25}{200}
= \frac{1}{8}
\).
</li>
<li class="mathjax_process">
\(
{X}^{(n+1)}= \begin{pmatrix}0\\0\end{pmatrix}
+ \frac{1}{8} * \begin{pmatrix}5\\0\end{pmatrix}
= \begin{pmatrix}5/8\\0\end{pmatrix}
\)
</li>
<li class="mathjax_process">\(g^{(1)} =
\nabla f(X^{(1)}) = 
\begin{pmatrix}
0\\-5/4
\end{pmatrix}
\)
</li>
<li class="mathjax_process">
\(
\beta^{(0)}=
- \frac{
\begin{pmatrix}
0&-5/4
\end{pmatrix}
*
\begin{pmatrix}
8&-2\\-2&8
\end{pmatrix}
*
\begin{pmatrix}
5\\0
\end{pmatrix}}{200}
=
- \frac{
\begin{pmatrix}
10/4&-10
\end{pmatrix}
*
\begin{pmatrix}
5\\0
\end{pmatrix}}{200}
= \frac{50/4}{200}
= \frac{1}{16}
\)
</li>
</ul>

We continue.



</blockquote>