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

A subgraph $G'$ is a graph formed from a subset of the vertices and edges of the graph $G$. An induced subgraph is a variant where we can only remove a vertex and their incident edges.

#### Complement of a graph

The complement of a graph is a graph in which we are connecting all vertices that were not connected, and disconnected vertices that were connected.

➡️ Ex: The complementary graph of $A-B-C$ is $C-A\hspace{.5cm}B$.

#### Minor of a graph

The minor of a graph $G$ is graph created under these constraints:

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
</div><div>

#### Planar Graph

A planar graph is a graph that could be drawn in such a way that no edges cross each other. 

A face is a surface of the graph delimited by edges. It can be bounded (finite) or external/outer/unbounded (infinite) face.

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

#### Topological sorting

It's a process to sort vertices. Each vertex is before its successors.

* While there are still vertices
  * Pick the vertex with the fewest successors
  * Remove it from the graph

#### Depth-first search

A technique to search a vertex. We will explore a path until the end, then go back and explore its branches until we traversed every branch.

**Algorithm**

* Randomly pick a starting vertex
* Mark it as traversed
* Repeat until the vertex is found or all vertices are tagged "done"
  * Try to randomly pick of a neighbor not traversed and not done
  * If it's possible, mark the vertex as traversed
  * Otherwise, mark the vertex as "done", and go back to the previously traversed vertex.

Complexity: $O(|V|+|E|)$.

#### Breadth-first search

A technique to search a vertex. We will progressively explore the neighbors of each vertex.

**Algorithm**

* Randomly pick a starting vertex
* Add the vertex neighbors in $S$ and tag it "done"
* Repeat until $S$ is empty
  * Pick the first vertex in the list
  * Tag it "done" and remove it from $S$
  * Add its neighbors in $S$ if they aren't in $S$ nor tagged "done"

Complexity: $O(|V|+|E|)$.
</div><div>

And you can solve the problems of passing once by an edge/a vertex with

#### Eulerian graph

A graph is Eulerian if **all vertex's degrees are even**, and it has a **cycle/circuit** traversing **each edge once** (=Eulerian cycle/circuit).

A graph is **semi-Eulerian** if

* exactly 2 degrees are odd
* it has an Eulerian chain/path traversing **each edge once**

Legends are saying that we are adding "semi-" before Eulerian because adding one vertex will make the graph Eulerian.

**Algorithm**

Remember: a bridge (=`isthme`) is an edge that once removed will disconnect the graph. You got one in semi-eulerian graphs.

* let $S$ be the list of traversed edges
* randomly pick a vertex (unless you got a bridge, as you must start at one of the bridge extremities)
* while all the edges are not in $S$
    * we are looking at our current vertex incident edges
    * if all of them are in $S$ then "fail"
    * else if we have exactly one edge that isn't in $S$, then we traverse it
    * else we randomly traverse one of the edges that are nor bridge, nor in $S$

Traversing means adding it to $S$ and changing our current vertex.

#### Hamiltonian graph

A Hamiltonian graph is a **connected graph**, that has a cycle/circuit traversing **each vertex once** (=Hamiltonian cycle/circuit).

We are adding "semi-" before Hamiltonian if the graph has a chain/path traversing **each vertex once** instead of a cycle/circuit.

**Algorithm**

There isn't a proper algorithm. A graph will be Hamiltonian for sure if

* $n \ge 3$ and all degrees are $\ge \frac{n}{2}$
* or, $n \ge 3$ and $\forall{x,y}$ not neighbor, $d(x)+d(y) \ge n$
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