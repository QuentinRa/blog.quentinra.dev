# Cycle basis

[Go back](..#advanced-terminology)

Let $E$ the set of edges, **ordered**.
If you are not given a order for the edges,
create one. If the graph is not directed,
arbitrarily pick a direction for each each edge.

We are writing each cycle as a vector of values
such as $C_n = (0, ...,1,-1)$

* 0: if the edge is not inside the cycle
* 1: if the edge is inside the cycle, in the same direction
* -1: if the edge is inside the cycle, not in the same direction

A cycle basis $B$ is a set of cycles as vectors so that the
basis linear independent and generating (``libre et génératrice``).
Something like $B=\\{C_1,C_2\\}$.

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

A co-cycle basis $B$ is a set of co-cycles as vectors so that the
basis linear independent and generating (``libre et génératrice``).
Something like $B=\\{C_1,C_2\\}$.

We are written $\gamma(G)$ (gamma) the number of elements
of a cycle basis, with $\gamma(G) = n - p$ and $p$
the number of connected components.

<hr class="sr">

# Exercise 1 - cycle basis

![](images/cycle_basis1.png)

The edges' set is

@
E = \\{(a,b),(a,c),(a,d),(b,c),(b,f),(c,e),(c,f),(d,e),(e,f)\\}
@

1. Give the vectors for the cycles
   * $(bcfb)$
   * $(abfeda)$
2. $(bcfb)$ is a linear combination of 2 cycles. Which ones?
3. What's $\mu(G)$?
4. Give a cycle basis $B$, which mustn't include 
both $(bcfb)$ and $(abfeda)$.

<blockquote class="spoiler">

1. we are simply doing what is explained above
   * $(bcfb) \to (0,0,0,1,-1,0,1,0,0)$
     * the 4th value is $1$ since $bc$ is in $bcfb$ in the same order
     * the 5th value is $-1$ since $bf$ is in $bcfb$ ($fb$) 
     but not in the same order

   * $(abfeda) \to (1,0,-1,0,1,0,0,-1,-1)$

2. one answer would be $(bcfb) = (bcefb) + (ecfe)$
@
(bcfb) \to (0,0,0,1,-1,0,1,0,0) = 
(0,0,0,1,-1,1,0,0,1) + (0,0,0,0,0,-1,1,0,-1) =
(bcefb) + (ecfe)$
@
3. $m - n + p \Leftrightarrow 9-6+1 = 4$

4. $B = \\{(abca), (cfec), (acefba), (adeca)\\}$

You must look for cycles that have an arc that is
not in a cycle you already created so that you are sure
that can't get it by linear combination.

</blockquote>