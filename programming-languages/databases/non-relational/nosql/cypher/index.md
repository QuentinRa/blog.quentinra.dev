# Core concept

Nodes

* otherwise, you will use this to add/update properties of a node
* **Pro-tip**: you can use `.` to get an attribute from a node.
* ex: `ref.attribute <> 5`

<hr class="sr">

## Simple request

<div class="row row-cols-md-2 mx-0"><div>

```cypher
MATCH graph
RETURN something
```

* A **graph** is nodes and edges, use the syntax of the previous sections
* Something may be 
  * a value, a reference, or a graph
  * some JSON
</div><div class="align-self-center">

<div>

* **Clauses names are not case-sensitive** (uppercase, lowercase, mix of both)
* You can put everything on the same line
* You can make multiple requests in one call, by separating requests with a `;` <small>(=no `;` for the last one)</small>
</div>

* Comments are made with `//` or `/* ... */`
* Concatenate strings with `+`
</div></div>

<details class="details-e">
<summary>Examples</summary>

* `MATCH (n) RETURN n`: return every node
* `MATCH (m:Movie) RETURN m`: return every node labeled "Movie"
* `MATCH (m:Movie) RETURN m.title`: return the title of every node labeled "Movie"
* `MATCH (m:Movie) RETURN {title:m.title, desc: m.tagline}`: ... as JSON
* `MATCH (m:Movie) RETURN m.title, m.tagline`: ... as a Table
* `MATCH (:Movie)<-[:ACTED_IN]-(p) RETURN p`: nodes that acted in a movie
</details>

<hr class="sl">

## Cypher basic clauses

<details class="details-e">
<summary>RETURN (<code>SQL SELECT</code>)</summary>

```cypher
MATCH (m:Movie) RETURN m // node
MATCH (m:Movie) RETURN DISTINCT m // no duplicates results
MATCH (m:Movie) RETURN m.title, m.released // table with title+released
MATCH (m:Movie) RETURN {title: m.title, year: m.released} // JSON
MATCH (m:Movie) RETURN m.title AS title, m.released AS year // rename
```
</details>

<details class="details-e">
<summary>ORDER BY (<code>SQL ORDER BY</code>)</summary>

```cypher
MATCH (m:Movie) RETURN m.title ORDER BY m.title // ASC
MATCH (m:Movie) RETURN m.title ORDER BY m.title ASC
MATCH (m:Movie) RETURN m.title ORDER BY m.title DESC
```
</details>

<details class="details-e">
<summary>LIMIT AND SKIP (<code>SQL LIMIT</code>)</summary>

`SKIP` is used to skip results, while `LIMIT` is used to limit the number of results.

```cypher
// return the oldest movies
MATCH (m:Movie) RETURN m ORDER BY m.released 
SKIP 10 // skip the first 10 results
LIMIT 3 // return only 3 results
```
</details>

<hr class="sr">

## Cypher advanced clauses

<details class="details-e">
<summary>WITH (<code>No equivalent in SQL</code>)</summary>

`WITH` is allowing you to update what you matched, and prepare things for the next matches. You can use WHERE, ORDER BY, LIMIT, etc. inside a WITH!

```cypher
// what's the average released year for the movies in the database?
MATCH (m:Movie) RETURN ROUND(AVG(m.released))
// using a WITH
MATCH (m:Movie) WITH ROUND(AVG(m.released)) as avg RETURN avg
// and now, let's say we want the movies released in avg (=1998)
MATCH (m:Movie) WITH ROUND(AVG(m.released)) as avg 
MATCH (m{released: avg})
RETURN m
```
</details>

<details class="details-e">
<summary>OPTIONAL MATCH (<code>No equivalent in SQL</code>)</summary>

This clause is after the MATCH, before the WHERE. You can try to match something, but if there is no match, then the variable will be null.

```cypher
// for each film, we want to know who acted_in, if someone
// acted in (otherwise, it will be null)
MATCH (a:Movie)
OPTIONAL MATCH (a)<-[r:ACTED_IN]-()
RETURN a.title, r
```
</details>

<hr class="sl">

## Create-Update-Delete

<details class="details-e">
<summary>CREATE (<code>SQL INSERT</code>)</summary>

Simply give the graph you want to create.

```cypher
CREATE (:Movie{title: "My movie", released: 2021})
// create from something existing
MATCH (m:Movie{title: "My movie"}) CREATE (m)<-[:ACTED_IN]-(:ShowbizPerson{name: "me"})
```
</details>

<details class="details-e">
<summary>UPDATE (<code>SQL UPDATE</code>)</summary>

As we did in SQL, simply "`SELECT`" and update your selection with `SET`.

```cypher
MATCH (p:ShowbizPerson{name: "me"})
SET p.name = "My name", p.born = 2021
// same as
MATCH (p:ShowbizPerson{name: "me"})
SET p.name = "My name" SET p.born = 2021
```
</details>

<details class="details-e">
<summary>REMOVE/DELETE (<code>SQL DELETE/ALTER/DROP</code>)</summary>

```cypher
// REMOVE an attribute
MATCH (p:ShowbizPerson{name: "My name"}) REMOVE p.born RETURN p

// DELETE an edge
MATCH (:ShowbizPerson{name: "My name"})-[r]-() DELETE r

// DETACH DELETE a node
// DETACH = delete incident edges, optional if they were already deleted
// DELETE = delete the node
MATCH (p:ShowbizPerson{name: "My name"}) DETACH DELETE (p)
```
</details>

