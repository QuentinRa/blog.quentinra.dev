# Breadth-first search

[Go back](..#sorting-and-search)

In French it's called ``Parcours en largeur``.
You will pick a vertex, mark it's neighbor until
each vertex neighbor are marked.

**Algorithm**

* randomly pick a starting vertex
* init a list of the next vertex to check
* mark it
* then until you have vertex in the list
  * pick one
  * add the vertex neighbors, if they are not marked or in the list

Complexity: $O(|V|+|E|)$.