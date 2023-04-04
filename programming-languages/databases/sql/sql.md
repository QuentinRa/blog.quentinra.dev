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

## SQL Basics 🃏

<div class="row row-cols-md-2"><div>

#### Types

Common types are:

* `varchar(1)`: one character (a char)
* `varchar(n)`: a fixed-size string
* `text`: a dynamically-sized string
* `int`/`int(n)`/`number`: an integer
* `int(1)`: a common type for a boolean
* `float`/`real`: a floating-point number
* `decimal(n,p)`: a common type for a price
* `date`: a date
* `enum('v1', 'v2', ...)`: a type taking values in a list

<br>

#### Strings

* You can use single or double quotes for strings
* To escape a quote, use either `'a''b'` or `'a\'b'`
* To concatenate, use `||` giving us `'a' || 'b'`
* Some functions you may use: `STRCMP(str1, str2)`, `LENGTH('str')`, `LOWER('str')`, `UPPER('str')`, `LEFT(string, count)`, and `RIGHT(string, count)`.

</div><div>

#### Comments

```sql!
-- comment
/* comment */
```

<br>

#### Useful functions

Refer to [W3Schools - SQL Server Functions](https://www.w3schools.com/SQL/sql_ref_sqlserver.asp).

* `MOD(a, b)`: a modulus b
* `CAST(value as new_type)`: cast a value to another type
* `EXTRACT(element from some_date)`: extract XXX from a date
</div></div>

<hr class="sep-both">

## SQL Clauses 👷

<div class="row row-cols-md-2"><div>

A clause 👷 is an instruction within the request, such as SELECT. There are 3 categories of clauses: DML, DDL, and DCL.

* Declaration `SELECT`>`FROM`>`WHERE`>`GROUP BY`>`HAVING`>`ORDER BY`>`LIMIT`
* Execution `FROM`>`WHERE`>`GROUP BY`>`HAVING`>`SELECT`>`ORDER BY`>`LIMIT`

Note that clauses names are case-insensitive <small>(select=SELECT=Select)</small>.

**DDL (Data Definition)** 💼

* [CREATE]()
* [ALTER]()
* [DROP]()

**DCL (Data control)** 🔐

* [GRANT]()
* [REVOKE]()
</div><div>

**DML (Data Manipulation)** 💰

* [SELECT]()
* [FROM]()
* [WHERE]()
* [INSERT]()
* [UPDATE]()
* [DELETE]()
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