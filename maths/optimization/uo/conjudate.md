# Conjugate gradient method

[Go back](..)

<p>
...
<code class="mathjax_process">\(X^{(n)}\)</code>,
... 
</p>

<p>
The first value
<code class="mathjax_process">\(X^{(0)}\)</code>
most of the time but you may try with a
vector of zeros if not.
</p>

We will calculate the gradient, then

<ul>
<li><code class="mathjax_process">\(g^{(n)} =
\nabla f(X^{(n)}) \)</code>
<li><code class="mathjax_process">\(d^{(0)} =
- g^{(0)} \)</code>
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