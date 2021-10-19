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
 
| Element | Name (UML) | Name (SQL) | Note |
|---------|---------|---------|---------|
| Customer | **Class** | **Table** |  |
| id, name, age, gender | **Attributes** | **Attributes** | <small>(=columns)</small> |
| `(1, "Luna", 18, "Woman")`, ... | **Objects** | **Tuples**/Records | <small>(=rows)</small>. We are saying "tuples" in French too. |
| id | **Identifiers** | **Keys** | An attribute taking **unique** and **non-nulls** values.<br>This is used to reference a tuple in another table.<br>Usually, we are using an attribute "autoincrement", <br>which is incrementing each time we are adding a row. <br> An autoincrement key is called **artificial key**. |

<hr class="sl">

## SQL queries

An SQL query looks like this

```sql
-- this is a comment
SELECT * FROM a_table WHERE an_attribute = a_value;
```

* **SELECT, FROM, WHERE** are called **clauses**/**instructions**. They are the instruction of your request.
* **\*, a_table, ...** are called **arguments** or maybe options

The whole request is, most of the time <small>(mandatory unless the request is simple)</small>, closed by a semi-colon `;`.