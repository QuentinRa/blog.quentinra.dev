# SQL CREATE Clause

[Go back](../index.md#sql-clauses-)

<div class="row row-cols-lg-2"><div>

The CREATE clause is used to create

* 🗄️ Databases
* 📄 Views
* 🗃️ Tables
* 🧑 Users
* ...
</div><div>
</div></div>

<hr class="sep-both">

#### CREATE DATABASE

<div class="row row-cols-lg-2"><div>

You will usually provide the [charset](/tools-and-frameworks/knowledge/architecture/index.md#strings-) when creating a database, to avoid problems with international characters.

```sql!
CREATE DATABASE db_name 
CREATE DATABASE db_name CHARACTER SET utf8mb4
```
</div><div>
</div></div>

<hr class="sep-both">

#### CREATE TABLE

<div class="row row-cols-lg-2"><div>

To create a table, you must give every attribute, and their constraints.

```sql!
CREATE TABLE T_NAME ( a_name a_type, ... );
CREATE TABLE IF NOT EXISTS T_NAME ( a_name a_type, ... );
```

The syntax for an attribute is: `<name> <type> [constraints]*`.

```sql!
CREATE TABLE XXX(
    aaa int, -- type
    bbb int NOT NULL, -- not null
    ccc int DEFAULT 'John DOE', -- default value
    ddd int UNIQUE, -- unique
    eee int NOT NULL DEFAULT 'John DOE', -- multiple
    fff int PRIMARY KEY, -- primary key
    ggg int AUTO_INCREMENT PRIMARY KEY, -- artificial key (+1)
    id_user int REFERENCES USERS(id), -- foreign key
);
```
</div><div>

If constraints are applied on multiple attributes, they must be declared separately <small>(you may also do the same for constraints on one attribute)</small>.

```sql!
PRIMARY KEY(a, b), -- key made of two attributes
UNIQUE(a, b), -- the couple (a,b) is unique
FOREIGN KEY (a, b) REFERENCES XXX(a, b), -- foreign key
```

➡️ For foreign keys, see also `ON [UPDATE|DELETE] [CASCADE|RESTRICT]` to update/delete the referencing row.

You can create your own constraints using `constraint nale check (bool_expression)` (named constraint) or `check (bool_expression)` (unnamed constraint).

```sql!
-- 1) applied on an attribute
a_date date CHECK (a_date > '2000-01-01'),
-- 2) applied on the table
CONSTRAINT example CHECK (LENGTH(fullname) > 5),
CHECK (id_user IN (/* some request */))
```
</div></div>

<hr class="sep-both">

#### CREATE USER

<div class="row row-cols-lg-2"><div>

```sql!
CREATE USER username
CREATE USER username IDENTIFIED BY 'password'
```

A user created with the code above is bound to localhost, meaning only a local user can connect to it. It's the same as using:

```sql!
CREATE USER username@'localhost'
CREATE USER username@'127.0.0.1'
```
</div><div>

We may want to allow the user to connect from another IP.

```sql!
-- a specific IP
CREATE USER username@'192.168.0.1'
-- any IP
CREATE USER username@'%'
CREATE USER username@'%.%.%.%'
-- a range: xx.xx.xx.0 to xx.xx.xx.255
CREATE USER username@'xx.xx.xx.%'
```

➡️ Note that you will have to provide the IP each time you use the username, otherwise the DBMS will think it's localhost.
</div></div>

<hr class="sep-both">

#### CREATE ROLE

<div class="row row-cols-lg-2"><div>

A role is like a group, used to grant permissions to everyone having this role.

```sql!
CREATE ROLE role_name
CREATE ROLE role_name WITH ADMIN xxx -- role managed by xxx
```
</div><div>
</div></div>