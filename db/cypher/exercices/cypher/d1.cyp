// 1
MATCH (a:ShowbizPerson{name:"Meg Ryan"})-[:ACTED_IN]->(b)
RETURN a,b

// 2
MATCH (a:Movie {title: "The Matrix"})<-[:DIRECTED]-(b)
RETURN b

// 3
MATCH (a:Movie)
  WHERE a.released > 1990 AND a.released < 2000
RETURN a.title

// 4
MATCH (tom:ShowbizPerson {name:"Tom Cruise"})-[:ACTED_IN]->(m)<-[:ACTED_IN]-(c)
RETURN c.name

// 5
MATCH (p)-[:WROTE]->(m:Movie)
  WHERE (p)-[:PRODUCED]->(m)
RETURN p.name, m.title

// 6
MATCH (p)-[r:WROTE|:DIRECTED]->(m:Movie)
RETURN count(p)

// 7
MATCH (:b{name:"Kevin Bacon"})-[*1..3]-(c)
RETURN DISTINCT count(c)

// 8
MATCH p=shortestPath((:b{name:"Kevin Bacon"})-[*1..2]-(c))
  WHERE c.name <> "Kevin Bacon"
WITH collect(c.name) AS names
RETURN names

// 9
MATCH p=shortestPath((:b{name:"Kevin Bacon"})-[*1..2]-(c))
  WHERE c.name <> "Kevin Bacon"
WITH collect(c.name) AS names
MATCH (a) WHERE NOT a.name in names
WITH collect(a.name) AS cnames
RETURN cnames

// 10 (132 personnes)
// v1
MATCH (a)
  WHERE a.name <> "Kevin Bacon"
RETURN count(a)

// v2
MATCH p=shortestPath((:b{name:"Kevin Bacon"})-[*1..6]-(c))
  WHERE c.name <> "Kevin Bacon"
RETURN count(c)