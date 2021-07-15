# MATCH

[Go back](..)

MATCH is taking a path. In a graph, a patch is starting
with a node and ending with a node. You will links the nodes
using the edges.

* ``(ref)``: a patch of one node
* ``(ref)-[]->(ref)``: a patch of two nodes with a direction
* ``(ref)-[]->()<-[]-()``: a patch of three nodes
* ``(ref)-[]->()-[]->()``: a patch of three nodes
* ...

<hr class="sr">

Examples

```sql
// returns node(s) where table=ShowbizPerson
MATCH (s:ShowbizPerson)
RETURN s

// storing the match inside m
MATCH m = (:ShowbizPerson)-[]->()
RETURN m
LIMIT 5

// all of the edges linked to 
// a ShowbizPerson having the name "Keanu Reeves"
MATCH m = (:ShowbizPerson{ name: "Keanu Reeves" })-[]->()
RETURN m
```