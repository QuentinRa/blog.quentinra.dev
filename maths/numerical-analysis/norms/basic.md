# Norms

[Go back](../index.md)

We will call theses ``norms`` using this syntax

<ul>
    <li>\(\mid  \cdot \mid \) : norm of a real/complex</li>
    <li>\(\mid\mid \cdot \mid\mid\) : norm of a vector</li>
    <li>\(\mid\mid\mid \cdot \mid\mid\mid\) : norm of a matrix</li>
</ul>

Here are some properties

* <span>
    \( N(x) \ge 0
    \)</span>
* <span>
    \(
        N(x+y) \le N(x)+N(y)
    \)</span>
* <span>
    \(
        N(x) = 0 \Leftrightarrow x = 0
    \)</span>
* <span>
    \(
        N(\lambda{x}) = |\lambda| N(x)
    \)</span>

<hr class="sl">

## Norms in 1, 2, infinity

You will see a lot of norms with a small number
in the right-corner side. This is their formulas

<p>
\[
||x||_1 = \sum_{i=1}^{n}{ |\ x_i |}
\]
</p>

<p>
\[
||x||_2 = (\sum_{i=1}^{n}{ |\ x_i |^2} )^{1/2} = \sqrt{\sum_{i=1}^{n}{ |\ x_i |^2}}
\]
</p>

<p>
\[
||x||_{+\infty   } = \max_{i \in \mathbb{[}1:n\mathbb{]}} | \ x_i |^2
\]
</p>

<hr class="sr">

## Some changes possibles

Just in case you want to change your expression to
another one, then here is some help

* <span>
    \(
        ||v||^2_2 = v^t * v
    \)</span>
* <span>
    \(
        \rho(A) \le ||A||
    \)</span> <span class="tms">(rho is the highest eigen value)</span>
* <span>
    \(
        ||Ax|| \le |||A||| * ||x||
    \)</span>
* <span>
    \(
        ||AQ||_2 = ||QA||_2 = ||A||_2
    \)</span>
* <span>
    \(
        ||Qx||^2_2 =||x||^2_2
    \)</span>

And you **must never forget this one**

<p>
\[
|||A|||_2 = \max_{  y \neq 0 } \frac{||Ay||_2}{||y||_2}
\]
</p>

<hr class="sl">

## Some operations

Here some questions or some operations that can be done
with norms.

<p><b>Q: Demonstrate \(||Qx||^2_2 =||x||^2_2\)</b></p>

<p>
\begin{split} ||Qx||^2_2 = (Qx)^* * Qx = \\ 
x^* * Q^* * Q * x = x^* * x= \\ ||x||^2_2
\end{split}
</p>

<p>
Note that Q* is the matrix transpose for matrix
of Reals but here we use this notation for complexes. Also
<span class="mathjax_process">
\(
Q^* * Q = Id
\)
</span> so we removed Q with this property.
</p>

<p><b>Q: Demonstrate \(||AQ||_2 = |||A|||\)</b></p>

<p>
\begin{split}||AQ||_2 := \max_{  x \neq 0 } \frac{||AQx||_2}{||x||_2}
\\
with \ y = Qx \\
= \max_{  x \neq 0 } \frac{||Ay||_2}{||y||_2} := |||A|||\end{split}
</p>