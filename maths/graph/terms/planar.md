# Planar graph

[Go back](..#advanced-terminology)

A planar graph (`Graphe planaire`), is a graph
that could be drawn without having two edges crossing
each other.
We are calling 
planar representation/``Graphe planaire topologique``,
the planar representation of a planar graph.

When we are drawing a planar graph, we will have

<hr class="sl">

## Face

You know the bucket tool in image editor software? 
A face is something colored by the bucked tool in one go.
You got at least one unbounded face, which is the one not 
colored after coloring all of your faces.

A face is a surface of the graph delimited by edges.
It can be either a

* bounded face/``face finie``
* external, outer or unbounded face/``face infinie``

<hr class="sl">

## Bounds

Note that you can only use a vertex once inside
the bounds (`Frontière/contour`) of a face. The bounds
is a list of edges you used to delimit a face.
The bounds are forming a cycle basis in
a planar representation.

<hr class="sl">

## Check if the graph is planar

Let $m=\\#edges=|E|$, $n=\\#vertices=|V|$ and $f=\\#faces$, then
a graph is planar if

* $n-m+f=2$ (you can find $f$ with $f=m-n+2$)
* if $m < 3n -5$ in a connected graph
* **Kuratowski's theorem**
  * The graphs $K_{3,3}$ and $K_5$ are not planar
  * A subgraph of these is not planar
* **Robertson–Seymour theorem**
  * A graph minor of $K_{3,3}$ and $K_5$ is not planar

Other notes

* if the $\forall{i \in V},\ d(i) \gt 5$, the graph is NOT planar
* if a graph is planar, then $\exists{i \in V},\ d(i) \lt 6$