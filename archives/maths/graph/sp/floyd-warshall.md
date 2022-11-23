# Floyd–Warshall algorithm

[Go back](..)

The weight can be either positive or negative (complexity $O(m^2)$). This algorithm is giving the shortest path starting from any vertex to any vertex.

* create the incidence matrix
  * put the weight if you have one
  * if vertex = self, then set $0$
  * otherwise set $+\infty$
* $\forall{k, i, j}$ to $n$
  * if the distance i,j $d(i,j)$
  * is greater than
  * $z = d(i,k) + d(k,j)$
  * then $d(i,j) = z$