<hr class="sr">

## Functions

We already saw some functions such as `type`, or `ROUND/AVG`, you got the complete list in the [documentation](https://neo4j.com/docs/cypher-manual/current/functions/), but it's good to know these

* `keys(node)`: names of the attributes of a node
* `properties(node)`: attributes and values of a node
* `labels(node)`: returns the labels of a node
* `nodes(graph)`: returns the nodes in a graph
* `relationships(graph)`: returns all the edges of a graph
* `id(node)`: ID of a node

And some useful aggregates functions

* `COUNT(something)`: number of results
* `MIN(something)`, `MAX(something)`, `SUM(something)`, `AVG(something)`: like in SQL

<hr class="sl">

## Lists

If needed, Cypher got support for lists, allowing you to do a lot of things as you could do in Python.

<div class="row row-cols-md-2 mx-0"><div>

* `range(min,max)`: returns a list of values [min, max]
* `head(list)`: return the first element
* `tail(list)`: remove the list without the head
* `size(list)`: size of a list
* `reverse(list)`: reverse a list
</div><div>

* `[x in range(0,5)|x]`: returns [0,1,2,3,4,5]
* `[x in range(0,5) WHERE x+2<5 |x^2]`: returns [0,1,4]
  * only 0,1,2 are passing the criteria `x+2<5`
  * then we are evaluating each value as `x^2`

</div></div>

<details class="details-e">
<summary>Indexes of your list ✨</summary>

* `list[0]`: first element
* `list[-1]`: last element
* `list[1..3]`: list of `list[1]`+`list[2]`
* `list[..3]`: list of `list[0]`+`list[1]`+`list[2]`
* `list[0..]`: list of `list[0]`+`list[1]`+...
</details>

Example

```cypher
// almost copied from the documentation
// return the list of the release dates for the movies linked to "Keanu Reeves"
MATCH (a:ShowbizPerson {name: 'Keanu Reeves'})
RETURN [(a)-->(b) WHERE b:Movie | b.released] AS years
````

<hr class="sr">

## Exercises

<details class="details-s">
<summary>Which movies Meg Ryan acted in?</summary>

```cypher
MATCH (:ShowbizPerson{name: "Meg Ryan"})-[:ACTED_IN]->(m:Movie)
RETURN DISTINCT m.title
```
</details>

<details class="details-s">
<summary>Who directed the movie The Matrix?</summary>

```cypher
MATCH (:Movie{title: "The Matrix"})-[:DIRECTED]-(s:ShowbizPerson)
RETURN s.name
```
</details>

<details class="details-s">
<summary>Movies release between 1990-2000 (included)?</summary>

```cypher
MATCH (m:Movie)
WHERE m.released>=1990 AND m.released<=2000
RETURN m.title
```
</details>

<details class="details-s">
<summary>Which actor played in a movie with Tom Cruise?</summary>

```cypher
MATCH (s:ShowbizPerson)-[:ACTED_IN]->(:Movie)<-[:ACTED_IN]-(:ShowbizPerson{name: "Tom Cruise"})
RETURN DISTINCT s.name
```

We added DISTINCT because an actor may have played in a movie with Tom Cruise more than once.
</details>

<details class="details-s">
<summary>Who both wrote and produced the same movie?</summary>

```cypher
MATCH (w:ShowbizPerson)-[:WROTE]->(:Movie)<-[:PRODUCED]-(p:ShowbizPerson)
WHERE w.name = p.name
RETURN DISTINCT w.name
```

or

```cypher
MATCH (w:ShowbizPerson)-[:WROTE]->(:Movie)<-[:PRODUCED]-(w)
RETURN DISTINCT w.name
````

or

```cypher
MATCH (w:ShowbizPerson)-[:WROTE]->(:Movie)
MATCH (w)-[:PRODUCED]->(:Movie)
RETURN DISTINCT w.name
```

</details>

<details class="details-s">
<summary>How many wrote or produced a movie?</summary>

```cypher
MATCH (p:ShowbizPerson)-[r:WROTE|PRODUCED]->(:Movie)
RETURN DISTINCT COUNT(p)
```
</details>

<details class="details-s">
<summary>Give the persons directly linked with "Kevin Bacon".</summary>

```cypher
MATCH (:ShowbizPerson{name: "Kevin Bacon"})--(p:ShowbizPerson)
RETURN DISTINCT p
```

An alternative answer, by my teacher (too hard 😭)

```cypher
MATCH p=shortestPath((:ShowbizPerson{name:"Kevin Bacon"})-[*1..2]-(c))
WHERE c.name <> "Kevin Bacon"
WITH collect(c.name) AS names
RETURN names
```
</details>

<details class="details-s">
<summary>Give the persons indirectly linked with "Kevin Bacon".</summary>

```cypher
MATCH (:ShowbizPerson{name: "Kevin Bacon"})--()--(p:ShowbizPerson)
RETURN DISTINCT p.name
```

An alternative answer, by my teacher (too hard 😭)

```cypher
MATCH p=shortestPath((:b{name:"Kevin Bacon"})-[*1..2]-(c))
WHERE c.name <> "Kevin Bacon"
WITH collect(c.name) AS names
MATCH (a) WHERE NOT a.name in names
WITH collect(a.name) AS cnames
RETURN cnames
```
</details>

<hr class="sl">

## Source

* Teaching at the ENSIIE
* <https://en.wikipedia.org/wiki/Cypher_(query_language)>