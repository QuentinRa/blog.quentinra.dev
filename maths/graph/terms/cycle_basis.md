# Cycle basis

[Go back](..#advanced-terminology)

Let $E$ the set of edges, ordered. We are
writing each cycle as a vector of values
such as $C_n = (0, ...,1,-1)$

* 0: if the edge is not inside the cycle
* 1: if the edge is inside the cycle, in the same direction
* -1: if the edge is inside the cycle, not in the same direction

A cycle basis $B$ is a set of cycles so that the
basis linear independent and generating (``libre et génératrice``).

We are written $\mu(G)$ (mu) the number of elements
of a cycle basis, with $\mu(G) = m − n + p$ and $p$
the number of connected components.

<hr class="sl">

# Co-cycle basis

We are calling co-cycles (`cocycles`) of $A$,
the set of arcs incident of $A$, noted $\omega{(A)}$.

* 0: if the edge is not inside the co-cycle
* 1: if the edge is inside the co-cycle, in the same direction
* -1: if the edge is inside the co-cycle, not in the same direction

A co-cycle basis $B$ is a set of co-cycles so that the
basis linear independent and generating (``libre et génératrice``).

We are written $\gamma(G)$ (gamma) the number of elements
of a cycle basis, with $\gamma(G) = n - p$ and $p$
the number of connected components.