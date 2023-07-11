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

```pgsql
set serveroutput on
```

To print something, use:

```pgsql
dbms_output.put_line('something'); 
```

You also need to add a `/` after the `END;` of a [block](#block-of-code):

```pgsql
[...]
END;
/
```
</div><div>

#### PL/pgSQL-specific

To print something, you need to use `raise notice`.

```pgsql
RAISE NOTICE 'something';
RAISE NOTICE 'Some message with a parameter: %', 5;
RAISE NOTICE '... % ... % ...', 5, 7;
```
</div></div>

<hr class="sep-both">

## Block of code

<div class="row row-cols-md-2 mx-0"><div>

The usual block of code:

```pgsql
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

## Variables

<div class="row row-cols-md-2"><div>

Variables are needed to **to store the result of a SQL request**, otherwise they are used to store constants.

The syntax is <small>(v_ is optional, "v" stands for variable)</small>:

```text!
v_name [CONSTANT] type [NOT NULL] [ := expression ]
```

✍️ Use `some_table.some_attribute%type` or `v_name%type` to use the type of some attribute or another variable.

✍️ Use the type `record` to store any one-line SQL result. Use `some_table%ROWTYPE` to ensure the result is from one specific table.
</div><div>

**Examples** 🔥

```pgsql
-- constant
v_five CONSTANT integer := 5;
-- not null
v_real real NOT NULL := 3.0;
-- simple variable
v_date date;
-- array
v_array int array[3] := '{0,1,2}';
```
</div></div>

<hr class="sep-both">

## SQL SELECT

<div class="row row-cols-md-2"><div>

To exploit the result of a SELECT, you need to store it. You must first declare variables, then you can use them as follows:

#### SQL requests returning zero or one rows

```pgsql
-- one variable per selected field
SELECT 42, 'Hello' INTO v_id, v_name FROM /* ... */;
-- using a variable of type "record"
SELECT * INTO v_record FROM /* ... */;
```

#### SQL requests returning n rows

We move the cursor to iterate the result.

```pgsql
-- use IS or FOR, can use CURSOR before v_cursor
-- use v_cursor%ROWCOUNT to the number of rows
v_cursor CURSOR IS sql_request;
```
</div><div>

In the code, you can use a `FOR..LOOP`.

```pgsql
FOR v_entry IN v_cursor LOOP
    -- use "v_entry.XXX" to access the RECORD fields
END LOOP;
```

Cursors do **not** raise exceptions. Use these:

```pgsql
v_cursor%FOUND    -- true if there are still rows, NULL if fetch never called
v_cursor%NOTFOUND -- true if no more rows, NULL if fetch never called
v_cursor%ISOPEN   -- true if the cursor is open
```

<details class="details-n">
<summary>Manually open, move, and close the cursor</summary>

```pgsql
OPEN v_cursor;
LOOP
    FETCH v_cursor INTO v_entry; -- store in v_entry
    EXIT WHEN v_cursor%NOTFOUND;
    -- v_entry.XXX to access the RECORD fields
    -- you may use the MOVE clause
END;
CLOSE v_cursor;
````
</details>
</div></div>

<hr class="sep-both">

## Exceptions

An exception is a signal. Most of the time, it's raised because an error occurred. You can handle it in the block exception, but if you didn't, then the signal will be sent upward (=to the caller). If no one catches it, the request crashes with an error.

<div class="row row-cols-md-2 mx-0"><div>

**You can raise an exception** with `RAISE`

```pgsql
RAISE 'same as raise notice format' [, values]
RAISE '...' USING ERRCODE = 'error_code'
RAISE SOME_EXCEPTION
RAISE SOME_EXCEPTION USING MESSAGE = 'additional message'
```

Some examples

```pgsql
RAISE 'Error: no records matching id=%', id;
RAISE DIVISION_BY_ZERO;
```
</div><div>

**You can catch an exception**, in `EXCEPTION`, with `WHEN`. You can make multiples of them, for each exception.

```pgsql
WHEN NO_DATA_FOUND THEN some_code;
WHEN DIVISION_BY_ZERO THEN some_code; -- ZERO_DIVIDE in Oracle
WHEN UNIQUE_VIOLATION THEN some_code;
-- you tried a select into, with a request
-- returning more than one row.
WHEN TOO_MANY_ROWS THEN some_code;
-- every exception, fallback
WHEN OTHERS THEN some_code;
```
</div></div>

You got a lot of predefined exceptions, check your database documentation.

<hr class="sep-both">

## Functions

<div class="row row-cols-md-2"><div>

You can create functions using:

```pgsql
CREATE OR REPLACE FUNCTION name(args) 
RETURNS r_type -- AS $$
-- declare
BEGIN
    -- code
    -- RETURN result; (if any)
END; -- $$ LANGUAGE plpgsql;
```
</div><div>

Args

* `args` is a list of arguments: `arg1 type1[, ...]`.
* `$n` is an alias to the nth argument <small>($1 == the first one)</small>.

Result

* `r_type` is a return type such as `VOID`, `INT`...

✍️ When using PL/pgSQL, uncomment "`AS $$`" and "`$$ LANGUAGE plpgsql;`". Both `$$` are matching, if you change one, change the other.


</div></div>

<hr class="sep-both">

## 👻 To-do 👻

Stuff that I found, but never read/used yet.

<div class="row row-cols-md-2"><div>

* [_old](_old.md)
</div><div>


</div></div>