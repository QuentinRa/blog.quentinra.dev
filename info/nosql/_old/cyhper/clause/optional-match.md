# OPTIONAL MATCH

[Go back](..)

The optional match is not an alternative match but an
extension of the match. You may add in the optional
match a query that may or not be fulfilled by the elements
selected.

* Must be after the MATCH and before the WHERE.
* If the selected do not match then the variables will
  be null.
* This is the same as a LEFT OUTER JOIN in SQL

<hr class="sr">

Example

```sql
MATCH (s:ShowbizPerson{ })-->(m)
OPTIONAL MATCH (m)<-[r]-()
RETURN DISTINCT r
LIMIT 2
```

You may notice that this example is stupid, since
we could have omitted the second line is declared
r in the first line but now you should have got
the idea.