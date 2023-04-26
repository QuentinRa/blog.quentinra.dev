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

**DDL (Data Definition)** 💼: define a database/table

* [CREATE DATABASE](clauses/create.md) and [CREATE TABLE](clauses/create.md)
* [ALTER DATABASE](clauses/alter.md) and [ALTER TABLE](clauses/alter.md)
* [DROP DATABASE](clauses/drop.md) and [DROP TABLE](clauses/drop.md)

**DCL (Data control)** 🔐: define users and permissions

* [CREATE USER](clauses/create.md) and [DROP USER](clauses/drop.md)
* [CREATE ROLE](clauses/create.md) and [DROP ROLE](clauses/drop.md)
* [GRANT](clauses/grant.md)
* [REVOKE](clauses/revoke.md)
</div><div>

**DML (Data Manipulation)** 💰: manipulate data

* [SELECT](clauses/select.md) <small>(define what is queried)</small>
* [FROM](clauses/from.md) <small>(define which tables are queried)</small>
* [WHERE](clauses/where.md) <small>(define which records are queried)</small>
* [GROUP BY and HAVING](clauses/group_by.md) <small>(group results)</small>
* [ORDER BY](clauses/order_by.md) <small>(sort results)</small>
* [LIMIT](clauses/limit.md) <small>(skip results, limit the number of results)</small>

These statement will change the database (new record/...):

* [INSERT](clauses/insert.md)
* [UPDATE](clauses/update.md)
* [DELETE](clauses/delete.md)
</div></div>

<hr class="sep-both">

## Transactions

<div class="row row-cols-md-2"><div>

Sometimes, you need to chain the queries in order to keep the database coherent. Every query in the transaction will be executed before another transaction (or query) is proceeded.

```sql!
-- sequential
set transaction serializable
```
</div><div>

The transaction "ends" when you use either COMMIT or ROLLBACK. You can also use transactions to only allow some kind of changes.

```sql!
-- select
set transaction read only /*code*/
set transaction read committed /*code*/
-- update/insert/delete...
set transaction read write /*code/
```
</div></div>

<hr class="sep-both">

## DBMS-specific

<div class="row row-cols-md-2"><div>

Both for **PostgreSQL** and **MySQL**, they are running as a service:

```ps
$ service mysql status
$ service postgresql status
```

On **MySQL**, if the service is started, you can log in using:

```ps
# sudo apt install default-mysql-client
$ mysql -u root -p
$ mysql -u root -p -h SOME_IP
> source xxx.sql; # import
> DESCRIBE table_name; # definition of a table
> SELECT VERSION(); # version
> SELECT database(); # show current database
> SHOW DATABASES; # list databases
> USE a_database; # select one
```

☠️ By default, there is no password for root (blank).

🐲 MySQL/MariaDB default port is 3306.
</div><div>

**MySQL**/**PostgreSQL** store structural data in `information_schema`:

* Tables: `SELECT table_name FROM information_schema.tables WHERE TABLE_SCHEMA='a_db';`
* Columns: `SELECT column_name FROM information_schema.columns WHERE TABLE_SCHEMA='a_db' AND TABLE_NAME='a_table';`

A **SQLite** database is a file such as `users.db`.

* SQLite version 🔎: `file users.db`
* SQLite version 🔎: `select sqlite_version()`
* Load the SQLite database 🗃️: `sqlite3 users.db`
* List tables 🧊: `.tables`
* List columns 🫕: `PRAGMA table_info(some_table);`
* Schema: `select sql from sqlite_master`
</div></div>

<hr class="sep-both">

## 👻 To-do 👻

Stuff that I found, but never read/used yet.

<div class="row row-cols-md-2"><div>

* [SQL.sh](https://sql.sh/) (french)
* [fxjollois](https://fxjollois.github.io/cours-sql/) (french)
* [angelique-renaud](https://www.angelique-renaud.com/bdd.php) (french)
* [learnsql](https://learnsql.com/)
* ROLLBACK/COMMIT
* UNION/INTERSECT/EXCEPT (same number of values in SELECT/NULL). ORDER, or LIMIT can only be applied on the whole request.
* [SQL-specific stuff](/cybersecurity/red-team/s3.exploitation/vulns/injection/files/union_sqli.md#manual-union-based-sqli)
</div><div>

<details class="details-n">
<summary>Views</summary>

Views are virtual tables, that may be used to make things easier to access complex tables, or to prevent users from accessing some attributes in a table. Basically, **a view is a virtual table created from a SQL request**.

```sql!
-- create
CREATE VIEW nomVue [Attributs] AS requêteSQL
-- check delete/update before creating view
CREATE VIEW nomVue [ Attributs ] AS requêteSQL WITH CHECK OPTION
-- delete
DROP VIEW nom_vue
```
</details>

<details class="details-n">
<summary>V</summary>

A **schema** 🗃️ is a sort of namespace in which there are tables, and other related stuff. See the table `INFORMATION_SCHEMA` <small>(TABLES, USERS, COLUMNS/DOMAINS, CHECK_CONSTRAINTS)</small>.

➡️ You may have to use `schema_name.table_name` in your requests.

A **domain** 🌍 refer to the values that an attribute can take. This is determined by the type, and the constraints on it.
</details>

```sql!
SELECT now();
SELECT DATE('2020-12-03');
SELECT @@global.time_zone;
```
</div></div>