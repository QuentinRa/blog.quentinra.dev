# Cypher advanced clauses

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