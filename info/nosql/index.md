# Introduction

**NoSQL** stands for **NotOnlySQL** (or non-SQL). It's used to describe databases that are **not relational databases**, but **allows SQL** and **a new kind of query language**. It's became quite popular around **2010** <small>(while it's existing since **1960**)</small>, and it's used by a lot of actors like Google, Microsoft, Facebook, or Twitter.

NoSQL databases are great when there is a need to a great amount of unstructured (or semi-structured) data. It means that you can add/remove fields, so you can have two "users" having different fields. This is allowing you to add fields when they are needed, and increase performances.

We got **4 kinds of NoSQL databases models/stores**

* **Key-value**: a key is associated to a value
* **Document**: data stored as documents, [MongoDB](https://www.mongodb.com/)
* **Columnar**: using a key-columns where column is a bunch of values
* **Graph**: nodes and edges, [Cypher](https://neo4j.com/developer/cypher/)

> **Note**: Since 2019, the [GQL](https://en.wikipedia.org/wiki/Graph_Query_Language) (Graph Query Language) may becomes a database query language for Graph databases (GDB) like the SQL for relational databases, but it seems they are still working on it.

<hr class="sl">

## Cypher

<div class="row row-cols-md-2 mx-0"><div class="align-self-center">

* **Description**: Cypher is Neo4J Graph Query Language
* **Category**: Graph<br>
* **My tutorial** 📚: [Learn Cypher - Memorize](cypher/index.md)
* **Official tutorial**: [Neo4J - Cypher Query Language](https://neo4j.com/developer/cypher/)
</div><div>

> * **Needs register** 🙄
> * **Cloud** (free version available) or **local** database
> * [**Open-source**](https://github.com/neo4j) ✨
> * The syntax **looks like SQL**
> * **easy to learn**
> * **easy to make a "mistake"**, I mean a working query that is in fact not doing what you want 🙄🤚
</div></div>

<hr class="sr">

## Sources

* <https://azure.microsoft.com/en-us/overview/nosql-database/>
* <https://www.mongodb.com/nosql-explained>
* <https://www.ibm.com/cloud/learn/nosql-databases>
* <https://docs.microsoft.com/en-us/azure/architecture/data-guide/big-data/non-relational-data>