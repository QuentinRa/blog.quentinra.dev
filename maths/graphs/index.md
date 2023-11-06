# Graph theory

<div class="row row-cols-lg-2"><div>

A graph $G$ is a set of vertices <small>(or nodes)</small> $V$ connected by edges <small>(or links)</small> $E$. The notation is typically represented as $G(V, E)$. Edges can have a direction or not. A simple directed graph:

<div class="text-center">

![Graph - example](_images/example.svg)
</div>
</div><div>

Graphs can be simple/complex and directed/undirected.

* **simple graph** 😎: up to one edge <small>(two in a directed graph)</small> between two vertices and no self-edges <small>(or loop, a node to itself)</small>. 
* **complex graphs** 🕸️: all graphs that are not simple graphs.
* **undirected graph** 🗺️: edges do not have a direction. The usual notation is: `(a,b)` for an edge between `a` and `b`. 
* **directed graph** 🛣️: edges are called arcs. They have a direction. The usual notation is: `[a,b]` for an edge from `a` to `b`.
</div></div>

<hr class="sep-both">

## Terminology

<div class="row row-cols-lg-2"><div>

[Glossary of graph theory](https://en.wikipedia.org/wiki/Glossary_of_graph_theory)
</div><div>
</div></div>

<hr class="sep-both">

## Well-known Graphs

<div class="row row-cols-lg-2"><div>

➡️ Each graph can be directed or not, e.g., "directed walk".

##### Walk

A sequence of edges and vertices. A walk may include repeated vertices and edges, and all vertices must be connected.

##### Chain

It is a walk in which all vertices have degree 2 except for the two endpoints, which have degree 1.

##### Trail

A walk in which all edges are distinct.

##### Path ($P_n$)

A trail in which all vertices are distinct.
</div><div>

#### Circuit $C_n$

A closed trail in which the first and last vertices are equal.

#### Cycle $C_n$

A closed path that starts and ends at the same vertex. Basically, it's a circuit in which **only** the first and last vertices are equal.

📚 A graph without cycles is called an acyclic graph.

#### Star $S_n$

One vertex is connected to all other vertices. It has a  degree of $d(v_i)=|V|-1$ while the others have a degree of $d(v_i)=(v)=1$.

#### Wheel $W_n$

A vertex is connected to all other vertices ($d(v_i)=|V|-1$) that are connected to two vertices aside from the "center" ($d(v_i)=3$).

#### Butterfly/Hourglass

One vertex degree is $|V|-1=4$ and the others are of degree $2$. The graph is made of $6$ edges and $5$ vertices.
</div></div>

<hr class="sep-both">

## Sorting and search

<div class="row row-cols-lg-2"><div>

...
</div><div>

...
</div></div>

<hr class="sep-both">

## Graph coloring problems

<div class="row row-cols-lg-2"><div>

...
</div><div>

...
</div></div>

<hr class="sep-both">

## Trees

<div class="row row-cols-lg-2"><div>

...
</div><div>

...
</div></div>

<hr class="sep-both">

## The shortest path problem

<div class="row row-cols-lg-2"><div>

#### Dijkstra's Algorithm

...

#### Bellman–Ford Algorithm

...
</div><div>

#### Floyd–Warshall Algorithm

This algorithm works with positive and negative weights. It has a complexity of $O(m^2)$. It gives the shortest path starting from any vertex to any vertex. First, create the incidence matrix:

* put the weight if you have one
* if vertex = self, then set $0$
* otherwise set $+\infty$

Then, $\forall{k, i, j}$ to $n$, apply this instruction: if the distance i,j $d(i,j)$ is greater than $z = d(i,k) + d(k,j)$, then $d(i,j) = z$.

<br>

#### Johnson's Algorithm

Johnson algorithm makes use of both Bellman-Ford and Dijkstra's Algorithms. The shortest distance from $q$ to $X$ will be in $h[X]$.

* we are adding a vertex $q$ to our graph
* we are connecting this vertex to all vertices <small>(weight=0)</small>
* we are evaluating Bellman-Ford <small>(starting from $q$)</small>
* we got $n$ distances, stored in an array $h$

We then revaluate each weight: $w(X,Y) = w(X,Y) + h[X] - h[Y]$. Once the new graph is complete, we use Dijkstra's algorithm on it.
</div></div>

<hr class="sep-both">

## 👻 To-do 👻

Stuff that I found, but never read/used yet.

<div class="row row-cols-lg-2"><div>

* [old](_old.md)
</div><div>
</div></div>