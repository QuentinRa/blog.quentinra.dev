# Graph Coloring Problems Examples

<hr class="sep-both">

## Vertex coloring Greedy Algorithm Example

<div class="row row-cols-lg-2"><div>

Use Welsh-Powell greedy algorithm and find the coloration for the following graph. Is it the optimal solution?

![Vertex coloring Greedy algorithm Example Graph](../_images/coloring/coloring1.png)

* $d(D)=7$
* $d(F)=6$
* $d(A)=d(C)=5$
* $d(B)=d(G)=d(H)=4$
* $d(E)=3$
</div><div>

Giving us the following table:


| Colors\Vertex | D | F | A | C | B | G | H | E |
|---------------|---|---|---|---|---|---|---|---|
| Red           | o | x | x | x | x | x | x | x |
| Yellow        |   | o | x | o | x | x | x | x |
| Green         |   |   | o |   | x | x | o | x |
| Blue          |   |   |   |   | o | o |   | o |

* o=colored
* x=not colored since neighbor to a colored
* "nothing"=already colored

The longest clique is $D-C-A-H$ (size=4) and we colored the graph in $4$ colors, so this is the optimal solution. We had the clique $F-D-G-E$ too.
</div></div>

<hr class="sep-both">

## Vertex coloring Contraction Algorithm Example

<div class="row row-cols-lg-2"><div>

Use the contraction algorithm to find a coloration for this graph:

![Vertex coloring Contraction Algorithm Example Graph](../_images/coloring/coloring2.png)
</div><div>

We got 4 missing edges, so we will have up to $2^4=16$ subgraphs. We are missing the following edges: $[c,b], [d,b], [e,b], [c,f]$.

![](../_images/coloring/coloring2-1.png)
</div></div>

Let's apply the algorithm <small>(note: C=Contraction, L=Link=Connect)</small>:

![](../_images/coloring/coloring2-2.png)

<div class="row row-cols-lg-2"><div>

The smallest clique among the **7** graphs with the symbol ✔️ is:

* $CF-DB-E-A$: 4 colors
* $CF-D-BE-A$: 4 colors
</div><div>

It means one way to color the graph is:

![](../_images/coloring/coloring2-3.png)
</div></div>