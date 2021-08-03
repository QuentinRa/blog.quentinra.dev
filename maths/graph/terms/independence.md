# Independent set

[Go back](..#advanced-terminology)

In French, we are mainly using the keywords
``Stable`` and `Stabilité`.
The independence set, also called
stable set/`ensemble stable` is a set $S$
in which we can't find two vertex that are adjacent.

* **maximal independent set**: not stable anymore if we add a vertex
* **maximum independent set**:
  * we can't make a set with more vertices
  * $\alpha (G) = Card(\text{maximum_stable_set})$
* let $h$ be the highest degree

@
|\text{maximum_stable_set}| \ge \lceil \frac{n}{h+1} \rceil
@

<hr class="sl">

## Partitioning

A partition of $G$ is a set made by taking vertex
(and their edges) from $G. Each subgraph created
must be complete (=a clique). All vertex can only
be used in one clique.

As always

* **maximal partition**: we can't add one more vertex otherwise
this is not a partition anymore
* **maximum partition**: we can't find a greater clique
* **minimum partition**: we can't find a lesser clique
* **minimal partition**: we can't remove one more vertex otherwise
  this is not a partition anymore

And node

* $|S| \le |P|$
* $|S| = |P|$ (if $S$ is a maximum stable set and $P$ a minimum partition)

<hr class="sr">

## Absorbing set

An Absorbing set (`Ensemble absorbant`) is a set where

* each vertex outside the set
* is linked to at least one vertex inside the set

<hr class="sl">

## Kernel

A kernel is a set both stable and absorbing. A graph
can have $0$, $1$ or more kernels.

**Sprague–Grundy function** (`Fonction de Grundy`)

The function is returning the least value we
can give to a vertex. If this is $0$, then the
vertex is inside the Kernel.

* you should start with a kernel without predecessor (if you can)
* give the first vertex value 0
* it's predecessor will have the value 1
* then you should move to one of the predecessor
* if it's predecessor does not have a value
  * then it's 0
  * otherwise this is the least value we can give that is not
  already used by an adjacent vertex

The grundy function result is not unique, **unless** you applied
a topological sorting to sort
the vertex before applying the function.