# Edge coloring

[Go back](..#graph-coloring-problems)

The idea is the same as for the vertex coloring. We will use "chromatic index" (`indice chromatique`) instead of "chromatic number".

<hr class="sl">

## Line graph

The line graph $L(G)$ of a graph $G$ is made using $G$ edges. This is convenient because the chromatic number of $L(G)$, is the chromatic index of $G$. You can create the line graph from $G$ following this

* a vertex of $L$ is an edge of $G$
* two vertices of $L$ are linked if they are incident to the same vertex in $G$.