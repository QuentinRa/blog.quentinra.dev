# Introduction

**NoSQL** stands for **NotOnlySQL** (or non-SQL). They are not "forbidding" you to use relational databases, but they are saying that **relational databases aren't the only kind of databases**. NoSQL databases became quite popular around **2010** <small>(while they exist since **1960**)</small>, and they are used by a lot of actors like Google, Microsoft, Facebook, or Twitter.

NoSQL databases are great when there is a great amount of **unstructured** (or **semi-structured**) **data**. It means that you can add/remove fields, so you can have two "users" having different fields. This is allowing you to add fields when they are needed, and increase performances.

We got **4 majors kinds of NoSQL databases models/stores**

* **Key-value**: a key-value system
* **Document**: data stored as documents
* **Columnar**: using a key-column system, with "column" a bunch of values
* **Graph**: nodes and edges

> **Note**: Since 2019, the [GQL](https://en.wikipedia.org/wiki/Graph_Query_Language) (Graph Query Language) may become the database query language for Graph databases (GDB) like the SQL for relational databases, but it seems they are still working on it.

<hr class="sl">

## Cypher

<div class="row row-cols-md-2 mx-0"><div class="align-self-center">

* **Description**: Cypher is Neo4J Graph Query Language
* **Category**: Graph
* **Official tutorial**: [Neo4J - Cypher Query Language](https://neo4j.com/developer/cypher/)

[My notes about Cypher](cypher/index.md)
</div><div>

> * **Account required** 🙄
> * **Cloud** (free version available) or **self-hosted** (local)
> * [**Open-source**](https://github.com/neo4j) (10.6k ✨)
> * The syntax **looks like SQL**
> * **easy to learn**
</div></div>

<hr class="sr">

## MongoDB

<div class="row row-cols-md-2 mx-0"><div class="align-self-center">

* **Description**: NoSQL with JSON-based (BSON) documents
* **Category**: Document
* **Official tutorial**: [MongoDB documentation](https://docs.mongodb.com/guides/)

[My notes about MongoDB](mongodb/index.md)
</div><div>

> * **No need for an account** 🚀
> * **Cloud** (free version available) or **self-hosted** (local)
> * [**Open-source**](https://github.com/mongodb) (22.8k ✨)
> * **JSON** 👍
> * **Almost no syntax** 📚
> * **Hard to reference something** 🙄 (no relationships/edges/...)
</div></div>

<hr class="sl">

## Sources

* <https://azure.microsoft.com/en-us/overview/nosql-database/>
* <https://www.mongodb.com/nosql-explained>
* <https://www.ibm.com/cloud/learn/nosql-databases>
* <https://docs.microsoft.com/en-us/azure/architecture/data-guide/big-data/non-relational-data>