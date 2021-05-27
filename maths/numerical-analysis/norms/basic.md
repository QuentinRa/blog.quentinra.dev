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
   
Then you must learn theses norms

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

And you **must never forget this one**

<p>
\[
|||A|||_2 = \max_{  y \neq 0 } \frac{||Ay||_2}{||y||_2}
\]
</p>

These may help

* <span>
    \(
        ||v||^2_2 = v^t * v
    \)</span>
* <span>
    \(
        \rho(A) \le ||A||
    \)</span>
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

## Some operations

Here some questions or some operations that can be done
with norms.

<p>Demonstrate \(||Qx||^2_2 =||x||^2_2\)</p>

<p>
\begin{split} ||Qx||^2_2 = (Qx)^* * Qx = \\ 
x^* * Q^* * Q * x = x^* * x= \\ ||x||^2_2
\end{split}
</p>

Note that Q-star is the matrix transpose for matrix
of Reals but here we use this notation for complexes. Also
``Q^* * Q = Id`` so we removed Q with this property.

<p>Demonstrate \(||AQ||_2 = |||A|||\)</p>

<p>
\begin{split}||AQ||_2 := \max_{  x \neq 0 } \frac{||AQx||_2}{||x||_2}
\\
with \ y = Qx \\
= \max_{  x \neq 0 } \frac{||Ay||_2}{||y||_2} := |||A|||\end{split}
</p>