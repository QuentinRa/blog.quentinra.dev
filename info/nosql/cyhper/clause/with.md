# MATCH WITH

[Go back](..)

You can make a request inside another one with
``WITH``.

```sql
MATCH (p:Person)-[HAS_PURCHASED]->(o:Objet)
WITH p, SUM(o.price) AS amount WHERE p.age < 40 ORDER BY p.name DESC
RETURN DISTINCT p
```