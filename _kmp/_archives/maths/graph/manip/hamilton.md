# Hamiltonian graph

[Go back](..#sorting-and-search)

A Hamiltonian graph is a **connected graph**, that has a cycle/circuit traversing **each vertex once** (=Hamiltonian cycle/circuit).

We are adding "semi-" before Hamiltonian if the graph has a chain/path traversing **each vertex once** instead of a cycle/circuit.

<hr class="sl">

## Algorithm

There isn't a proper algorithm. A graph will be Hamiltonian for sure if

* $n \ge 3$ and all degrees are $\ge \frac{n}{2}$
* or, $n \ge 3$ and $\forall{x,y}$ not neighbor, $d(x)+d(y) \ge n$

<hr class="sr">

## Example

Find a Hamiltonian path.

![](images/hamilton.png)

<blockquote class="spoiler">
There is the path $(b,a,c,e,d,f)$. We have $(f,b,a,c,e,d)$ too. And we have $(a,c,e,d,f,b)$ too. Did you notice? That's the same path, but we are starting at a different node, so it seems that we only have one answer.
</blockquote>