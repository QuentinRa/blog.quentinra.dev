# Introduction

A graph $G$, is a set of **vertices** (=nodes=`sommets/nœuds`) $V$
linked by **edges** (=links=`arrêtes`) $E$ giving us the notation
$G(V, E)$. Vertices can have a direction or not.

![example](example.svg)

You will use graphs in databases in GraphDatabase,
check the NoSQL course if that was what you are looking
for.

<hr class="sl">

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

<hr class="sr">

## Sorting and search

You can sort a graph using 

* [Topological sorting](manip/ts.md)

You can search a graph using

* [Depth-first search](manip/dfs.md)
* [Breadth-first search](manip/bfs.md)

And you can solve the problems of passing once by
a vertex/edge with

* [Eulerian path](manip/euler.md)
* [Hamiltonian path](manip/hamilton.md)

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

## Shortest path problem

You have 4 algorithms explained here (out of 6)

* [Dijkstra's algorithm](sp/dijkstra.md)
* [Bellman–Ford algorithm](sp/bellman-ford.md)
* [Floyd–Warshall algorithm](sp/floyd-warshall.md)
* [Johnson's algorithm](sp/johnson.md)
* [Distance and Diameter](sp/distance.md)

<hr class="sl">

## Sources

This is a list of all Wikipedia pages that you may
want to check

* <https://en.wikipedia.org/wiki/Graph_theory>
* <https://en.wikipedia.org/wiki/Glossary_of_graph_theory>
* <https://en.wikipedia.org/wiki/Multiple_edges>
* <https://fr.wikipedia.org/wiki/Graphe_simple>
* <https://en.wikipedia.org/wiki/Adjacency_matrix>
* <https://en.wikipedia.org/wiki/Degree_matrix>
* <https://en.wikipedia.org/wiki/Incidence_matrix>
* <https://en.wikipedia.org/wiki/Depth-first_search>
* <https://en.wikipedia.org/wiki/Breadth-first_search>
* <https://en.wikipedia.org/wiki/Graph_traversal>
* <https://en.wikipedia.org/wiki/Topological_sorting>
* <https://en.wikipedia.org/wiki/Eulerian_path>
* <https://en.wikipedia.org/wiki/Hamiltonian_path>

Trees

* <https://en.wikipedia.org/wiki/Tree_(graph_theory)>
* <https://en.wikipedia.org/wiki/Spanning_tree>
* <https://en.wikipedia.org/wiki/Minimum_spanning_tree>
* <https://en.wikipedia.org/wiki/Kruskal%27s_algorithm>
* <https://en.wikipedia.org/wiki/Prim%27s_algorithm>

Shortest path problem

* <https://en.wikipedia.org/wiki/Shortest_path_problem>
* <https://en.wikipedia.org/wiki/Dijkstra%27s_algorithm>
* <https://en.wikipedia.org/wiki/Bellman%E2%80%93Ford_algorithm>
* <https://en.wikipedia.org/wiki/Floyd%E2%80%93Warshall_algorithm>
* <https://en.wikipedia.org/wiki/Johnson%27s_algorithm>
* <https://fr.wikipedia.org/wiki/Diam%C3%A8tre_(th%C3%A9orie_des_graphes)>
* <https://en.wikipedia.org/wiki/Distance_(graph_theory)>

[other references](refs.md)