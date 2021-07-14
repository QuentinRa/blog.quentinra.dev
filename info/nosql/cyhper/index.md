## Installing Cypher

First, let's install Cypher.
You can use 

* the [online](https://neo4j.com/sandbox/) database
* or [install](https://neo4j.com/download/) Neo4J Desktop

Once you did (after creating an account in both cases),
you should

* create a new project (a group of databases)
* create a new database
* then start your database

If you are planning to use this in a project (like
in Java, JS, PHP or Go) then you should look 
at the [driver page](https://neo4j.com/developer/language-guides/).

You may also try reading the official
documentation [here](https://neo4j.com/developer/get-started/).

If you are a **Jetbrains** user, then
you may enjoy "Graph Database Console" plugin.

[Here](movies.cypher) is a database create by my teacher,
[Stefania Dumbrava](http://web4.ensiie.fr/~stefania.dumbrava/)
that I will use in this course.

<hr class="sr">

## Core concept

Here this is what a query result will looks like

![example](example.png)

You got 

* **4 nodes**, each node is like a tuple in a SQL database,
  they have properties called **attributes**
* **3 edges**, they are the relation between the nodes,
  you may have a lot of them between two nodes and in
  a lot of directions

That's what we call a graph.

<hr class="sl">

## Nodes

A **node** is defined between ``()`` giving you something
like this ``(ref:name{})`` where

* **ref**, is an optional variable name,
  that may be used for storing the node
  for the query
* **:name** is an optional name of the variable, it's like
  a table name in SQL or a class in UML
* **{}** are the attributes of the object, optional
  too. The format for this is JSON 
  (`{ attribute:value, ... }`)

Ex

* ``(:name)`` nodes without properties having the name "name"
* ``(ref:name {attribute:value})`` store in ref a node having the name
  "name" and "value" for "attribute".
* ``(ref {attribute: value})`` store in ref ...