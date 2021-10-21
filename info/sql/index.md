# Structured Query Language

Structured Query Language, often abbreviated **SQL** is a normalized language to process queries on a relational database. It's based on a "model" that you defined. If you need something flexible, you should look at NoSQL databases.

Relational databases are provided by a **DataBase management system DBMS** (`Système de gestion de base de données (SGBD)`). You will need one to manage your databases among

* **Oracle**
* **PostgresSQL**
* **MariaDB**
* MySQL
* SQLite
* ...

> **You need to install one**, to continue this course. Please, refer to your DBMS documentation 🤓. A temporary solution might be to use [SQLiteOnline](https://sqliteonline.com/) (🙄).
> 
> **ENSIIE students** got a some notes [in the WEB section](../../special/web/parts/db-acc.md) to use our school database.

> **SQL 89/92**: Both **SQL-89** and **SQL-92** are quite used. There is one major difference: what we call "JOIN clauses" are **not available in SQL-89**.

<hr class="sl">

## Relational model

In the second screen, you can see the usual representation of your data in a database. This is a literally an Exel table with rows, columns, and entries. In the first screen, this is the UML representation, that we use when creating a database from specifications (see **relational modeling**).

<div class="row justify-content-center mx-0">
<div class="col-12 col-md-3">

![](images/table_modeling.png)
</div><div class="col-12 col-md-8">

![](images/table_view.png)
</div>
</div>

✨ **Some vocabulary** ✨
 
| Element | Name (UML) | Name (DBMS) | Note |
|---------|---------|---------|---------|
| Customer | **Class** | **Table** |  |
| id, name, age, gender | **Attributes** | **Attributes** | <small>(=columns)</small> |
| `(1, "Luna", 18, "Woman")`, ... | **Objects** | **Tuples**/Records | <small>(=rows)</small>. We are saying "tuples" in French too. |
| id | **Identifiers** <br> <small>(Keys, but this is a mistake)</small> | **Keys** | An attribute taking **unique** and **non-nulls** values.<br>This is used to reference a tuple in another table.<br>Usually, we are using an "autoincrement" key, <br>which is incrementing (+=1) each time we are adding a row. <br> An autoincrement key is called **artificial key**. |

> Note: I know that "customer" **should starts with an uppercase**, as every class should do. I should also **add something before id** <small>(as many class may have an attribute id, so I won't have to prefix it)</small>, and I should **add something before name** <small>(as name is a **reserved keyword** otherwise, I will have to escape it later)</small> (ex: c_id, c_name).

<hr class="sl">

## Zest of knowledge

> **Clause**
> 
> This is the keywords SELECT, FROM, ... that are making a SQL request.

> **Request**
> 
> This is a statement in which you are using clauses to do something on the database. **A request must ends with a `;`** <small>(unless this is a simple request)</small>.

> **Schema**
> 
> To make it simple, this is a table storing data. Some are saying this is a library of databases. To call a table in a schema, do `schema.table`.
> 
> * For an user, this is the list of its tables, views, constraints
> * For a database, this is the table **INFORMATION_SCHEMA** (TABLES, USERS, COLUMNS/DOMAINS, CHECK_CONSTRAINTS)
> 
> This word is also used for requests 🧐: this is the selected tables, and the attributes.
> 
> As the ENSIIE, we got one schema per user (ex: `prenom.nom`) in which we got another schema called `public`. You will store your databases in it.

> **DML, DDL, DCL**
> 
> We are using DML/DDL/DCL, to talk about a category of clauses. This is something quite used by pros 😎.
> 
> * DML (Data Manipulation): Select, Insert, Update, Delete
> * DDL (Data Definition): Create, Alter, Drop
> * DCL (Data control): Grant, Revoke

<hr class="sr">

## SQL Syntax

Before digging into the clauses, here is a list of everything that you will be supposed to known in the next sections.

<div class="row mx-0"><div class="col-6">

```sql
SELECT * 
FROM information_schema.TABLES T
WHERE T.TABLE_SCHEMA = 'information_schema';
```
</div><div class="col-6 align-self-center">

* **Clauses name are not case sensitive** <small>(uppercase, lowercase, mix of both)</small>
* **Requests end with a ;** <small>(unless they are simples)</small>
* You can put everything on the same line
</div></div>

More specifically

| Notion (General) | In SQL |
| ------ | ------- |
| Assignment <small>(PL/SQL only)</small> | `a = 5`, or `à := 5` |
| Comments | `-- comment` (no inline comment) |
| a % b | `MOD(a,b)` |
| Reserved words | `Select date [...]` ❌ (date, name, ... are reserved)<br><code>Select \`date\` [...]</code> ✅ |
| DAY/... from date | `EXTRACT(element from some_date)` <br>With element YEAR, MONTH, DAY, HOUR, ... |

| Notion (Strings) | In SQL |
| ------ | ------- |
| String | `'a'` or `"a"` (the latter may not work) |
| String (escape) | ex: use a quote in a quote `'\''` |
| Concatenate | <code>'a' \|\| 'b'</code> |
| Extract chars | Left(string, count) or RIGHT(string, count) |

> **Note**: More functions at [W3Schools - SQL Server Functions](https://www.w3schools.com/SQL/sql_ref_sqlserver.asp).<br>
> **Test a function?**: `SELECT EXTRACT(DAY from '2020-03-25')`

<details class="details-e">
<summary>Types</summary>
<br>

| Notion | Type in SQL | Description |
| ------ | ------- | ------- |
| Char  | `varchar(1)` | A string of one character |
| String  | `varchar(n)`<br>`varchar2(n)` (Oracle) | A string of n character |
| String  | `text` | A string taking a non-determined number of characters |
| Integer  | `int`, `int(n)`, `number` | An Integer. `int` is the same as `int(11)`. |
| Boolean  | `int(1)` | An int, but taking only 0 or 1 |
| Real  | `float` or `real` | To represents a price, you may use `decimal(n,p)`  |
| date  | `date` | To represents a date |
| Enumeration  | `enum('v1', 'v2', ...)` | An attribute/value that can take a fixed number of values. |
</details>