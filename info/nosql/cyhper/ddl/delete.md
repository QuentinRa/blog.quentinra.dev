# Delete

[Go back](..)

You can use ``REMOVE`` to delete an attribute.

```sql
MATCH (p: Person)
REMOVE p.age
RETURN p
```

You can use ``DELETE`` to delete an edge.

```sql
MATCH (p: Person)
DELETE p;
```

And you can use ``DETACH DELETE`` to both
the edges and the node.

```sql
MATCH (p: Person)
DETACH DELETE p;
```