# Incidence matrix

[Go back](..#advanced-terminology)

This may also be called ``Matrice d’incidence``. It's mainly used in directed graph as an amelioration of the adjacency matrix because we lost some information.

This is a matrix vertex by vertex too, and the value are -1, 0 or 1. If we are at row=A, col=B

* **-1**: an arc is leaving A ($A \to B$)
* **1**: an arc is entering A ($B \to A$)
* **0**: no arc ($A \to B$ or $B \to A$)

Notes

* you should only use $-1$ instead of $0$, but that's unneeded if there is a $1$. 
* this is what I learned in school (=French wikipedia) but the English wikipedia is not the same at all

<hr class="sl">

## Example

The incidence matrix for

![](images/inc.svg)

is

<div>
\[
\displaylines{
\hspace{0.7cm}\begin{array}{} a&b&c&d&h&i \end{array} \ \ \
\\
\begin{array}{} a\\b\\c\\d\\h\\i \end{array}
\begin{pmatrix}
0 & 1 & -1 & 1 & 0 & 0  \\
1 & 0 & 0 & 1 & 1 & 0  \\
1 & 0 & 0 & -1 & 0 & 1  \\
-1 & -1 & 1 & 0 & 1 & 0  \\
0 & -1 & 0 & -1 & 0 & 1  \\
0 & 0 & -1 & 0 & 1 & 0  \\
\end{pmatrix}
}
\]
</div>

**Note**: if you remove all the minus (`-`) before the ones then you got the adjacency matrix for the undirected graph.