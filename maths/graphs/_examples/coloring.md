# Vertex coloring

[Go back](..#graph-coloring-problems)

<hr class="sl">

## Exercise 1 - Greedy algorithm

Use Welsh-Powell greedy algorithm and find the coloration for the following graph. Is it the optimal solution?

![](images/coloring1.png)

<blockquote class="spoiler">

* $d(D)=7$
* $d(F)=6$
* $d(A)=d(C)=5$
* $d(B)=d(G)=d(H)=4$
* $d(E)=3$

Giving us the following table

* o=colored
* x=not colored since neighbor to a colored
* "nothing"=already colored

| Colors\Vertex | D | F | A | C | B | G | H | E |
|---------------|---|---|---|---|---|---|---|---|
| Red           | o | x | x | x | x | x | x | x |
| Yellow        |   | o | x | o | x | x | x | x |
| Green         |   |   | o |   | x | x | o | x |
| Blue          |   |   |   |   | o | o |   | o |

We are checking: the longest clique is $D-C-A-H$ (size=4) and we colored the graph in $4$ colors, this is the optimal solution. We had the clique $F-D-G-E$ too.
</blockquote>

<hr class="sr">

## Exercise 2 - Contraction

Use the contraction algorithm and find the coloration for the following graph.

![](images/coloring2.png)

<blockquote class="spoiler">

We got 4 missing edges so up to $2^4=16$ graphs we will have to make for $[c,b], [d,b], [e,b], [c,f]$.

![](images/coloring2-1.png)

And the result is

![](images/coloring2-2.png)

With L=Link and C=Contraction. The smallest clique (we are among the graphs with the symbol ✔️) is

* $CF-DB-E-A$: 4 colors
* $CF-D-BE-A$: 4 colors

So we can color our graph like this

![](images/coloring2-3.png)
</blockquote>