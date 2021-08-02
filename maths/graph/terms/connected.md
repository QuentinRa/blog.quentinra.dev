# Connected graphs

[Go back](..#advanced-terminology)

A graph is connected (`connexe`) if we only have
one connected component (`composante connexe`). Otherwise,
we are calling the graph disconnected (`non connexe`).

A connected component is subgraph of $G$ while all
vertex inside are connected. A strong component
(`composante connexe maximale`) is a connected component
in which we can't add more vertex inside.

**Algorithm**

* pick a vertex
* start with the first connected component $C_i$, $i=0$
* while there are vertex remaining
  * for each vertex
    * if $C_i$ is empty or this vertex is adjacent to a vertex
      inside $C_i$
    * then: we add it
    * else: we go to the next vertex
  * i++