# Structured Query Language (SQL)

<div class="row row-cols-md-2"><div>

The Structured Query Language (SQL) is the most popular query language. The fundamental are the same for many RDBMS.

A **Request/Query** 👮 is a statement sent to the database to perform some task/get some result. It looks like this:

```sql!
SELECT *
FROM users
WHERE username = 'admin';
```

➡️ You can put everything on one line. The semicolon (`;`) is optional for simple queries, but you should always use it.
</div><div>
</div></div>

<hr class="sep-both">

## SQL Clauses 👷

<div class="row row-cols-md-2"><div>

A clause 👷 is an instruction within the request, such as SELECT. There are 3 categories of clauses: DML, DDL, and DCL.

* Declaration `SELECT`>`FROM`>`WHERE`>`GROUP BY`>`HAVING`>`ORDER BY`>`LIMIT`
* Execution `FROM`>`WHERE`>`GROUP BY`>`HAVING`>`SELECT`>`ORDER BY`>`LIMIT`

**DML (Data Manipulation)** 💰

* [Select]()
* [Insert]()
* [Update]()
* [Delete]()
</div><div>

**DDL (Data Definition)** 💼

* [Create]()
* [Alter]()
* [Drop]()

**DCL (Data control)** 🔐

* [Grant]()
* [Revoke]()
</div></div>

<hr class="sep-both">

## 👻 To-do 👻

Stuff that I found, but never read/used yet.

<div class="row row-cols-md-2"><div>

* [_old](_old.md)
</div><div>

<details class="details-n">
<summary>V</summary>

A **schema** 🗃️ is a sort of namespace in which there are tables, and other related stuff. See the table `INFORMATION_SCHEMA` <small>(TABLES, USERS, COLUMNS/DOMAINS, CHECK_CONSTRAINTS)</small>.

➡️ You may have to use `schema_name.table_name` in your requests.

A **domain** 🌍 refer to the values that an attribute can take. This is determined by the type, and the constraints on it.
</details>
</div></div>