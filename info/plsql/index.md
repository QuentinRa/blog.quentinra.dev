# Procedural Language

**PL/SQL** (Procedural Language for SQL), or **PL/pgSQL** (for PostgreSQL) are extensions of the SQL, allowing you to run code in your database. There is some small differences between the procedural language in Oracle, and the procedural language in PostgreSQL, but aside from that, almost everything is the same 👍.

<hr class="sl">

## PL/SQL (Oracle) - particularities

```sql
-- enable output, only done once, off by default
set serveroutput on
-- print something
dbms_output.put_line('something'); 
```
```sql
-- show more information about your errors (need to be called multiples times)
show errors;
-- raise an exception
exception_name EXCEPTION;
PRAGMA exception_init(exception_name, code);
raise_application_error(code, "message");
```

You need to add a `/` after `END` to compile your code.

<details>
<summary>Procedures 🙄</summary>

This is a sort of function, with some small differences (no return, parameters OUT, cannot be called in SQL, ...).

```sql
CREATE OR REPLACE PROCEDURE
procedure_name(name1 type, name2 type) IS
-- variables
BEGIN
-- code
END;
/ -- compile

-- call (one of these)
execute procedure_name(args);
call procedure_name(args);
```
</details>

<hr class="sr">

## PL/pgSQL (PostgreSQL) - particularities

```sql
-- print something
RAISE NOTICE 'something';
RAISE NOTICE 'Some message with a parameter: %', 5;
RAISE NOTICE '... % ... % ...', 5, 7;
```

<hr class="sl">

## Block of code

<div class="row row-cols-md-2 mx-0"><div>

```sql
DECLARE
-- declare variables
BEGIN
-- instructions
-- COMMIT or ROLLBACK
EXCEPTION
-- handle exceptions
END;
```
</div><div class="align-self-center">

* **DECLARE** is optional. If you got variables, it's one per line, with a semi-colon at end end of each line.
* **BEGIN** is the code itself

**Take note🤚!** If you are doing a DML statement (INSERT, UPDATE, ...), then you must **COMMIT** (=save) or **ROLLBACK** (=cancel).

* **EXCEPTION** is optional. You will handle exceptional behaviors (ex: errors) here.
</div></div>

<hr class="sr">

## Declare variables

<div class="row row-cols-md-2 mx-0"><div>

We need variables, either **to store the result of a SQL request**, or because we are a good fellow, and **declare constants** instead of using hard coded values 🤮.

The syntax is the following <small>([a] means that "a" is optional)</small>

```none
v_name [CONSTANT] type [NOT NULL] [ := expression ]
```

> **Pro tip 🚀**: we are adding a `v_` to make it explicit in the name, that this is a variable. It could be a parameter too (if we are inside a function/...).<br>
> **Pro tip**: you can create types with `CREATE TYPE`.
</div><div class="align-center">

**Examples**

```sql
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

<details class="details-e">
<summary>Inter types 😎</summary>

You may want your variable to not take an hardcoded type, but a type from an attribute

```sql
v_name table.attr%type; -- type of the attribute "attr" in "table"
v_name_copy v_name%type; -- type of the variable v_name
```
</details>

<details class="details-e">
<summary>Records/Tuples 👌</summary>

If you got such a request, returning only one record. Then we got a type for this

```sql
Select * from table LIMIT 0, 1
```

In PL/SQL, you can do this. Note that you can access an attribute of a record with `.` (dot).

```sql
v_record record; -- record/tuple
v_record table%ROWTYPE; -- store a record/tuple of a table "table"
```
</details>