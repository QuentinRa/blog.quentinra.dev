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

[Glossary of Graph theory](https://en.wikipedia.org/wiki/Glossary_of_graph_theory) and [Terminology Examples](_examples/terminology.md).

#### Adjacent/Neighbor

Two nodes are adjacent if they are connected by an edge. For a node X, the notation is $N(X)$ or $\Gamma(X)$ (gamma).

For oriented graphs, we use $N^{+}(X)$ <small>(in)</small> and $N^{-}(X)$ <small>(out)</small>.

#### Vertex degree

The number of neighbors. The notation is $d(X) = |\Gamma(X)|$. In a directed graph, this is $|\Gamma^{+}(X)| + |\Gamma^{-}(X)| = d^+(X) + d^-(X)$.

#### Vertex incidence

A vertex is incident to an edge if they are connected.

#### Order of a graph

The order of a graph is $|V|$, its number of vertices. Alternative notations are: $|V(G)|$, $\\#V$, or $Card(V)$.
</div><div>

#### Predecessor and successor

For directed graphs, given $A \to B$:

* $A$ is the predecessor of $B$
* $B$ is the successor of $A$

#### Subgraph $G'$

A subgraph $G'$ is a graph formed from a subset of the vertices and edges of the graph $G$. An induced subgraph is a variant where we can only remove a vertex and their incident edges.

#### Complement of a graph

The complement of a graph is a graph in which we are connecting all vertices that were not connected, and disconnected vertices that were connected.

➡️ Ex: The complementary graph of $A-B-C$ is $C-A\hspace{.5cm}B$.

#### Isomorphism

Two graphs G and H are isomorphic if you can relabel the vertices of one of them in a way that preserves the edge relationships, resulting in the other graph. It means there is a bijection between them.
</div></div>

<hr class="sep-both">

## Well-known Graphs

<div class="row row-cols-lg-2"><div>

➡️ Each graph name can be directed or not, e.g., "directed walk."

#### Walk

A sequence of edges and vertices. A walk may include repeated vertices and edges, and all vertices must be connected.

#### Chain

It is a walk in which all vertices have degree 2 except for the two endpoints, which have degree 1.

#### Trail

A walk in which all edges are distinct.

#### Path $P_n$

A trail in which all vertices are distinct.

#### k-regular graph

A regular graph or k-regular graph is a graph where all vertices have the same degree $d=k$. For instance, a 3-regular graph means $d=3$.

#### Complete graph $K_n$

Every vertex is adjacent to all other vertices aside from itself. It means that $|V| = \frac{n(n-1)}{2}$.

📚 We call density the number of edges of our graph divided by the number of edges of the associated complete graph.

📚 A clique is a subgraph that is complete. 
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

#### Bipartite graph $K_{a,b}$

Assuming we can isolate the vertex if two groups:

* The group of vertices of degree $a$
* The group of vertices of degree $b$ with $b > a \ge 1$

In a bipartite graph, each vertex in the first group must be adjacent to $a$ vertex in the second <small>(resp. second group and $b$)</small>.
</div></div>

<hr class="sep-both">

## Graph Representations

<div class="row row-cols-lg-2"><div>

➡️ See also: [Graph Representations Examples](_examples/representations.md). 

#### Adjacency Matrix

This is a square matrix. Assuming we are at row=A and col=B, 

* If $A \to B$ exists, the element is $1$
* Otherwise, the element is $0$

➡️ In an undirected graph, the matrix is symmetric.

➡️ If there is a loop, e.g., $A\to A$, the element's value is $2$.

📚 $M^p$ is the adjacent matrix after $p$ transition.

#### Incidence Matrix

The incident matrix extends the adjacency matrix by integrating the notion of direction needed by directed graphs. At row=A and col=B:

* If $A \to B$ exists, the element is $-1$
* If $B \to A$ exists, the element is $1$
* Otherwise, the element is $0$

If both $-1$ and $1$ are possible, pick one. If you remove all the minus signs, you get back the adjacency matrix.
</div><div>

...
</div></div>

<hr class="sep-both">

## Graph Properties and Concepts

<div class="row row-cols-lg-2"><div>

...
</div><div>

...
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