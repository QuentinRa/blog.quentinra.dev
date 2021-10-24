# ORDER BY

[Go back](..)

This clause is the same as in SQL. Simply give
the attributes and ASC (default) / DESC.

````sql
MATCH (s:ShowbizPerson{ })-->(m)
WHERE (s)-[:ACTED_IN]->(m) AND m:Movie
RETURN DISTINCT m.title, m.tagline
ORDER BY m.title ASC
SKIP 1
LIMIT 10
````