# Cycle basis

[Go back](..#advanced-terminology)

Let $E$ the set of edges, **ordered**. If you are not given an order for the edges, create one. If the graph is not directed, arbitrarily pick a direction for each edge.

We are writing each cycle as a vector of values such as $C_n = (0, ...,1,-1)$

* $0$: if the edge is not inside the cycle
* $1$: if the edge is inside the cycle, in the same direction
* $-1$: if the edge is inside the cycle, not in the same direction

A cycle basis $B$ is a set of cycles as vectors, so that the basis is linearly independent and generating (``libre et génératrice``). Something like $B=\\{C_1,C_2\\}$.

We are written $\mu(G)$ (mu) the number of elements of a cycle basis, with $\mu(G) = m − n + p$ and $p$ the number of connected components.

<hr class="sl">

# Co-cycle basis

We are calling co-cycles (`cocycles`) of $A$, the set of arcs incident of $A$, noted $\omega{(A)}$.

* $1$: if an edge $(a,b)$ got $a$ inside the co-cycle, $b$ outside
* $-1$: if an edge $(a,b)$ got $b$ inside the co-cycle, $a$ outside
* $0$: otherwise

A co-cycle basis $B$ is a set of co-cycles as vectors so that the basis is linearly independent and generating (``libre et génératrice``). Something like $B=\\{C_1,C_2\\}$.

We are written $\gamma(G)$ (gamma) the number of elements of a cycle basis, with $\gamma(G) = n - p$ and $p$ the number of connected components.

<hr class="sr">

## Exercise 1 - cycle basis

The edges' set for the following graph is

@
E = \\{(a,b),(a,c),(a,d),(b,c),(b,f),(c,e),(c,f),(d,e),(e,f)\\}
@

![Exercise 1 - graph](images/cycle_basis1.png)

1. Give the vectors for the cycles
   * $(bcfb)$
   * $(abfeda)$
2. $(bcfb)$ is a linear combination of 2 cycles. Which ones?
3. What's $\mu(G)$?
4. Give a cycle basis $B$, which mustn't include both $(bcfb)$ and $(abfeda)$.

<blockquote class="spoiler">

1. we are simply doing what is explained above
   * $(bcfb) \to (0,0,0,1,-1,0,1,0,0)$
     * the 4th value is $1$ since $bc$ is in $bcfb$ in the same order
     * the 5th value is $-1$ since $bf$ is in $bcfb$ ($fb$) but not in the same order

   * $(abfeda) \to (1,0,-1,0,1,0,0,-1,-1)$

2. one answer would be $(bcfb) = (bcefb) + (ecfe)$
@
(bcfb) \to (0,0,0,1,-1,0,1,0,0) = 
(0,0,0,1,-1,1,0,0,1) + (0,0,0,0,0,-1,1,0,-1) =
(bcefb) + (ecfe)$
@
3. $\mu(G) = m - n + p \Leftrightarrow 9-6+1 = 4$

4. $B = \\{(abca), (cfec), (acefba), (adeca)\\}$

You must look for cycles that have an arc that is not in a cycle you already created so that you are sure that can't get it by linear combination. Notice that we got $4$ cycles inside $B$, as expected.

</blockquote>

<hr class="sl">

## Exercise 2 - co-cycle basis

The edges' set for the following graph is

@
E = \\{(a,b),(a,c),(a,d),(b,c),(b,f),(c,e),(c,f),(d,e),(e,f)\\}
@

![Exercise 2 - graph](images/cycle_basis2.png)

1. Give the vectors for the co-cycles
    * $(abf)$
    * $(ae)$
2. $(ae)$ is a linear combination of 2 co-cycles. Which ones?
3. What's $\gamma(G)$?
4. Give a cycle basis $B$, which mustn't contain co-cycles of one vertex.

<blockquote class="spoiler">

1. we are simply doing what is explained above
    * $(abf) \to (0,1,1,1,0,0,-1,0,-1)$
      * the $2^{nd}$ value $(a,c)$, $a$ is inside, $c$ outside so $1$
      * the $7^{th}$ value $(c,f)$, $c$ is outside, $f$ inside so $-1$

    * $(ae) \to (1, 1, 1, 0, 0, -1, 0, -1, 1)$

2. one answer would be $(ae) = (a) + (e)$ (because they are a stable set)
3. $\gamma(G) = n - p \Leftrightarrow 6-1 = 5$

4. $B' = \\{(abc), (bcf), (cfe), (aced), (abfed)\\}$

Notice that we got $5$ co-cycles inside $B$, as expected.

</blockquote>