# MATCH

[Go back](..)

MATCH is taking a graph, basically one or more nodes
linked with edges.

* ``(ref)``: one node
* ``(ref)-[]->()``: a path of two nodes with a direction (A->B)
* ``(ref)-[]->()<-[]-()``: three nodes (A->B<-C)
* ``(ref)-[]->()-[]->()``: three nodes (A->B->C)
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