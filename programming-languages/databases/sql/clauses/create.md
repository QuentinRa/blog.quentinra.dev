# SQL CREATE Clause

<div class="row row-cols-md-2"><div>

The CREATE clause can be used to create

* 🗄️ Databases
* 📄 Views
* 🗃️ Tables
* 🧑 Users
* ...
</div><div>

...
</div></div>

<hr class="sep-both">

#### CREATE DATABASE

<div class="row row-cols-md-2"><div>

You will usually provide the [charset](/operating-systems/others/architecture/index.md#strings-) when creating a database, to avoid problems with international characters.

```sql!
CREATE DATABASE db_name 
CREATE DATABASE db_name CHARACTER SET utf8mb4
```
</div><div>
</div></div>

<hr class="sep-both">

#### CREATE TABLE

<div class="row row-cols-md-2"><div>

To create a table, you must give every attribute, and their constraints.

```sql!
CREATE TABLE T_NAME ( a_name a_type, ... );
CREATE TABLE IF NOT EXISTS T_NAME ( a_name a_type, ... );
```

The syntax for an attribute is: `<name> <type> [constraints]*`.

```sql!
fullname varchar(64), -- type
fullname varchar(64) NOT NULL, -- not null
fullname varchar(64) DEFAULT 'John DOE', -- default value
fullname varchar(64) UNIQUE, -- unique
fullname varchar(64) NOT NULL DEFAULT 'John DOE', -- ...
id int PRIMARY KEY, -- primary key
id int AUTO_INCREMENT PRIMARY KEY, -- artificial key (+1)
id_user int REFERENCES USERS(id), -- foreign key
```
</div><div>

If constraints are applied on multiple attributes, they must be declared separately <small>(you may also do the same for constraints on one attribute)</small>.

```sql!
PRIMARY KEY(a, b), -- key made of two attributes
UNIQUE(a, b), -- the couple (a,b) is unique
FOREIGN KEY (a, b) REFERENCES XXX(a, b), -- foreign key
```
</div></div>


<hr class="sep-both">

#### CREATE USER

<div class="row row-cols-md-2"><div>

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
-- a specific ip
CREATE USER username@'192.168.0.1'
-- any IP
CREATE USER username@'%'
CREATE USER username@'%.%.%.%'
-- a range: xx.xx.xx.0 to xx.xx.xx.255
CREATE USER username@'xx.xx.xx.%'
```

➡️ Note that you will have to provide the IP each time you use the username, otherwise the DBMS will think it's localhost.
</div></div>

