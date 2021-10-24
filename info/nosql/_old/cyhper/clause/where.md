# WHERE

[Go back](..)

Working like in SQL. You can use

* ``=, !=, <>, >, <, >=, <=, ...``,
* ex: ``ref.attribute <> 5``,
* ``... AND/OR/NOT/IS/XOR ...``,
* ``attribute IN [value, value]``,
* ``attribut =~ "regex"``,
* ``attribute STARTS WITH, ENDS WITH, CONTAINS``,
* ``ref:label``,
* ``exists(ref.attribute)`` (check if attribute exists),
* ``type(attribute)``
* you can write an edge in the WHERE like you did
  in the match

<hr class="sr">

Examples

```sql
MATCH (:ShowbizPerson{ })-[:ACTED_IN]->(m)
// ensure m is a movie
WHERE m:Movie
RETURN m.tagline, m.title

// using AND and a edge inside where
MATCH (s:ShowbizPerson{ })-->(m)
WHERE (s)-[:ACTED_IN]->(m) AND m:Movie
RETURN m.tagline, m.title

// we could have done this here
// in most cases you will use that but sometimes
// you won't be able to so you will have to use where
MATCH (:ShowbizPerson{ })-[:ACTED_IN]->(m:Movie)
RETURN m.tagline, m.title
```
