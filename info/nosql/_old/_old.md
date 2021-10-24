# Introduction

NoSQL stands for NotOnlySQL. It's used to describe
databases that are not
relational databases but allows SQL and a new kind
of query language.

It's appeared around 2010 (but it's something existing
since 1960) and it's used by
a lot of actors like Google, Microsoft, Facebook
or Twitter.

We got 4 kinds of NoSQL databases models

* Key-value: a key is associated to a value
* Document: data stored as documents, [mongoDB](https://www.mongodb.com/)
* Columnar: using a key-columns where column is a bunch of values
* Graph: nodes and edges, [cypher](https://neo4j.com/developer/cypher/)

Since 2019, the [GQL](https://en.wikipedia.org/wiki/Graph_Query_Language)
(Graph Query Language) may becomes a database query 
language for Graph databases (GDB)
like the SQL but it seems they are still working on it.

<hr class="sl">

## Cypher

Cypher is [Neo4J](https://neo4j.com/) Graph Query Language.
You can find the [tutorial here](cyhper/index.md)

About Cypher

* **needs register :(**
* cloud or local databases
* [open-source](https://github.com/neo4j)
* the syntax looks like SQL
* easy to learn but it's easy to make
  a mistake in your query
  (at least way more than in MongoDB for instance)

<hr class="sr">

## MongoDB

Here is the mongoDB [tutorial](mongodb/index.md).

About mongo

* cloud or local databases
* you will use JSON to defines the data manipulated
* easy to learn, almost no syntax
* the process of referencing another object is not convenient
* it seems to be protected against injections
  (because we are using Object-relational mapping or ORM)

<hr class="sl">

## RethinkDB

It's a "NoSQL database that stores schemaless JSON documents".
I haven't tried it yet but I want to keep it here 
just in case.

* [rethinkdb](https://rethinkdb.com/)
* [Github](https://github.com/rethinkdb/rethinkdb)
* [Store large files](https://github.com/internalfx/rethinkdb-regrid)
* [File transfer with socket.io (node.js)](https://hassansin.github.io/socket.io-rethinkdb-file-transfer)

<hr class="sr">

## Sources

* <https://azure.microsoft.com/en-us/overview/nosql-database/>
* <https://www.mongodb.com/nosql-explained>
* <https://www.ibm.com/cloud/learn/nosql-databases>
* <https://en.wikipedia.org/wiki/Cypher_(query_language)>
* <https://graphql.org/>
* <https://docs.microsoft.com/en-us/azure/architecture/data-guide/big-data/non-relational-data>