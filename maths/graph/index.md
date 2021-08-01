# Introduction

A graph $G$, is a set of **vertices** (=nodes=`sommets/nœuds`) $V$
linked by **edges** (=links=`arêtes`) $E$ giving us the notation
$G(V, E)$. Vertices can have a direction or not.

![example](example.svg)

You will use graphs in databases in GraphDatabase,
check the NoSQL course if that was what you are looking
for.

<hr class="sl">

## Kinds of graphs

A graph can be simple/multiple and directed or not.

* **simple graph** (``graphe simple``): up to one edge between
  two vertex (2 if "directed graph") and no loop/self-edges.
* **multiple graph** (`graphe complexes`): graphs that are not simple
* **undirected graph** (`Graphe non orientés (GNO)`): edges do not have a direction,
  they are written $(a,b)$
* **directed graph** (`Graphe orientés (GO)`): edges, called arcs, have a direction,
  they are written $[a,b]$

<table class="table table-bordered table-dark table-striped">
    <thead>
        <tr>
            <th>undirected graph</th>
            <th>directed graph</th>
            <th>description</th>
        </tr>
    </thead>
    <tbody>
        <tr>
            <td>
                edge <br>
                <code>arête</code>
            </td>
            <td>
                arc <br>
                <code>arc</code>
            </td>
            <td>
                The keyword for edges in changing
                if the graph is directed or not.
            </td>
        </tr>
        <tr>
            <td>
                chain/walk <br>
                <code>Chaine</code>
            </td>
            <td>
                path/trail <br>
                <code>chemin</code>
            </td>
            <td>
                Each vertex degree is 2
                aside from the extremities (degree=1).
            </td>
        </tr>
        <tr>
            <td>
                cycle/tour <br>
                <code>cycle</code>
            </td>
            <td>
                circuit <br>
                <code>circuit</code>
            </td>
            <td>
                Each vertex degree is 2. This is also
                called "closed walk/path/...".
            </td>
        </tr>
        <tr>
            <td>
                star <br>
                <code>étoile</code>
            </td>
            <td>
                star <br>
                <code>étoile</code>
            </td>
            <td>
                One vertex degree is $|V|-1$ and
                the others are of degree $1$. It's a vertex
                linked to all other vertices.
            </td>
        </tr>
        <tr>
            <td>
                wheel <br>
                <code>roue</code>
            </td>
            <td>
                wheel <br>
                <code>roue</code>
            </td>
            <td>
                One vertex degree is $|V|-1$ and
                the others are of degree $3$. It's a vertex
                linked to all other vertices and each
                vertex is linked to two aside from the center
                of the wheel.
            </td>
        </tr>
        <tr>
            <td>
                butterfly/hourglass <br>
                <code>papillon</code>
            </td>
            <td>
                butterfly/hourglass <br>
                <code>papillon</code>
            </td>
            <td>
                One vertex degree is $|V|-1=4$ and
                the others are of degree $2$. The graph is
                make of $6$ edges and $5$ vertices.
            </td>
        </tr>
    </tbody>
</table>

Note: the degree is the number of neighbors, see next part.

<hr class="sr">

## Terminology

<table class="table table-bordered table-dark table-striped">
    <thead>
        <tr>
            <th>name</th>
            <th>description</th>
        </tr>
    </thead>
    <tbody>
        <tr>
            <td>
                adjacent/neighbor <br>
                <code>Adjacent/Voisins</code>
            </td>
            <td>
                Two nodes are adjacent if they are linked
                by an edge. <br><br>
                The notation is $N(X)$ or $\Gamma(X)$ (gamma)
                for the adjacent nodes of X. With arcs, we use
                $N^{+}(X)$ (arc entering/arriving) and
                $N^{-}(X)$ (arc exiting).
            </td>
        </tr>
        <tr>
            <td>
                degree <br>
                <code>Degré</code>
            </td>
            <td>
                The number of neighbors. <br><br>
                The notation is $d(X) = |\Gamma(X)|$. In a directed
                graph, this is $|\Gamma^{+}(X)| + |\Gamma^{-}(X)| = d^+(X) + d^-(X)$.
                (called <code>demi degré extérieur/prédécesseur (entrants)</code> and
                <code>demi degré intérieur/successeur (sortants)</code>).
            </td>
        </tr>
        <tr>
            <td>
                incidence <br>
                <code>incidence</code>
            </td>
            <td>
                A vertex is incident to an edge if they
                are linked.
            </td>
        </tr>
        <tr>
            <td>
                order <br>
                <code>ordre</code>
            </td>
            <td>
                The number of vertices, $|V|$, $|V(G)|$
                  while the cardinal $|V|$ (=the number of elements of a set V)
                  can also be noted, $\#V$ or $Card(V)$.
            </td>
        </tr>
        <tr>
            <td>
                order <br>
                <code>ordre</code>
            </td>
            <td>
                The number of vertices, $|V|$, $|V(G)|$
                  while the cardinal $|V|$ (=the number of elements of a set V)
                  can also be noted, $\#V$ or $Card(V)$.
            </td>
        </tr>
    </tbody>
</table>

<hr class="sl">

## Sorting and search

You can sort a graph using

* [Topological sorting](manip/ts.md)

You can search a graph using

* [Depth-first search](manip/dfs.md)
* [Breadth-first search](manip/bfs.md)

And you can solve the problems of passing once by
a edge/vertex with

* [Eulerian graph](manip/euler.md)
* [Hamiltonian graph](manip/hamilton.md)

<hr class="sr">

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

<hr class="sl">

## Shortest path problem

You have 4 algorithms explained here (out of 6)

* [Dijkstra's algorithm](sp/dijkstra.md)
* [Bellman–Ford algorithm](sp/bellman-ford.md)
* [Floyd–Warshall algorithm](sp/floyd-warshall.md)
* [Johnson's algorithm](sp/johnson.md)
* [Distance and Diameter](sp/distance.md)

<hr class="sr">

## Scheduling problem

In French it's ``Ordonnancement``. You are given

* a list of tasks and their dependencies (like a task need another one to be done first)
* a tasks duration

And your job is to create the best schedule meaning that
you must find the best way to organize the tasks making
the project the shorter possible.

It's not only used in project, but here we are considering
that we can execute an unlimited number of tasks in parallel
and we do not take delays in account so it's a simplified
version of scheduling.

* [Terminology](scheduling/index.md)
* [potentiel-tâche method](scheduling/pt.md)
* [P.E.R.T. method](scheduling/pert.md)

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
* <https://en.wikipedia.org/wiki/Sprague%E2%80%93Grundy_theorem>
* <https://en.wikipedia.org/wiki/Bridge_(graph_theory)>
* <https://fr.wikipedia.org/wiki/M%C3%A9thode_potentiel-t%C3%A2che>
* <https://en.wikipedia.org/wiki/Program_evaluation_and_review_technique>
* <https://en.wikipedia.org/wiki/Critical_path_method>

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