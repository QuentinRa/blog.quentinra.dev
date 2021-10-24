# LIMIT and SKIP

[Go back](..)

Limit is a limit of the number of results. Skip
is an offset on the list of results.

````sql
MATCH (s:ShowbizPerson{ })-->(m)
WHERE (s)-[:ACTED_IN]->(m) AND m:Movie
RETURN m.tagline, m.title
// skip the first result
SKIP 1
// only show the 2nd and the 3rd results
LIMIT 2
````