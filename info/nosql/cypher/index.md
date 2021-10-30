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
* `(m)`: every node, store each node in m
* `(:Movie)`: every node having the label "Movie"
* `(m:Movie)`: store each node having the label "Movie" inside m
* `(m:Movie{released:2008})`: store each movies released in 2008 in m
* `(:Movie{released:2008})`: only movies released in 2008
* `(:{released:2008})`: nodes having released = 2008
* `(m:{released:2008})`: store nodes having released = 2008
</details>

<hr class="sl">

## Source

* <https://en.wikipedia.org/wiki/Cypher_(query_language)>