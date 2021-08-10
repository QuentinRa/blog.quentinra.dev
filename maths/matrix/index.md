# Introduction

We are writing $M_{n,p}$ a matrix of $n$ lines and $p$ columns.
The value at the $i$nth line and the $j$nth column is
written $a_{ij}=a_{i,j}$. The coefficients are starting from 1.

<div>
\[
\begin{split}M=\ M_{n,p}=\ M_{np}=\ \begin{pmatrix}
\ a_{1,1} & \cdots & a_{1, p-1} \\
\vdots  & \cdots & \vdots  \\
\ a_{n-1,1} & \cdots & a_{n-1, p-1}
\end{pmatrix}\end{split}
\]
</div>

<hr class="sl">

## Linear System

A linear system is a set of equations that can
solved together. Solving one, will give you a variable
value that you can use to solve another one until you
solved everything.

What's convenient is that you can use a matrix for
that because the GAUSS method (and a lot of other methods
in Numerical analysis) needs a matrix. The
rules are

* [Rules to transform a linear system to a matrix](linear-system/rules.md)
* [Example](linear-system/example.md)