# Random Graph Examples

<hr class="sep-both">

## Distance and Diameter Example

<div class="row row-cols-lg-2"><div>

Given the following graph:

![Distance in a graph - example - graph](../_images/shortest/distance.jpg)
</div><div>

We would have the following table:

![Distance in a graph - example - table](../_images/shortest/distance2.png)

The value for $d(x, 2) * d(1, y) = 1$ means that when the starting vertex is $1$ and the ending vertex is $2$, then the distance is $1$.

You could read that the diameter is $4$ because the longest path is $7-6-4-5-2$ (4 edges) (or $2-5-4-6-7$).
</div></div>

<hr class="sep-both">

## Graph Matching Example

Give a maximal matching, maximum matching, and perfect matching of the graph $G$.

![Example - Graph G](../_images/matching/matching1.png)

Note: this graph is called the Petersen graph.

<blockquote class="spoiler">
Note

* red: picked
* blue: removed

Using the algorithm, I could get the following maximal matching

![Example - Maximal matching](../_images/matching/matching1-1.png)

I found this perfect matching, which means that I also found a maximal and a maximum matching

![Example - Perfect matching](../_images/matching/matching1-2.png)
</blockquote>