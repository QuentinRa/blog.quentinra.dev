# Dijkstra's algorithm

[Go back](..)

If $G$ is a weighted graph with **only positives
weights** then you can use dijkstra's algorithm
(complexity $O(n^2)$).

Dijkstra will give you the shortest path starting
from a vertex (`A` for instance) to any other vertices
(B, ...).

The easiest way to modelize the dijkstra's algorithm
is a table of the steps (i=0 to n) by the vertices
(A, B, ...). A case like (0,A) is representing the
shortest path value after 0 iterations.

At $i=0$, the shortest path value is $0$ for your
starting vertex and $+\infty$ for all other vertex.
You will also consider your selected vertex done,
meaning that the value as the shortest path value
is the final result.

At $i+1$, selected the vertex not done having the
least weight. The shortest path value is the
previous shortest path value plus the weight
of the edge linking this vertex and the the last vertex
done. Don't forget to set your new vertex as done
and do it until all of them are done.