# Numerical analysis

The main goal of this course is to solve
**Ax=b** (find x) on a computer. You will learn

* direct methods
* iterative methods
* differentials methods

You should have some knowledge about matrix such as
inverting a matrix or finding the eigen values.

Most of this course will use ``R`` language
to provide example of how you could implements
theses.

## Introduction

Calculation are made using a computer so they may be
some mistakes. Here a some "mistakes"

* ``Round-off`` : machine may round your numbers
* ``Truncationf`` : machine may trunc your numbers
* ``method`` : you are using the wrong method
* ``problem`` : you are trying to solve the wrong problem
* ``calcul`` : you are doing the wrong calcul

You will absolutely need

* to estimate your errors (using **norms**)
* estimate the complexity/order of your algorithm

## Norms

<p><b>A norm is an evaluation an error.</b>
We usually
used the <code>absolute value</code>
\(|x-x_{found}|\)
to evaluate an error but as you can see bellow, that
was not really useful
</p>

<div class="mb-3">
<span>\( x=10^{-6} \)</span> <br>
<span>\( y=2*10^{-6} \)</span> <br>
<span>\( |x-y|=10^{-6}= \text{small error but y is two times x !!!} \)</span>
</div>

<p>So we are using the <code>relative value</code>
\( \frac{|x-x_{found}|}{|x|} \)
and we have
\( \frac{|x-y|}{|x|} = 1 = \text{not small} \)
.
</p> 

We will call theses ``norms`` using this syntax

<ul>
    <li>\(\mid  \cdot \mid \) : norm of a real/complex</li>
    <li>\(\mid\mid \cdot \mid\mid\) : norm of a vector</li>
    <li>\(\mid\mid\mid \cdot \mid\mid\mid\) : norm of a matrix</li>
</ul>

...