# Non-relational databases

<div class="row row-cols-lg-2"><div>

**Non-relational databases**, a.k.a. **NoSQL** (**NotOnlySQL**), are databases using a different approach to data storage and manipulation compared to [relational databases](/programming-languages/databases/relational/_knowledge/index.md) ✨.

Here are some majors NoSQL databases models/stores:

* **Key-value** 🔑: a key-value system
* **Document** 📂: data stored as documents
* **Columnar** 🗄️: using a key-column <small>(values)</small> system
* **Graph** (GDB) 🕸️: nodes and edges

👉 NoSQL means that SQL databases are not the only databases.
</div><div>

Each NoSQL database model has its pro and cons, but overall, NoSQL databases' pros and cons are:

* 🌱 They were designed to handle large amounts of data <small>(scalable)</small>
* ✍️ They are flexible <small>(no schema, semi- or completely unstructured)</small>
* 🔥 Data may be duplicated or inconsistent <small>(quantity over quality)</small>
* 🚀 They have high performances <small>(required by low-latency apps)</small>
* 📒 They have limited query features <small>(relatively to SQL/...)</small>

NoSQL databases became quite popular around 2010, and they are used by a lot of actors like Google, Microsoft, Facebook, and Twitter.
</div></div>

<hr class="sep-both">

## Examples of NoSQL databases

<div class="row row-cols-lg-2"><div>

Key-value

* [Redis](key-value/redis.md)

Document

* [MongoDB](document/mongodb.md)
* [RavenDB](https://ravendb.net/)
* [RethinkDB](https://rethinkdb.com/)
* [Apache CouchDB](https://docs.couchdb.org/en/stable/)
</div><div>

Columnar

* [Apache Cassandra](https://cassandra.apache.org/_/index.html)
* [Apache HBase](https://hbase.apache.org/)

Graph

* [Neo4j](graph/neo4j.md)
</div></div>

<hr class="sep-both">

## 👻 To-do 👻

Stuff that I found, but never read/used yet.

<div class="row row-cols-lg-2"><div>

* BASE (SQL ACID)
* Wide-column store (subset of columnar)
</div><div>

Graph Query Language ([GQL](https://en.wikipedia.org/wiki/Graph_Query_Language))

* SPARQL
</div></div>