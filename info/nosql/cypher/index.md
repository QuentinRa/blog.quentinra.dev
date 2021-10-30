# Cypher

Cypher is a language closes to the SQL, as you got clauses and a syntax quite similar. It's used by Neo4J in their graph database, **and you will need an account to try it out**. You can either use their sandbox, and your database will be hosted in the cloud, or you can host locally your database.

* Create an account
  * [use their online database](https://neo4j.com/sandbox/) database
  * OR [install Neo4J Desktop](https://neo4j.com/download/)
* create a new project (a group of databases)
* create a new database
* then start your database

In this course, I will use [this database](https://github.com/memorize-code/memorize-references/raw/main/info/nosql/movies.cypher), created by my teacher, [Stefania Dumbrava](http://web4.ensiie.fr/~stefania.dumbrava/) .

> **Use in another language 🚀**: check the [driver page](https://neo4j.com/developer/language-guides/).<br>
> **Official documentation 📚**: [Neo4J documentation](https://neo4j.com/developer/get-started/).<br>

<hr class="sl">

## Core concept

<div class="row mt-3 mx-0"><div class="col-md-4">

![Cypher Graph Example](images/example.png)
</div><div class="align-self-center col-md-8">

This is what a query result will looks like. You got

* **4 nodes**, each node is like a tuple in a SQL database, they have properties called **attributes**
* **3 edges**, they are the relation between the nodes, you may have a lot of them between two nodes and in a lot of directions

The whole result is what we call a **graph**.
</div></div>

<hr class="sr">

## Nodes

<div class="row row-cols-md-2 mx-0"><div class="align-self-center">

**Nodes** are represented with something inside two parenthesis. It's made of 3 elements, and all three are optional. The syntax is

```none
(ref:label{})
```

</div><div>

* **ref**: used to reference this node later in the query
* **label**: tags that you may give to a node. Useful when looking at nodes having a tag. Nodes can have multiples tags.
* **{}**: you may give **attributes** and their value here in JSON (`{ attribute:value, ... }`)
  * if you are selecting a node, this is like a WHERE in SQL
  * otherwise, you will use this to add/update properties of a node
</div></div>

<details class="details-e">
<summary>Examples</summary>

* `()`: every node
* `(m)`: store every node in m
* `(:Movie)`: every node having the label "Movie"
* `(m:Movie)`: store nodes having the label "Movie" inside m
* `(m:Movie{released:2008})`: store movies released in 2008 in m
* `(:Movie{released:2008})`: only movies released in 2008
* `(:{released:2008})`: nodes having released = 2008
* `(r:{released:2008})`: store nodes having released = 2008 in r
</details>

> **Pro tip**: you can use `.` to get an attribute from a node.

<hr class="sl">

## Edges

<div class="row row-cols-md-2 mx-0"><div class="align-self-center">

**Edges** are represented with something inside two brackets. It's made of 3 elements, and all three are optional. The syntax is

```none
[ref:label{}]
```

* **ref**: same as for node
* **label**: same as for node, you may add multiples labels by separating them with `|`
* **{}**: same as for node
</div><div>

But, aside from representing the edge, we also need to be able to represent the link between nodes using this edge.

* `node--node` : anonymous edge without direction
* `node-->node` : anonymous edge with direction
* `node<--node` : anonymous edge with direction
* `node-edge-node` : edge without direction
* `node-edge->node` : edge with direction
* `node<-edge-node` : edge with direction

You will replace node following the format in the previous section, and `edge` with the format in this section. A edge is "anonymous", because we are not adding "edge" (`[ref:label{}]`) in the pattern.
</div></div>

<details class="details-e">
<summary>Examples</summary>

* `()--()`: every two nodes linked together
* `()-->()`: every two nodes, with one having an arrow going to the other
* `(:Movie)--(p)`: store in p, nodes linked with nodes "Movie"
* `(:Movie)<-[:ACTED_IN]-(p)`: store in p, nodes that "ACTED_IN" a Movie
* `(p)-[:ACTED_IN]->(:Movie)`: same
* `()-[a:ACTED_IN]-()`: store in a, every edge labeled "ACTED_IN"
</details>

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

* **Clauses name are not case sensitive** (uppercase, lowercase, mix of both)
* You can put everything on the same line
</div>

* Comments are made with `//` or `/* ... */`
* Concatenate strings with `+`
</div></div>

<details class="details-e">
<summary>Examples</summary>

* `MATCH (n) RETURN n`: return every node
* `MATCH (m:Movie) RETURN m`: return every node labeled "Movie"
* `MATCH (m:Movie) RETURN m.title`: return the title every node labeled "Movie"
* `MATCH (m:Movie) RETURN {title:m.title, desc: m.tagline}`: ... as JSON
* `MATCH (m:Movie) RETURN m.title, m.tagline`: ... as a Table
* `MATCH (:Movie)<-[:ACTED_IN]-(p) RETURN p`: nodes that acted in a movie
</details>

<hr class="sl">

## Cypher  clauses

The order of the clauses in a request is `MATCH > WHERE > RETURN > ORDER > SKIP > LIMIT`.

<details class="details-e">
<summary>MATCH (<code>SQL FROM/WHERE</code>)</summary>

As we saw, you call `MATCH` with a graph.

```cypher
MATCH (m:Movie) RETURN m
MATCH m = (:Movie) RETURN m
MATCH g = (:Movie)-[]-() RETURN g
// as a where, but you can only use EQUALS (only released in 2008)
MATCH (m:Movie{released: 2008}) RETURN m
```
</details>

<details class="details-e">
<summary>WHERE (<code>SQL WHERE</code>)</summary>

It's working like in SQL. The where will filter the nodes that do not matched the condition in the where. Where is taking a boolean, and you can chain conditions with `AND/OR/NOT/IS/XOR`.

* `=, !=, <>, >, <, >=, <=, ...`
* ex: `ref.attribute <> 5`
* `attribute IN [value, value]`
* `attribut =~ "regex"`
* `attribute STARTS WITH, ENDS WITH, CONTAINS`
* `ref:label`: true if ref got this label, false else
* `exists(ref.attribute)`: check if "attribute" exists
* `type(edge) == 'name'`: test if an edge got this name
* you can write an edge in the WHERE like you did in the match

The match can help you simply complex where, so don't hesitate to use it, as follows

```cypher
// released after 2000
MATCH (m) WHERE m:Movie AND exists(m.released) AND m.released > 2000 RETURN m
// could be simplied to
MATCH (m:Movie) WHERE exists(m.released) AND m.released > 2000 RETURN m

// match every node that PRODUCED a movie, and the movie
MATCH (p)-[:PRODUCED]->(m:Movie) RETURN p, m
// version using where
MATCH (p), (m) WHERE (p)-[:PRODUCED]->(m:Movie) RETURN p, m
```
</details>

<hr class="sr">

## Source

* <https://en.wikipedia.org/wiki/Cypher_(query_language)>