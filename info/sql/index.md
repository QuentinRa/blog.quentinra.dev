# SQL

This is a really big course, covering

* an introduction to SQL, SQL89 and SQL92
* some advanced concepts such as optimization, indexes, locks, ...
* PGSQL or PLPGSQL
* NoSQL or NotOnlySQL database with Cypher

But this course won't handles ``relational modeling``
as this is considered to be in the ``UML`` course.

<div class="sl"></div>

## Let's start from scratch

A database is a place to store data. To store all theses data, you will need someone to manage
all of this, that's a ``DataBase Management System / DBMS``
such as

* Oracle
* MySQL
* MariaDB
* PostgreSQL
* ...

You will need to install one of those in order to continue.
If you want to do some tests, use <https://sqliteonline.com/>
and connect either to ``maria`` or `postgre`. After 15 minutes
of inactivity you will be disconnected so prefer
installing something.

I am personally using ``Wamp`` on `Windows`
(once installed and started,
open in a browser `http://localhost/phpmyadmin`,
root and no password and there you go)
or on a linux you can simply install ``maria`` or `postgre`
and settings up things really quickly 
(May [that](https://www.digitalocean.com/community/tutorials/how-to-install-mariadb-on-debian-10) help).

<div class="sr"></div>

## Introduction to SQL

The main concept of SQL is that we have

* ``table`` : realisation of a class
* ``tuples``  : realisation of an object
* ``attributes``, `keys`, ...

If you don't know theses terms, you might need to start with
the course about ``relational modeling`` in the `UML` course but if you don't want
to then [here](recap.md) is a recap.

* [First query](syntax/first-query.md)
* [Types in SQL](syntax/types.md)
* [Select some tuples](syntax/select.md)
* [Insert some tuples](syntax/insert.md)
* [Delete some tuples](syntax/delete.md)
* [Jointures](syntax/join.md)
* [Calculations](syntax/calculations.md)

Then you can learn

* [Creating a table](syntax/tables/create.md)
* [Modify a table](syntax/tables/modify.md)
* [Drop a table](syntax/tables/drop.md)
* [Creating an user](syntax/users/create.md)
* [User permissions](syntax/users/permissions.md)
* [Creating roles](syntax/users/roles.md)

And finally you should really learn what are views
and how you can use them to create better databases
than ever.

* [Views](syntax/views.md)

<div class="sl"></div>

## Advanced usages

...

<div class="sr"></div>

## Procedural language (PL) for SQL

...

<div class="sl"></div>

## Sources

...