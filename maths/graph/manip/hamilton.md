# Hamiltonian graph

[Go back](..)

An hamiltonian graph is

* a connected graph
* that have a cycle/circuit traversing **each vertex once**.

We are adding "semi-" before hamiltonian
if the graph have a chain/path traversing **each vertex once**
instead of a cycle/circuit.

<hr class="sl">

## Algorithm

There isn't a proper algorithm. A graph will be Hamiltonian
for sure if

* $n \ge 3$ and all degrees are $\ge \frac{n}{2}$
* or, $n \ge 3$ and $\forall{x,y}$ not neighbor, $d(x)+d(y) \ge n$