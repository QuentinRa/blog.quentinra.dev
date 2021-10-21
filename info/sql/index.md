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