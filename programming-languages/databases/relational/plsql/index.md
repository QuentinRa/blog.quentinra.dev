# PL/SQL

<div class="row row-cols-md-2"><div>

Many [DBMS](../_knowledge/index.md) have their own **procedural languages** which extends SQL and allow us to write procedural code <small>(if statement, loops...)</small> that can be executed within the database.

* 💵 Oracle: **PL/SQL** (Procedural Language for SQL)
* 🍰 PostgreSQL: **PL/pgSQL** (similar to PL/SQL)
* 🐭 Microsoft SQL Server: **T-SQL** (Transact-SQL)
* ...

This course covers PL/SQL and PL/pgSQL.
</div><div>
</div></div>

<hr class="sep-both">

## DMBS-specific

<div class="row row-cols-md-2"><div>

#### PL/SQL-specific

You need to enable server output to see prints.

```sql!
set serveroutput on
```

To print something, use:

```sql!
dbms_output.put_line('something'); 
```

You also need to add a `/` after the `END;` of a [block](#block-of-code):

```sql!
[...]
END;
/
```
</div><div>

#### PL/pgSQL-specific

To print something, you need to use `raise notice`.

```sql!
RAISE NOTICE 'something';
RAISE NOTICE 'Some message with a parameter: %', 5;
RAISE NOTICE '... % ... % ...', 5, 7;
```
</div></div>

<hr class="sep-both">

## Block of code

<div class="row row-cols-md-2 mx-0"><div>

The usual block of code:

```sql!
DECLARE
-- declare variables
BEGIN
-- instructions
-- (if applicable) COMMIT or ROLLBACK
EXCEPTION
-- handle exceptions
END;
```
</div><div class="align-self-center">

* **DECLARE** is optional. You can declare variables here, one per line, with a semicolon at the end of each line.
* **BEGIN** is the code itself.
* **EXCEPTION** is an optional block to handle unexpected behaviors, which are mostly errors.

⚠️ If you are update records <small>(INSERT, UPDATE, ...)</small>, then you must `COMMIT` (=save) or `ROLLBACK` (=cancel).
</div></div>

<hr class="sep-both">

## 👻 To-do 👻

Stuff that I found, but never read/used yet.

<div class="row row-cols-md-2"><div>

* [_old](_old.md)
</div><div>


</div></div>