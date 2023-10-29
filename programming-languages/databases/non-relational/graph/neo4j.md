# Neo4J

<div class="row row-cols-lg-2"><div>

Neo4J is a popular **Graph** [NoSQL](../index.md) Database. It provides the cypher query language to interact with the graph data.

* [Neo4J documentation](https://neo4j.com/docs/)
* [Cypher documentation](https://neo4j.com/docs/getting-started/cypher-intro/) and [Cypher manual](https://neo4j.com/docs/cypher-manual/current/introduction/)
* [Neo4J Drivers](https://neo4j.com/docs/getting-started/languages-guides/#neo4j-drivers) <small>(Java, JavaScript, Python, Go...)</small>

Either use [their cloud sandbox](https://neo4j.com/sandbox/) or [a self-hosted instance](https://neo4j.com/download/).
</div><div>

* ❌ Account required, can't delete your account 🙄
* 🪵 A bit hard to use <small>(easy to make mistakes/errors)</small>
* 🤝 open-source ([GitHub](https://github.com/neo4j), 11.6k ✨)
* 🚀 Cypher's syntax looks like SQL
* 🌫️ Cloud <small>(free version available)</small> or self-hosted <small>(local)</small>

[Example database](https://raw.githubusercontent.com/QuentinRa/references.blog.quentinra.dev/main/info/nosql/movies.cypher).
</div></div>

<hr class="sep-both">

## Core logic

<div class="row row-cols-lg-2"><div>

With Neo4J, each cypher query returns a **graph**.

**Nodes**

* 💰 These are our records
* 🗃️ They may have labels <small>(ex: Person, Actor, ShowBizPerson...)</small>
* 🔥 For instance, the node `Werner Herzog` <small>(ShowbizPerson)</small>

**Edges**

* 🧵 They are the links between records
* ↔️ They have a direction, and link two nodes
* 🕸️ There is no limit to the number of edges between two nodes
* 🔥 For instance, `-ACTED_IN->` between `W. H.` and `What Dreams`...
</div><div>

![Cypher Graph Example](_images/example.png)
</div></div>

<hr class="sep-both">

## Nodes and edges

<div class="row row-cols-lg-2"><div>

#### Nodes

In a query, we use `()` to represent a node. 

✍️ If we need to use the captured node, we store it in a variable: `(variable_name)` such as `(m)`.

👉 We can select nodes having a specific label using: `(:Label)` such as `(:Movie)` or `(m:Movie)`. 

✂️ We can go further and filter nodes based on their properties `(:{released:2008})`, `(:Movie{released:2008})`, or `(r:{released:2008})` represent nodes with `released == 2008`.

🔥 You can use `variable_name.attribute` to access an attribute later.
</div><div>

#### Edges

In a query, we use `--` to represent an edge.

Similarly to nodes:

* You can capture an edge similarly to a node: `-(v)-`.
* You can select edges based on a Label: `-(:Label)-`, `-(v:Label)-`.
* ...

But, you can also add a direction:

* From `a` to `b`: `a-->b`, `a-(v)->b`, etc.
* From `b` to `a`: `a<--b`, `a<-(v)-b`, etc.
</div></div>

<hr class="sep-both">

## Basic clauses

<div class="row row-cols-lg-2"><div>

Clauses are case-insensitive instructions.

* Comments are made with `//` or `/* ... */`
* Concatenate strings with `+`
* Use `;` to chain requests.

The order is: `MATCH > WHERE > RETURN > ORDER BY > SKIP > LIMIT`.

#### MATCH `(SQL FROM/WHERE)`

Use `MATCH` to select nodes/edges. You can chain matches if needed.

```cypher
MATCH (m:Movie) [...]                 // fetch all movies
MATCH (m:Movie{released: 2008}) [...] // match + filtering
MATCH (m), (p) [...]                  // cartesian product
MATCH g = (:Movie)-[]-() [...]        // store graph
```

#### WHERE `(SQL WHERE)`

Filter nodes/edges based on a predicate.

* `=, !=, <>, >, <, >=, <=, ...`: basic operators
* `attribute IN [value, value]`: in array
* `attribut =~ "regex"`: in regex
* `attribute STARTS WITH, ENDS WITH, CONTAINS`: ...
* `xxx:label`: true if `xxx` got this label, false else
* `exists(xxx.attribute)`: check if "attribute" exists
* `type(edge) == 'name'`: test if an edge got this name
* an edge <small>(filter nodes not having an edge)</small>
* ...

👉 Chain predicates using `AND/OR/XOR`. See also: `NOT/IS`.
</div><div>

#### RETURN `(SQL SELECT)`

Return specifies which nodes are in the final graph.

```cypher
[...] RETURN m                    // one node
[...] RETURN DISTINCT m           // no duplicates results
[...] RETURN m.title, m.released  // attributes
[...] RETURN m, n                 // cartesian product 
[...] RETURN {title:m.title}      // as JSON
```

#### ORDER BY `(SQL ORDER BY)`

Sort results.

```cypher
[...] ORDER BY m.title       // ASC
[...] ORDER BY m.title ASC   // ASC
[...] ORDER BY m.title DESC  // DESC
```

#### LIMIT + SKIP `(SQL LIMIT)`

Skip results or limit the number of results.

```cypher
[...] SKIP 10    // skip the first 10 results
[...] LIMIT 3    // return up to 3 results
```
</div></div>

<hr class="sep-both">

## Advanced clauses

<div class="row row-cols-lg-2"><div>

#### Functions

Functions are listed [here](https://neo4j.com/docs/cypher-manual/current/functions/).

* `keys(node)`: list a node's attributes
* `properties(node)`: list a node's attributes and their values
* `labels(node)`: returns a node's labels
* `nodes(graph)`: returns all nodes in a graph
* `relationships(graph)`: returns all edges of a graph
* `id(node)`: returns a node's ID

And some useful aggregates functions:

* `COUNT(something)`: number of results
* `MIN(something)`, `MAX(something)`, `SUM(something)`, `AVG(something)`, `ROUND(something)`... which are working like in SQL.

For instance: `MATCH (m:Movie) RETURN ROUND(AVG(m.released))` returns the rounded average release date of all movies.
</div><div>

#### WITH `(SQL <none>)`

With can be used to execute an operation, such as a calculation.

```cypher
MATCH (m:Movie) WITH ROUND(AVG(m.released)) AS avg RETURN avg
// which is useful when chaining matches
MATCH (m:Movie) WITH ROUND(AVG(m.released)) as avg 
MATCH (m{released: avg})
RETURN m
```

#### OPTIONAL MATCH `(SQL <none>)`

An optional match can be used to select nodes/edges that may be `null`.

```cypher
MATCH (a:Movie) OPTIONAL MATCH (a)<-[r:ACTED_IN]-()
RETURN a.title, r // may be null for some movies
```
</div></div>

<hr class="sep-both">

## Create, update, and delete data

<div class="row row-cols-lg-2"><div>

#### Create

Create takes a graph and creates it.

```cypher
CREATE (:Movie{title: "My movie", released: 2021})
// create from something existing
MATCH (m:Movie{title: "My movie"}) CREATE (m)<-[:ACTED_IN]-(:ShowbizPerson{name: "me"})
```

#### Update

As in SQL, select nodes first, then update them.

```cypher
MATCH (p:ShowbizPerson{name: "me"})
SET p.name = "My name", p.born = 2021
// same as
MATCH (p:ShowbizPerson{name: "me"})
SET p.name = "My name" SET p.born = 2021
```
</div><div>

#### Delete

There are 3 clauses, for attributes, edges, and nodes.

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
</div></div>

<hr class="sep-both">

## Examples

<div class="row row-cols-lg-2"><div>

Here are some example queries.

```cypher
// released after 2000
MATCH (m) WHERE m:Movie AND exists(m.released) AND m.released > 2000 RETURN m
// released after 2000 (same)
MATCH (m:Movie) WHERE exists(m.released) AND m.released > 2000 RETURN m
// match every node that PRODUCED a movie, and the movie
MATCH (p)-[:PRODUCED]->(m:Movie) RETURN p, m
// same using "where"
MATCH (p)--(m) WHERE (p)-[:PRODUCED]->(m:Movie) RETURN p, m
// number of persons that wrote or produced a movie
MATCH (p:ShowbizPerson)-[r:WROTE|PRODUCED]->(:Movie) RETURN DISTINCT COUNT(p)
```
</div><div>

```cypher
// Actors that played in a movie with Tom Cruise
MATCH (s:ShowbizPerson)-[:ACTED_IN]->(:Movie)<-[:ACTED_IN]-(:ShowbizPerson{name: "Tom Cruise"}) RETURN DISTINCT s.name
// Movies released between 1990-2000 (included)
MATCH (m:Movie) WHERE m.released>=1990 AND m.released<=2000 RETURN m.title
// Persons who directed the movie "The Matrix"
MATCH (:Movie{title: "The Matrix"})-[:DIRECTED]-(s:ShowbizPerson) RETURN s.name
// Movies Meg Ryan acted in
MATCH (:ShowbizPerson{name: "Meg Ryan"})-[:ACTED_IN]->(m:Movie) RETURN DISTINCT m.title
// Those that both wrote and produced the same movie
MATCH (w:ShowbizPerson)-[:WROTE]->(:Movie)<-[:PRODUCED]-(p:ShowbizPerson) WHERE w.name = p.name RETURN DISTINCT w.name
MATCH (w:ShowbizPerson)-[:WROTE]->(:Movie)<-[:PRODUCED]-(w) RETURN DISTINCT w.name
MATCH (w:ShowbizPerson)-[:WROTE]->(:Movie) MATCH (w)-[:PRODUCED]->(:Movie) RETURN DISTINCT w.name
```
</div></div>

<hr class="sep-both">

## Lists

<div class="row row-cols-lg-2"><div>

If needed, you can use lists in your queries. See [Python](/programming-languages/high-level/scripting/python/index.md#lists) lists.

```cypher
// return the list of the release dates for the movies linked to "Keanu Reeves"
MATCH (a:ShowbizPerson {name: 'Keanu Reeves'})
RETURN [(a)-->(b) WHERE b:Movie | b.released] AS years
```

Here are two simple queries explained:

* `[x in range(0,5) | x]`: returns [0,1,2,3,4,5]
* `[x in range(0,5) WHERE x+2<5 | x^2]`: returns [0,1,4]
    * only 0,1,2 are passing the criteria `x+2<5`
    * then we evaluate each value as `x^2`
</div><div>

Common functions 📑

* `range(min,max)`: returns a list of values [min, max]
* `head(list)`: return the first element
* `tail(list)`: remove the list without the head
* `size(list)`: size of a list
* `reverse(list)`: reverse a list

Indexes ✨

* `list[0]`: first element
* `list[-1]`: last element
* `list[1..3]`: list of `list[1]`+`list[2]`
* `list[..3]`: list of `list[0]`+`list[1]`+`list[2]`
* `list[0..]`: list of `list[0]`+`list[1]`+...
</div></div>

<hr class="sep-both">

## 👻 To-do 👻

Stuff that I found, but never read/used yet.

<div class="row row-cols-lg-2"><div>

* [apcjones](http://www.apcjones.com/arrows/#)
* [graphacademy](https://graphacademy.neo4j.com/categories/)
* [coursIBDPG](http://web4.ensiie.fr/~stefania.dumbrava/coursIBDPG.pdf)
</div><div>
</div></div>