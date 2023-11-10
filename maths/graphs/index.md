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

#### Predecessor and successor

For directed graphs, given $A \to B$:

* $A$ is the predecessor of $B$
* $B$ is the successor of $A$
</div><div>

#### Subgraph $G'$

A subgraph $G'$ is a graph formed from a subset of the vertices and edges of the graph $G$. An induced subgraph is a variant where we can only remove a vertex and its incident edges.

#### Complement of a graph

The complement of a graph is a graph in which we are connecting all vertices that were not connected, and disconnected vertices that were connected.

➡️ Ex: The complementary graph of $A-B-C$ is $C-A\hspace{.5cm}B$.

#### Minor of a graph

The minor of a graph $G$ is a graph created under these constraints:

* We can remove an edge
* We can merge connected vertices
* We can remove a vertex $v$ of degree $d(v)=1$

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

#### Degree Matrix

It's a diagonal matrix with the degree of each vertex. For instance, if $d(A)=4$ then $a_{A,A} = 4$.

#### Transitive closure

The transitive closure $\tau$ (tau) is achieved by adding all the edges that can be deduced by transitivity.

For instance, if we have $(a,b)$ and $(b,c)$, then we will create $(a,c)$ if $(a,c)$ doesn't exist.

**Roy–Warshall algorithm** (also called Floyd–Warshall)

* for each vertex $V$
    * for each predecessor of $V$, $p$
        * for each successor of $V$, $s$
            * if $p \neq s$
            * add $(p,s)$ if $(p,s)$ does not exist

Complexity: $O(n * n * n)$
</div></div>

<hr class="sep-both">

## Graph Properties and Concepts

<div class="row row-cols-lg-2"><div>

➡️ See also: [Graph Properties Examples](_examples/properties.md).

#### Connected graphs

A connected graph only has one connected component. 

A connected component $C$ is a subgraph of a graph in which every vertex is connected to at least one other vertex within that subgraph. A component is said to be strong if we can't add more edges to it.

**Algorithm** to create connected components

* pick a vertex
* $i=0$, we will create the i-th component $C_i$
* while there are still vertices not in a component
    * for each vertex
        * if $C_i$ is empty or this vertex is adjacent to a vertex inside $C_i$
        * then: we add it to $C_i$
        * else: we go to the next vertex
    * i++

➡️ When iterate vertices, it's faster to look for vertices that are not in a connected component and that are incident to a vertex in your $C_i$.

📚 An articulation point is a vertex that disconnects the graph if we remove it. If it's an edge, we call it a bridge.

#### Super-connectivity

A graph is super-connected if, from any vertex, we can go to any other vertex. A complete graph is super-connected.

**Algorithm**

* while there are vertices not marked
    * pick a vertex and mark it "+" and "-"
    * mark all vertices we can reach from it with "+"
    * mark all vertices that can reach it with "-"
    * all marked vertices with "+" and "-" are part of the same super-connected component.

📚 If $C_1, C_2, C_3$ are super-connected components, then a graph having for nodes $C_1, C_2, C_3$ is called reduced graph. If $A \in C_1$ was adjacent to $B \in C_2$ then $C_1$ is adjacent to $C_2$.

#### Spanning subgraph

