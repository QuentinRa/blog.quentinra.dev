# Eulerian graph

[Go back](..)

An eulerian graph is

* a connected graph
* having all degrees even (two odd allowed, see semi)
* that have a least one eulerian graph/path

We are calling eulerian,
a cycle/circuit/chain/path traversing **each edge once**.

We are adding "semi-" before eulerian
is the graph have exactly 2 odd degrees, because
adding one edge will make the graph eulerian.

<hr class="sl">

## Algorithm

Remember: a bridge (=`isthme`) is an edge that once removed
will disconnect the graph.

* let $S$ be the list of traversed edges
* randomly pick a vertex
* while all the edges are not in $S$
  * we are looking at our current vertex links
  * if all of them are in $S$ then "fail"
  * else if the only edge is a link, then we traverse it
  * else we randomly traverse one of the other links

Traversing means adding it to $S$ and changing our
current vertex.