# Condition number

[Go back](../index.md)

The condition number (or `Conditionnement` in French)
is a measure of the dependence between the parameters
(x) and the solution (b).

<p class="mathjax_process">
\[
cond(A) = |||A||| * |||A^{-1}|||
\]
</p>

Properties

<ul>
<li class="mathjax_process">if \(A \in Gl_n(R) \ then \ cond(A) \ge 1\)</li>
<li class="mathjax_process">if \(A \in Gl_n(R) \ then \ cond(\lambda{A}) = cond(A)\)</li>
<li class="mathjax_process">if \(A, B \in Gl_n(R) \ then \ cond(AB) \le cond(A) * cond(B)\)</li>
</ul>

<div>
if you didn't remember, 
<span class="mathjax_process">\(A \in Gl_n(R)\)</span>
means that the matrix is invertible.
</div>

<hr class="sr">

<div class="mathjax_process">
\[
\begin{split}cond_2(A) = \sqrt{\frac{\sigma_n}{\sigma_1}} \\
ou \ if \ A \ is \ definite \ positive \\
cond_2(A) = \sqrt{\frac{\lambda_n}{\lambda_1}} \\\end{split}
\]
</div>

Note that 

<ul>
<li class="mathjax_process">\(\sigma\): smallest eigen value</li>
<li class="mathjax_process">\(\lambda\): biggest eigen value</li>
</ul>

<p class="mathjax_process">
\(
cond_p(A) = |||A||_p |||A^{-1}||_p
\)
</p>