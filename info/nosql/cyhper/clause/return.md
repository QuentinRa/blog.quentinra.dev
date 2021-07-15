# RETURN

[Go back](..)

This is the same as a SQL Select, simply pick
what you are returning. You will have to use references
(variables) to store what you want to be returned. You
may select only one attribute.

```sql
MATCH (:ShowbizPerson{ name: "Keanu Reeves" })-[]->(o)
// simply returns the content of the variable o
RETURN o

// only returns the title of a Movie
MATCH (:ShowbizPerson{ name: "Keanu Reeves" })-[]->(m:Movie)
RETURN m.title

MATCH (:ShowbizPerson{ name: "Keanu Reeves" })-[]->(m:Movie)
RETURN m.title, m.released

// returns some json
MATCH (:ShowbizPerson{ name: "Keanu Reeves" })-[]->(m:Movie)
RETURN { title:  m.title, released_in: m.released }
// alternative
MATCH (:ShowbizPerson{ })-[:ACTED_IN]->(m:Movie)
RETURN m.title AS res, m.released AS r

// distinct means no duplicates
MATCH (:ShowbizPerson{ })-[:ACTED_IN]->(m:Movie)
RETURN DISTINCT { title:  m.title, released_in: m.released }
```

Summary

* **RETURN DISTINCT**: no duplicates
* **RETURN a, b**: returns a and b
* **RETURN a AS name, b**: returns name (=a) and b
* **RETURN m.title**: returns the title attribute value of m
* **RETURN {}**: you may do all above using the JSON syntax