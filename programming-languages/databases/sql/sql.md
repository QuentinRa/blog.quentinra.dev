# Structured Query Language (SQL)

<div class="row row-cols-md-2"><div>

The Structured Query Language (SQL) is the most popular query language. The fundamental are the same for many RDBMS.

```sql!
-- a request looks like this
SELECT *
FROM users
WHERE username = 'admin';
```
</div><div>
</div></div>

<hr class="sep-both">

## Terminology

<div class="row row-cols-md-2"><div>

#### Request

A **Request/Query** 👮 is a statement sent to the database to perform some task/get some result.

Requests must end with a `;` <small>(most*)</small>. Newlines are optionals <small>(=one line)</small>.

<br>

#### Schema

A **schema** 🗃️ is a sort of namespace in which there are tables, and other related stuff. See the table `INFORMATION_SCHEMA` <small>(TABLES, USERS, COLUMNS/DOMAINS, CHECK_CONSTRAINTS)</small>.

➡️ You may have to use `schema_name.table_name` in your requests.

<br>

#### Domain

A **domain** 🌍 refer to the values that an attribute can take. This is determined by the type, and the constraints on it.

</div><div>

#### Clause

A **clause** 👷 is an instruction within the request, such as `SELECT`.

* They are declared in this order: `SELECT` > `FROM` > `WHERE` > `GROUP BY` > `HAVING` > `ORDER BY` > `LIMIT`
* They are executed in this order: `FROM` > `WHERE` > `GROUP BY` > `HAVING` > `SELECT` > `ORDER BY` > `LIMIT`

There are 3 categories of clauses:

* **DML (Data Manipulation)**: Select, Insert, Update, Delete
* **DDL (Data Definition)**: Create, Alter, Drop
* **DCL (Data control)**: Grant, Revoke
</div></div>

<hr class="sep-both">

## 👻 To-do 👻

Stuff that I found, but never read/used yet.

<div class="row row-cols-md-2"><div>

* [_old](_old.md)
</div><div>


</div></div>