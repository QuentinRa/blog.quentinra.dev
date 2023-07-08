# Neo4J

<div class="row row-cols-md-2"><div>

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

<div class="row row-cols-md-2"><div>

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

<div class="row row-cols-md-2"><div>

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

## XXX

<div class="row row-cols-md-2"><div>

The order of the clauses in a request is `MATCH > WHERE > RETURN > ORDER BY > SKIP > LIMIT`.

#### MATCH `(SQL FROM/WHERE)`

Use `MATCH` to select nodes/edges. You can chain matches if needed.

```cypher
MATCH (m:Movie) [...]                 // fetch all movies
MATCH (m:Movie{released: 2008}) [...] // match + filtering
MATCH (m), (p) [...]                  // catesian product
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
```

#### ORDER BY `(SQL ORDER BY)`

Sort results.

```cypher
[...] ORDER BY m.title       // ASC
[...] ORDER BY m.title ASC   // ASC
[...] ORDER BY m.title DESC  // DESC
```
</div></div>

<hr class="sep-both">

## Examples

<div class="row row-cols-md-2"><div>

```cypher
// released after 2000
MATCH (m) WHERE m:Movie AND exists(m.released) AND m.released > 2000 RETURN m
// released after 2000 (same)
MATCH (m:Movie) WHERE exists(m.released) AND m.released > 2000 RETURN m
// match every node that PRODUCED a movie, and the movie
MATCH (p)-[:PRODUCED]->(m:Movie) RETURN p, m
// same using "where"
MATCH (p)--(m) WHERE (p)-[:PRODUCED]->(m:Movie) RETURN p, m
```
</div><div>

...
</div></div>

<hr class="sep-both">

## 👻 To-do 👻

Stuff that I found, but never read/used yet.

<div class="row row-cols-md-2"><div>

xxx
</div><div>


</div></div>