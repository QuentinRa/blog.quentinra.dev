# Introduction

A graph $G$, is a set of **vertices** (=nodes=`sommets/nœuds`) $V$
linked by **edges** (=links=`arrêtes`) $E$ giving us the notation
$G(V, E)$. Vertices can have a direction or not.

![example](example.svg)

You will use graphs in databases in GraphDatabase,
check the NoSQL course if that was what you are looking
for.

<hr class="sr">

## Vocabulary

A graph can be simple/multiple and directed or not.

* **simple graph** (``graphe simple``): up to one edge between
  two vertices (2 if directed graph) and no loop/self-edges.
* **multiple edges graph** (`graphe complexes`): graphs that are not simple graphs
* **undirected graph** (`Graphe non orientés (GNO)`): edges have a direction,
  they are written $[a,b]$
* **directed graph** (`Graphe orientés (GO)`): edges do not have a direction,
  they are written $(a,b)$

Then here is the vocabulary

* **?** (`?`): ?

<hr class="sl">

## Trees

A tree is a graph having one of these properties
(they are equivalent)

* connected and acyclic (=no cycles)
* one path between two nodes
* connected but would be disconnected if we are removing a vertex
* acyclic but would be cyclic if we are adding one vertex
* connected and $|E| = |V| - 1$
* acyclic and $|E| = |V| - 1$

And here are new notions for trees

* [Spanning tree](trees/def.md) (`Arbre couvrant`)
* [Minimum weight spanning tree (MST)](trees/opti.md) (`Arbre couvrant de poids minimum (ACM)`)

<hr class="sr">

## Sources

This is a list of all Wikipedia pages that you may
want to check

* <https://en.wikipedia.org/wiki/Graph_theory>
* <https://en.wikipedia.org/wiki/Multiple_edges>
* <https://fr.wikipedia.org/wiki/Graphe_simple>
* <https://en.wikipedia.org/wiki/Tree_(graph_theory)>
* <https://en.wikipedia.org/wiki/Spanning_tree>
* <https://en.wikipedia.org/wiki/Minimum_spanning_tree>
* <https://en.wikipedia.org/wiki/Kruskal%27s_algorithm>
* <https://en.wikipedia.org/wiki/Prim%27s_algorithm>

[other references](refs.md)