A spanning subgraph $G'$ of $G$ is a graph in which we removed edges. It means $V_{G'} = V_G$ and $E_{G'}\ \subset\ E_G$.

📚 $G$ and $G'$ are $\tau$-equivalent if they have the same transitive closure and $G'$ is a subgraph of $G$.

📚 Let $G'$ be a $\tau$-equivalent of $G$. $G'$ is $\tau$-minimal $\tau$-equivalent if removing one edge makes it lose the $\tau$-equivalent property.  $\tau$-maximal $\tau$-equivalent is the same with "adding" one edge.

📚 Let graph $G'$ be $\tau$-minimal $\tau$-equivalent of $G$. If we can't find another graph $G'$ with fewer edges while still being $\tau$-minimal $\tau$-equivalent, then $G'$ is $\tau$-minimum $\tau$-equivalent <small>(resp. maximum)</small>.
</div><div>

#### Planar Graph

A planar graph is a graph that can be drawn in such a way that no edges cross each other. 

A face is a surface of the graph delimited by edges. It can be a bounded (finite) or external/outer/unbounded (infinite) face.

The bounds are a list of edges delimiting a face.

Assuming $m=|E|$, $n=|V|$ and $f=|faces|$.

* **Euler's formula**: $n-m+f=2$. It means $f=m-n+2$.
* **Euler's formula**: Planar if $m < 3n - 5$ in a connected graph
* **Kuratowski's + Robertson–Seymour theorems**: $K_{3,3}$, $K_5$, their subgraphs, and their graph minor are not planar.
* if $\forall{i \in V},\ d(i) \gt 5$ then the graph is not planar
* if $\exists{i \in V},\ d(i) \lt 6$ is false, then the graph is not planar
* if $f \le 2n - 4$, then the graph is planar
* if there are no cycles of length 3, and $m \le 2n-4$, then the graph is planar

📚 A dual graph is made by using the faces as vertices. If $A \in F_1$ was adjacent to $B \in F_2$ then we $F_1$ is adjacent to $F_2$.

#### Cycle basis

First, all edges must be ordered. For undirected graphs, arbitrarily pick a direction for each edge. We will have a vector $C_n = (0, ...,1,-1)$ for each cycle where:

* $0$ represents an edge not inside the cycle
* $1$ represents an edge inside the cycle and in the same direction
* $-1$ represents an edge inside the cycle and in another direction

A cycle basis $B$ is a set of cycles as vectors, so that the basis is linearly independent and generating. The notation is: $B=\\{C_1,\ldots,C_n\\}$.

Mu $\mu(G)$ is the number of elements of a cycle basis, with $\mu(G) = m − n + p$ and $p$ the number of connected components.

#### Co-cycle basis

The co-cycles of $A$ is the set of arcs incident of $A$, noted $\omega{(A)}$. It is slightly different from a cycle basis.

* If given $(a,b)$, $a$ is inside and $b$, we use $1$
* If given $(a,b)$, $b$ is inside and $a$, we use $-1$
* Otherwise, we use $0$

We use $\gamma(G)$ (gamma) instead of $\mu(G)$, with $\gamma(G) = n - p$.
</div></div>

<hr class="sep-both">

## Sorting and search

<div class="row row-cols-lg-2"><div>

➡️ See also: [Sorting and search Examples](_examples/search.md).

#### Topological sorting

It's a process to sort vertices. Each vertex is before its successors.

* While there are still vertices
  * Pick the vertex with the fewest successors
  * Remove it from the graph

#### Depth-first search

A technique to explore a graph. We will explore a path until the end, then go back and explore its branches until we traversed every branch.

**Algorithm**

* Randomly pick a starting vertex
* Mark it as traversed
* Repeat until the vertex is found or all vertices are tagged "done"
  * Try to randomly pick of a neighbor not traversed and not done
  * If it's possible, mark the vertex as traversed
  * Otherwise, mark the vertex as "done", and go back to the previously traversed vertex.

Complexity: $O(|V|+|E|)$.

#### Breadth-first search

A technique to explore a graph. We progressively explore the neighbors of each vertex until we have visited every vertex.

**Algorithm**

* Randomly pick a starting vertex
* Add the vertex neighbors in $S$ and tag it "done"
* Repeat until $S$ is empty
  * Pick the first vertex in the list
  * Tag it "done" and remove it from $S$
  * Add its neighbors in $S$ if they aren't in $S$ nor tagged "done"

Complexity: $O(|V|+|E|)$.
</div><div>

#### Eulerian graph

An eulerian graph is a connected graph where every edge is traversed exactly once in a continuous path or circuit. Every vertex in the graph must have an even degree.

📚 A Semi-Eulerian Graph has exactly two vertices with an odd degree while all other vertices must have an even degree. The difference with an Eulerian graph is that the starting and ending points are different.

**Algorithm**

* Initialize an empty list $S$ to keep track of traversed edges.
* Check if the graph contains any bridges. If there is a bridge, pick a vertex connected to it as the starting vertex. If not, you can start from any arbitrary vertex in the graph.
* Repeat until all edges are in $S$:
    * Let $I$ be the list of incident edges of the current vertex. 
    * Check if $I$ is a subset of $S$. If it is, the graph is not Eulerian.
    * Otherwise, pick an edge in $I$ that is not in $S$, traverse it, and add it to $S$. If there is an edge that is a bridge, pick it last.

#### Hamiltonian graph

A Hamiltonian graph is a connected graph where every vertex is traversed exactly once in a (Hamiltonian) path or cycle.

📚 If there is a Hamiltonian path but no Hamiltonian cycle, the graph is said to be semi-hamiltonian.

**Algorithm**

There is no generic algorithm. We know for sure a graph is Hamiltonian if either:

* $n \ge 3$ and all degrees are $\ge \frac{n}{2}$
* $n \ge 3$ and $\forall{x,y}$ that are not neighbor, $d(x)+d(y) \ge n$
</div></div>

<hr class="sep-both">

## Graph coloring problems

<div class="row row-cols-lg-2"><div>

➡️ See also: [Graph coloring problems Examples](_examples/coloring.md).

#### Vertex Coloring

We color vertices while using the fewest colors and under the constraint that neighbors can't have the same color.

We are calling chromatic number $\gamma(G)$ (gamma) or $\chi(G)$ (chi) of $G$ the minimum number of colors we need to use.

* $1 \le \gamma(G) \le n$
* if a graph is not planar: $\gamma(G)=|V|$
* if a graph is planar: $\gamma(G) \le 4$
* if a graph is stable: $\gamma(G)=1$
* if a graph is bipartite: $\gamma(G)=2$
* if a graph is complete: $\gamma(G)=|V|$
* $\gamma(G) \ge |\text{longest_clique_of_G}|$
* $\gamma(G) \le d_{max}(G)+1$ <small>(max degree+1)</small>

The solution is said to be optimal when we can't find a better one.

#### Vertex Coloring Welsh-Powell greedy algorithm

This algorithm will color the graph, but it may not use the lowest number of colors.

* Order the vertices by decreasing degree
* While all vertices are not colored
    * Pick the first not colored vertex
    * Pick an unused color
    * While conserving the order above, color every uncolored vertex that is not adjacent to the ones we are coloring with this color

To check if the solution is the best one, check the properties of $\gamma(G)$.

#### Vertex Coloring Contraction Algorithm

The goal of this algorithm is to create a clique. We can:

* Contract two vertices
* Connect two vertices with an edge

This algorithm complexity is evaluated as $2^z$ graph to make, with $z$ the number of edges missing for the graph to be complete.

**Algorithm**

* Until every subgraph is complete
* Create 2 subgraphs from each non-complete subgraph
    * One contracting two vertices
    * One linking two vertices

The degree of the smallest clique is the chromatic number. The groups of vertices in the smallest clique will have the same color.
</div><div>

#### Edge Coloring

The line graph $L(G)$ of a graph made from the graph $G$.

* A vertex of $L$ is an edge of $G$
* Two vertices of $L$ are connected if they are incident to the same vertex in $G$

We will use a [Vertex Coloring](#vertex-coloring) algorithm to color our graph. The chromatic number of $L(G)$ is the chromatic index of $G$.

✍️ We use "index" instead of "number" for Edge Coloring.

#### Sprague–Grundy function

The independence set, also called stable set, is a set $S$ in which there aren't any vertices that are adjacent to another vertex in the set.

An Absorbing set is a set where each vertex outside the set is connected to at least one vertex inside the set.

A kernel is a set both stable and absorbing. A graph can have $0$, $1$, or more kernels.

**Sprague–Grundy function**

This function gives a value to each vertex. If the value is $0$, then the vertex is inside the Kernel.

* Try to start with the vertex with the least predecessors
* Give the vertex the value 0
* Until every vertex has received a value
    * Navigate to the vertex successors
    * Give them the lowest value not taken by a predecessor ($\ge 0$)
    * You can change a vertex value if the constraint above is not respected <small> (a vertex took the same value as an adjacent vertex)</small>

The Grundy function result is not unique, unless we sorted the vertices beforehand. We will usually sort the vertices by the number of successors before using the algorithm.

The result can be used to color a graph. Each group of vertices having the same value will have the same color.

➡️ See also: [Grundy Number](https://en.wikipedia.org/wiki/Grundy_number).
</div></div>

<hr class="sep-both">

## Trees

<div class="row row-cols-lg-2"><div>

A tree is a graph having one of these properties (they are equivalent)

* Connected and acyclic
* Any two vertices can be connected by a unique path
* Connected but would be disconnected if we are removing an edge
* Acyclic but would be cyclic if we are adding one edge
* Connected and $|E| = |V| - 1$
* Acyclic and $|E| = |V| - 1$
* ...

➡️ See also: [Trees Examples](_examples/trees.md).

<br>

#### Spanning tree

A spanning tree $T$ is a spanning subgraph that is a tree.

* It does not exist if $G$ is disconnected
* T is a partially connected and acyclic graph of G
* Removed edges are forming a cycle basis
</div><div>

#### Minimum weight spanning tree (MST)

We consider non-oriented graphs with a weight on each edge. We want to create a spanning tree while minimizing the total weight.

**Kruskal's algorithm**

1. Start by drawing all the vertices
2. While the graph is not yet a tree
   1. List the edges in ascending order of their weights.
   2. For each edge in the list: try adding it to the tree if adding it doesn't create a cycle.

**Prim's algorithm**

1. Pick a starting vertex and add its linked edges to a set $S$.
2. While $S$ isn't empty:
   1. Pick the edge in $S$ with the least weight
   2. Add it to the tree if it doesn't create a cycle
   3. Remove the edge from $S$
   4. Add the edges connected to the newly added vertex and that are not in our tree into $S$
</div></div>

<hr class="sep-both">

## Shortest Path Problem

<div class="row row-cols-lg-2"><div>

➡️ See also: [Shortest Path Problem Examples](_examples/shortest.md).

#### Dijkstra's Algorithm

If $G$ is a weighted graph with only positives weights, we can use Dijkstra's Algorithm to find the shortest path.

1. At $i=0$, the shortest path value is 0 for the starting vertex, and it's set to $+\infty$ for all other vertices. The starting vertex is considered "done," meaning its shortest path value is the final result.
2. At $i+1$, we follow these rules:
   * If there is an edge between the last "done" vertex and another vertex not marked as "done" with a weight of 'w'
   * And if the sum of 'w' and the shortest path value of the last "done" vertex is less than the current shortest path value of the other vertex.
   * Then, we update the shortest path value for the other vertex to 'w' plus the shortest path value of the last "done" vertex.
3. After applying these rules to all vertices, we mark the vertex with the least weight as "done." We repeat step 2 and 3 until all vertices are marked as "done."

The complexity is: $O(n^2)$.

#### Bellman–Ford Algorithm

This algorithm is similar to Dijkstra's algorithm, but the weight can be either positive or negative (complexity $O(n*m)$). The algorithm won't work if there is a negative-weight cycle because we can always make another iteration and reduce the shortest path value.

You will have up to $|V|-1$ iterations. If you have an iteration with no changes, then the algorithm is done.

The differences with Dijkstra are for $i+1$: each time we update the shortest path, we check and update every successor.
</div><div>

#### Floyd–Warshall Algorithm

This algorithm works with positive and negative weights. It has a complexity of $O(m^2)$. It gives the shortest path starting from any vertex to any vertex. First, create the incidence matrix:

* put the weight if you have one
* if vertex = self, then set $0$
* otherwise set $+\infty$

Then, $\forall{k, i, j}$ to $n$, apply this instruction: if the distance i,j $d(i,j)$ is greater than $z = d(i,k) + d(k,j)$, then $d(i,j) = z$.

<br>

#### Johnson's Algorithm

Johnson's algorithm makes use of both Bellman-Ford and Dijkstra's Algorithms. The shortest distance from $q$ to $X$ will be in $h[X]$.

* we are adding a vertex $q$ to our graph
* we are connecting this vertex to all vertices <small>(weight=0)</small>
* we are evaluating Bellman-Ford <small>(starting from $q$)</small>
* we got $n$ distances, stored in an array $h$

We then revaluate each weight: $w(X,Y) = w(X,Y) + h[X] - h[Y]$. Once the new graph is complete, we use Dijkstra's algorithm on it.
</div></div>

<hr class="sep-both">

## Random Notes

<div class="row row-cols-lg-2"><div>

➡️ See also: [Random Graph Examples](_examples/random.md).

#### Distance and Diameter

The distance $d(A, B)$ is the length of the path with the least nodes connecting $A$ and $B$.

The Diameter $diam(G)$ is the greatest distance.
</div><div>

#### Matching (graph theory)

A matching in a graph is a set of edges without common vertices (adjacent vertices). The matching is:

* **Maximal**: we cannot add more edges to the matching
* **Maximum**: we cannot create a matching with more edges
* **Perfect/Complete**: every vertex in the matching is part of a path

A perfect matching is both maximum and maximal. A maximum matching is also maximal.

**Algorithm**

* Pick an edge, for instance, $(A,B)$
* Remove all edges connected to $A$ or $B$
* Mark the edge as "picked"
* Repeat until all edges are either "picked" or "removed"
</div></div>