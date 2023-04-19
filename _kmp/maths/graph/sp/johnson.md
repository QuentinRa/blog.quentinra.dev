# Johnson's algorithm

[Go back](..)

This is really complex without a computer, as you will make a new graph using Bellman-Ford, then use the Dijkstra algorithm to get the shortest path.

* we are adding a vertex ($q$) to our graph
* we are linking this vertex to all vertices (weight=0)
* we are evaluating Bellman-Ford (starting from $q$)
* we got $n$ distances, stored in an array $h$

The shortest distance from $q$ to $X$ is in $h[X]$.

We will replace each weight by $w(X,Y) = w(X,Y) + h[X] - h[Y]$. For instance,

* $w(A,B)=5$ (the edge weight between A and B is 5)
* $h[A]=3$
* $h[B]=2$
* then the new edge value is $(A,B) = 5 + 3 - 2 = 6$

Like this, you created a new graph (the same one but with different weights). Once you did, simply use Dijkstra's algorithm.