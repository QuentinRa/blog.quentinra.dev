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
</div><div>

#### Edges

...
</div></div>

<hr class="sep-both">

## 👻 To-do 👻

Stuff that I found, but never read/used yet.

<div class="row row-cols-md-2"><div>

xxx
</div><div>


</div></div>