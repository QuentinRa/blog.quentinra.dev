# Conjugate gradient method

[Go back](..)

This is an iterative method. The first value $X^{(0)}$ is given most of the time, but you may try with a vector of zeros if not.

Calculate the gradient, then

* $g^{(n)} = \nabla f(X^{(n)}) \)$
* $d^{(0)} = - g^{(0)}$
* as for $\lambda^{(n)}$ (with $A^t$ the transpose of $A$ )

@
\lambda^{(n)} =- \frac{g^{(n)t} * d^{(n)}}{d^{(n)t} * A * d^{(n)}}\)
@

Note that the matrix $A$ is the matrix of the coefficients before the variables in your gradient. Then the formula for X is

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

Using the conjugate gradient method, starting from (0,0), demonstrate that $X^{(2)}$ is a critical point.

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
{X}^{(1)}= \begin{pmatrix}0\\0\end{pmatrix}
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

<p><b>Second iteration</b></p>
<ul>
<li class="mathjax_process">\(d^{(1)} =
- \begin{pmatrix}
0\\-5/4
\end{pmatrix}+ 1/16  *  \begin{pmatrix}
5\\0
\end{pmatrix}
=
\begin{pmatrix}
5/16\\5/4
\end{pmatrix}
\)
</li>
<li class="mathjax_process">\(\lambda^{(1)}
= \text{too hard}
\)
</li>
<li class="mathjax_process">
\(
{X}^{(2)}= \begin{pmatrix}5/8 + \lambda^{(1)} * 5/16
\\ \lambda^{(1)} * 5/4\end{pmatrix}
\)
</li>
</ul>

Then since we know that $g^{(2)}$ is a critical point, then we simply need to find a lambda, so we have a gradient equals to $(0,0)$.

<div class="mathjax_process">\[g^{(2)} =
\nabla f(X^{(2)}) = 
\begin{pmatrix}
5 - \frac{5*\lambda^{(1)}}{2}
- \frac{5*\lambda^{(1)}}{2} - 5\\
10\lambda^{(1)} - \frac{10}{8}
- \frac{10*\lambda^{(1)}}{16}
\end{pmatrix} =
\begin{pmatrix}0\\0\end{pmatrix} ?
\]
</div>

In the first one we are good, so let's check the second one.

<div class="mathjax_process">
\begin{cases}
\frac{80\lambda^{(1)}}{8} - \frac{5*\lambda^{(1)}}{8}
= \frac{10}{8} \\
\frac{75\lambda^{(1)}}{8} = \frac{10}{8} \\
75\lambda^{(1)} = 10 \\
\lambda^{(1)} = \frac{10}{75} = \frac{2}{12} \\
\end{cases}

So we have

<div class="mathjax_process">\[
{X}^{(2)}= 
\begin{pmatrix}(5/8) + (2/12)*(5/16)
\\ (2/12)*(5/4)\end{pmatrix}
=
\begin{pmatrix}x \approx  0.67\\ y \approx 0.21\end{pmatrix}
\]
</div>

The Second iteration is done, and we are stopping since we got $(0,0)$ for g. And since the gradient is $(0,0)$ it's a critical point.
</div>
</blockquote>