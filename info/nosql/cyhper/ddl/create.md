# Create

[Go back](..)

Create is taking a graph and creating
edges / nodes missing.

```sql
CREATE (john:Person {name: "John"})
CREATE (maria:Person {name: "Maria"})
```

* the label (`Person` here) is optional
* we are using a reference because you may want
  to RETURN the create node.

```sql
MATCH (john:Person{name: "John"})
CREATE (maria)-[:FRIEND]->(john)-[:FRIEND]->(maria)
```