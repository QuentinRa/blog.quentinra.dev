# Norms

[Go back](../index.md)

A norm is a measure of an error. We got 3 different notations for **norms** according to what is inside the vertical bars.

<ul>
    <li>\(\mid  \cdot \mid \) : norm of a real/complex</li>
    <li>\(\mid\mid \cdot \mid\mid\) : norm of a vector</li>
    <li>\(\mid\mid\mid \cdot \mid\mid\mid\) : norm of a matrix</li>
</ul>

The rules/properties of a norm are

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

You will see a lot of norms with a small index. These are their formulas

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
    \)</span> <small>(rho is the highest eigenvalue)</small>
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

## Examples

<p><b>Q: Demonstrate \(||Qx||^2_2 =||x||^2_2\)</b></p>

<p>
\begin{split}
||Qx||^2_2 \Leftrightarrow
(Qx)^* * Qx \Leftrightarrow \\ 
x^t * Q^t * Q * x \Leftrightarrow
x^t * x \Leftrightarrow \\
||x||^2_2
\end{split}
</p>

<p>
Note that Q^t is the matrix transpose of a matrix $Q \in \mathbb{R}^{n}$. We would replace this by $Q^*$ with $Q \in \mathbb{C}^{n}$. Also
<span class="mathjax_process">
\(
Q^t * Q = Id
\)
</span> so I removed $Q$ by using this property.
</p>

<p><b>Q: Demonstrate \(||AQ||_2 = |||A|||\)</b></p>

<p>
\begin{split}||AQ||_2 := \max_{  x \neq 0 } \frac{||AQx||_2}{||x||_2}
\\
with \ y = Qx \\
\Leftrightarrow \max_{  x \neq 0 } \frac{||Ay||_2}{||y||_2} := |||A|||\end{split}
</p>