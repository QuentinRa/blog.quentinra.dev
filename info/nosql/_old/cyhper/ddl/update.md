# Update

[Go back](..)

You will use the clause SET like in SQL
to update something.

```sql
MATCH (p:Person)
SET p.age=p.age*10
RETURN p
```