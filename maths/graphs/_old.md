# Terminology

<table class="table table-bordered border-dark table-striped">
    <thead>
        <tr>
            <th>name</th>
            <th>description</th>
        </tr>
    </thead>
    <tbody>
        <tr>
            <td>
                density*<br>
                <code>Densité</code>
            </td>
            <td>
                This is the number of edges of our graph divided by the number of edge of the complete graph (see below).
            </td>
        </tr>
        <tr>
            <td>
                d-regular graph <br>
                <code>Graphe k-régulier</code>
            </td>
            <td>
A regular graph or d-regular graph is a graph where all degrees have the same value (d, for instance, 3-regular graph).
            </td>
        </tr>
        <tr>
            <td>
                complete graph $K_n$ <br>
                <code>Graphe complet</code>
            </td>
            <td>
Each and every vertex is adjacent to all other vertices aside itself, giving us $|V| = \frac{n(n-1)}{2}$.
            </td>
        </tr>
        <tr>
            <td>
                bipartite graph $K_{a,b}$ <br>
                <code>Graphe bi-parti</code>
            </td>
            <td>
We can split the vertices into 2 groups: the group having a degree a and the group having a degree b with $b > a \ge 1$. Each vertex in the first group must be adjacent to $a$ vertex in the second (resp. second group and $b$).
            </td>
        </tr>
        <tr>
            <td>
                clique<br>
                <code>Clique</code>
            </td>
            <td>
                A clique is a complete subgraph.
            </td>
        </tr>
    </tbody>
</table>

**You may do these exercises**: [exercises](exercises.md).

<hr class="sl">

## Advanced Terminology

* Matrix
  * [Adjacency matrix](terms/adj.md)
  * [Incidence matrix](terms/inc.md)
  * [Degree matrix](terms/degree.md)
* [Transitive closure](terms/tc.md)
* [Spanning graph](terms/partial.md)
* [Connected graphs](terms/connected.md)
* [Planar graph](terms/planar.md)
* [Graph matching](terms/matching.md)
* [Independent set](terms/independence.md)
* [Cycle basis](terms/cycle_basis.md)

<hr class="sr">

## Sorting and search

You can sort a graph using

* [Topological sorting](manip/ts.md)

You can search a graph using

* [Depth-first search](manip/dfs.md)
* [Breadth-first search](manip/bfs.md)

And you can solve the problems of passing once by an edge/a vertex with

* [Eulerian graph](manip/euler.md)
* [Hamiltonian graph](manip/hamilton.md)

<hr class="sl">

## Graph coloring problems

You will try to color a graph (vertex/edges) will the least colors.

* [Vertex coloring](coloring/vertex.md)
* [Edge coloring](coloring/edges.md)

What you learned here is very similar to the notion of an independent set. In fact, you can use Grundy to find a coloration. I do not know why we learned those separately. Look for [Grundy number or Grundy chromatic number](https://en.wikipedia.org/wiki/Grundy_number).

A graph coloring problem could be something like "A, B, C, D, E" must pass some tests, but they can't be in the same room for the same test. We are giving you a table of which tests they are passing, and your goal is to find the minimum of rooms needed. You can also have a similar problem like "A, B, C, D, E" can't be in the same room (you got a table of which one can't be with which one) and you have to find at least how many rooms are needed (make a graph of which can't be with which and solve it).

<hr class="sr">

## Trees

A tree is a graph having one of these properties (they are equivalent)

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

## The shortest path problem

You have 4 algorithms explained here (out of 6)

* [Dijkstra's algorithm](sp/dijkstra.md)
* [Bellman–Ford algorithm](sp/bellman-ford.md)
* [Distance and Diameter](sp/distance.md)

<hr class="sr">

## Scheduling problem

In French, it's called `Ordonnancement`. You are given

* a list of tasks and their dependencies (like a task need another one to be done first)
* the duration of each task

And your job is to create the best schedule, meaning that you must find the best way to organize the tasks making the project the shorter possible (it's not only used in projects).

Here, we are considering that we can execute an unlimited number of tasks in parallel, and we do not take delays into account, so it's a simplified version of scheduling's problems.

* [Terminology](scheduling/index.md)
* [Critical path analysis](scheduling/cpa.md)
* [Metra potential method](scheduling/pt.md)
* [P.E.R.T. method](scheduling/pert.md)

You should have noticed, but our two methods are giving the same result (same critical path, same optimal duration, ...). This is a way of checking that you did things right. Note that there will be some differences with the early_start/last_start values.