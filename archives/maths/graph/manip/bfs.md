# Breadth-first search

[Go back](..#sorting-and-search)

In French it's called `Parcours en largeur`. You will pick a vertex, mark its neighbors until each vertex's neighbors are marked.

**Algorithm**

* randomly pick a starting vertex
* add your vertex's neighbors in a list $S$
* mark your vertex
* then until you have a vertex in the list $S$
  * pick the first vertex
  * mark it, and remove it from $S$
  * add its neighbors in $S$, if they aren't already inside, or already marked

Complexity: $O(|V|+|E|)$.

<hr class="sr">

## Example

Use the Breadth-first search on this graph.

![](images/dfs.svg)

I'm starting from $\text{h}$.

* h
  * $n(\text{h}) = \text{i}$
  * $\text{list} = \text{( i )}$
* i
  * $n(\text{i}) = \text{j, g}$
  * $\text{list} = \text{( j, g )}$
* j
  * $n(\text{j}) = \text{e}$
  * $\text{list} = \text{( g, e )}$
* g
  * $n(\text{j}) = \text{f, d}$
  * $\text{list} = \text{( e, f, d )}$
* e
  * $n(\text{e}) = \text{b, a}$
  * $\text{list} = \text{( f, d, b, a )}$
* f
  * $\text{list} = \text{( d, b, b, a )}$
* d
  * $n(\text{d}) = \text{k, c}$
  * $\text{list} = \text{( b, a, k, c )}$
* b
  * $\text{list} = \text{( a, k, c )}$
* a
  * $\text{list} = \text{( k, c )}$
* k
  * $\text{list} = \text{( c )}$
* c
  * $\text{list} = \text{empty}$

So the result is $h-i-j-g-e-f-d-b-a-k-c$.