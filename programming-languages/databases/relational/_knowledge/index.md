# Relational databases

<div class="row row-cols-md-2"><div>

Relational databases are storing data in **tables** and **columns**. Tables are linked together using (foreign) **keys**. You can view a relational database as an Excel table.

<div class="col-12 col-md-8 mx-auto">

![Database Table X Column](_images/table_view.png)
</div>

The [Structured Query Language (SQL)](../sql/index.md) is the most used language to query and manage relational databases.

</div><div>

Relational databases are managed by a **Database Management System** (DBMS) or RDBMS for Relational DBMS.

* 💵 Oracle
* 🍰 [PostgreSQL](../sql/index.md#dbms-specific)
* 🐈 [MariaDB](../sql/index.md#dbms-specific)
* 🍃 [MySQL](../sql/index.md#dbms-specific)
* 🦐 [SQLite](../sql/index.md#dbms-specific)
* 🐭 Microsoft SQL  Server (MSSQL)
* ...

➡️ You may try a few of them online at [sqliteonline](https://sqliteonline.com/). When installing a [WAMP Server](/operating-systems/webservers/apache/wamp.md), you will install a database (MariaDB or MySQL).
</div></div>

<hr class="sep-both">

## Terminology

<div class="row row-cols-md-2"><div>

A **record/tuple/row** 💵 is an entry in a table, such as `(1, Luna, 18, 'Woman')` or `(2, Henry, 24, 'Not specified')`.

An **attribute/variable** 🛻 is a column in a table, such as `id`, `name`, `age`... Attributes have a type, and may have constraints <small>(such as Not Null...)</small>.

<div class="col-12 col-md-3 mx-auto">

![Database Table UML Model](_images/table_modeling.png)
</div>

</div><div>

A **key** 🔑 is a set of one or more attributes used to identify a row. Keys must be unique, and every row must have a key.

* Primary key <small>(set of attributes, must be unique and not null)</small>
* Foreign key <small>(a key taking values from another key in another table)</small>
* Artificial key <small>(incrementing (+=1) each time we are adding a row)</small>

The attribute `id` is an artificial key. In another table, we can use this number to reference the associated customer.

➡️  It's common to pre- or post-fix columns such as `id` (ex: `c_id`) if there are many columns with the same name, or for other reasons.
</div></div>

<hr class="sep-both">

## Modeling

<div class="row row-cols-md-2"><div>

Creating a database from a specification is called **Modeling** 🧑‍🎨. It's a process usually involving 3 steps:

1. 📝 From the specification (a text), create a database diagram
2. ✍️ From the diagram, write down the relational representation
3. ✅ From the relational representation, create the database

#### Step 1 — Get Started

Before creating your [database diagrams](/tools-and-frameworks/projects/modeling/uml/db/index.md), you need to identify some information within the specification.

* **highlight** every concrete piece of information
  * Names, Locations
  * Values (prices, distances...)
  * ...
* **categorize** each information
  * "John Doe" <small>(piece of information)</small> is a "name" <small>(category)</small>
  * "Toronto" <small>(piece of information)</small> is a "city" <small>(category)</small>
  * "Berlin" <small>(piece of information)</small> is a "city" <small>(category)</small>
  * ...
* **group** categories by entities
  * "name" belongs to "person"
  * "address" belongs to "person"
  * "city" belongs to "address"
  * ...

Each group correspond to a UML `class` and each of their categories are their UML `attributes`. Complete the diagram with `identifiers`, `associations`, `multiplicity`, and `generalizations`.

✍️ If there is no identifier, you may create one.
</div><div>

#### Step 2 — Relational Representation

We represent the database diagram using the relational language. It provides a textual representation of your database structure.

A **relation** is a set of attributes that are mapped to their type.

```scss!
// Overview of the syntax
R1(attribute=>type, #key=>type, ...)
R2(#foreign_key=>R1.key, ...)
R3(#(r1_key=>R1.key, r2_key=>R2.key), ...)

// Example
Person(#id=>Integer, name => String, address => Address.id)
Address(#id=>Integer, city => String)
```

💡 The representation is usually including notes <small>(ex: xxx is unique...)</small>.

👉 See the list of rules [to map a database diagram here](8rules.md).

<br>

#### Step 3 — Implementation

For [SQL](/programming-languages/databases/relational/sql/index.md), this is how you do it:

* Each `relation` is mapped to a SQL `table`
* Each `relation` attributes are its SQL `table` attributes
* Add all constraints <small>(either on attributes or on the table)</small>
  * Ex: keys (primary, foreign)
  * Ex: number of records
  * Ex: interval, range, null and not null
  * ...
</div></div>

<hr class="sep-both">

## 👻 To-do 👻

Stuff that I found, but never read/used yet.

<div class="row row-cols-md-2"><div>

* CRUD/ACID
* Data lake
* Data warehouse
* ETL tools
* [duckdb](https://github.com/duckdb/duckdb)
</div><div>
</div></div>