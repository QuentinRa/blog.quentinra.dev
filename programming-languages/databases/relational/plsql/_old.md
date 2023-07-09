# Procedural Language

PL/SQL (Oracle) - particularities

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

* **DECLARE** is optional. If you got variables, it's one per line, with a semicolon at the end of each line.
* **BEGIN** is the code itself

**Take note🤚!** If you are doing a DML statement (INSERT, UPDATE, ...), then you must **COMMIT** (=save) or **ROLLBACK** (=cancel).

* **EXCEPTION** is optional. You will handle exceptional behaviors (ex: errors) here.
</div></div>

<hr class="sr">

## Declare variables

<div class="row row-cols-md-2 mx-0"><div>

We need variables, either **to store the result of a SQL request**, or because we are a good fellow, and **declare constants** instead of using hardcoded values 🤮.

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

You may want your variable to not take a hardcoded type, but a type from an attribute

```sql
v_name table.attr%type; -- type of the attribute "attr" in "table"
v_name_copy v_name%type; -- type of the variable v_name
```
</details>

<details class="details-e">
<summary>Records/Tuples 👌</summary>

We got a type to **store only ONE row**. You can access an attribute of a record with `.` (dot).

```sql
v_record record; -- record/tuple
v_record table%ROWTYPE; -- store a record/tuple of a table "table"
```
</details>

<hr class="sl">

## Statements

<details class="details-e">
<summary>IF and CASE (switch)</summary>

```sql
IF something THEN [ELSIF another_condition THEN]
	[ELSE THEN]
END IF;

-- IF ELSEIF ... ELSE
CASE variable
	WHEN value1 THEN instructions
	WHEN value2 THEN instructions
	ELSE instructions
END CASE;
```
</details>

<details class="details-e">
<summary>Loop (do while) and while</summary>

```sql
-- do ... while
LOOP something
	EXIT WHEN condition
END LOOP;

-- while
WHILE something LOOP some_code END LOOP;
```
</details>

<details class="details-e">
<summary>For statement</summary>

```sql
-- for i in seq / for (i=min; i<max; i++){}
FOR i IN min AND max LOOP some_code END LOOP;
-- reverse loop
FOR i IN REVERSE min AND max LOOP some_code END LOOP;
```
</details>

<hr class="sr">

## Select into and Cursors

<details class="details-e">
<summary>Requests returning up to one record 📘</summary>

You can use `Select ... into variables`. The variables given will be used to store the attributes of our selection.

```sql
-- THE VARIABLES MUST BE DECLARED
SELECT 5, 'Luna' INTO v_id, v_name FROM /* ... */;
SELECT * INTO v_record FROM /* ... */;
```
</details>

<details class="details-e">
<summary>Requests returning 0 or more records 📚</summary>

A cursor is something storing one row too. But, you can iterate your cursor, to see each record in the result.

* **DECLARE**

```sql
v_cursor CURSOR IS sql_request;
v_cursor CURSOR FOR sql_request;
CURSOR v_cursor FOR sql_request; -- sometimes
```

* **Usage**

```sql
FOR v_entry IN v_cursor LOOP
	-- v_entry is a RECORD
	-- use . (dot) to get an attribute (=field)
END LOOP;
````

* **Explicit usage**

```sql
OPEN v_cursor;
LOOP
	FETCH v_cursor INTO v_entry; -- v_entry is a record, DECLARE IT
	EXIT WHEN v_cursor%NOTFOUND;
	-- use . (dot) to get a attribute (=field)
	-- you may use the MOVE clause
END;
CLOSE v_cursor;
````

* **Inspect your cursor**

You can ask your cursor about things

```sql
v_cursor%FOUND -- true if there are still rows, NULL if fetch never called
v_cursor%NOTFOUND -- true if no more rows, NULL if fetch never called
v_cursor%ISOPEN -- 🙄
v_cursor%ROWCOUNT -- get the number of rows
```

Please, note that exceptions are not working on cursors (e.g.: no NO_DATA_FOUND).
</details>

<hr class="sl">

## Exceptions

An exception is a signal. Most of the time, it's raised because an error happened. You can handle it in the block exception, but if you didn't, then the signal will be sent upward (=to the caller). If we are back on the request, then the request is crashing with an error.

<div class="row row-cols-md-2 mx-0"><div>

**You can raise an exception** with `RAISE`

```sql
RAISE 'same as raise notice format' [, values]
RAISE '...' USING ERRCODE = 'error_code'
RAISE SOME_EXCEPTION
RAISE SOME_EXCEPTION USING MESSAGE = 'additional message'
```

Some examples

```sql
RAISE 'Error: no records matching id=%', id;
RAISE DIVISION_BY_ZERO;
```
</div><div>

**You can catch an exception**, in `EXCEPTION` with `WHEN`. You can make multiples WHEN in EXCEPTION.

```sql
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

<hr class="sr">

## Functions

A function is a block of code, that may take parameters, and return something.

<div class="row row-cols-md-2 mx-0"><div>

```sql
CREATE OR REPLACE FUNCTION name(args) 
RETURNS r_type AS $$
-- declare ...
BEGIN
    -- code ...
    [RETURN result;]
END; $$ LANGUAGE plpgsql;
```
</div><div class="align-self-center">

* **name** is obviously the name of our function
* **args** are the argument, with `name type` for each argument.
* **r_type** is the return type, such as `VOID`, `INT`, etc.
* You can call DECLARE, then write your code inside BEGIN-END
* **RETURN** is returning the result of your function (if the return type isn't void).
</div></div>

> **Note**: if you add something inside `$$`, make sure the content is matching the second delimiter `$$`.<br>
> **Pro tip**: you can use `$1`, ... instead of the name of the arguments.

<hr class="sl">

## Triggers

<div class="row row-cols-md-2 mx-0"><div>

A trigger (`déclencheur`) is a function that will be triggered on an event, such as inserting, updating, or deleting an element. You could use it to calculate derived fields, or to archive deleted records.

```sql
CREATE [OR REPLACE] TRIGGER trigger_name
BEFORE /* or AFTER */ some_event ON some_table
[FOR EACH ROW]
[WHEN some_condition]
-- some code (ex: BEGIN ... END)
-- or
-- EXECUTE PROCEDURE function(args);
```
</div><div class="align-self-center">

A trigger is executed either **BEFORE** or **AFTER** an event, such as **INSERT, UPDATE, DELETE, ...**. You may set a trigger only on **one column** using `UPDATE(column)` or `UPDATE OF column`.

Add **OR REPLACE** if you are updating an existing trigger.

* **FOR EACH ROW**: If you are planning to update every row, then add it. This may be the case, if the grade of each person is based on the median. If a grade changes, we need to update every grade.

* **WHEN**: You may add a when clause. If the condition is false, then the trigger is not triggered for this record.

> **Pro tip**: you can make a trigger for multiples events, with `OR` such as `INSERT OR UPDATE`.<br>
</div></div>

A function called by a trigger isn't a normal function. Aside from the two variables **NEW** and **OLD**, **you will have to return** (type = TRIGGER)

* `NULL`: cancel insert/update/delete
* `NEW`/`OLD`/...: the new record
* If you omit RETURN, then it's the same as `RETURN NEW`

**Vocabulary** 😎

* **Trigger DML**: executed on every record that triggered the event
* **Trigger DML line**: executed once per event
* **Trigger DDL** (`Trigger base/schéma`): executed once

> **Pro tip**: no COMMIT/ROLLBACK in a trigger, as the request will already do once.

<details class="details-e">
<summary>OLD and NEW ✨</summary>

When updating a line, you got the old record in `OLD`, the one after updating in `NEW`. For INSERT, you got only `NEW` (OLD is null). For DELETE, you got only `OLD` (NEW is null).

You will most likely use them inside your trigger ✨. They are called **correlation variables**. They are records, such use `.` to get an attribute.

Sometimes, we are renaming them. Right before the `FOR EACH ROW` (even if you don't have one), you could do this, to use `:old` and `:new`.

```sql
REFERENCING OLD :old NEW :new
```
</details>

<details class="details-e">
<summary>Delete a trigger</summary>

```sql
DROP TRIGGER trigger_name ON some_table;
DROP TRIGGER IF EXISTS trigger_name ON some_table;
```
</details>

<hr class="sr">

## Some templates

<details class="details-e">
<summary>Function</summary>

```sql
CREATE OR REPLACE FUNCTION some_function(param1 INTEGER, param2 INTEGER) RETURNS VOID AS $$
BEGIN
    RAISE EXCEPTION 'param1 is %. param2 is %.', param1, param2;
END; $$ LANGUAGE plpgsql;
```

Then test

```sql
SELECT some_function(5,10);
-- [...] param1 is 5. param2 is 10.
```
</details>

<details class="details-e">
<summary>Catch an exception</summary>

```sql
CREATE OR REPLACE FUNCTION some_function() RETURNS VOID AS $$
BEGIN
    Select 1/0;
EXCEPTION
    WHEN division_by_zero then RAISE EXCEPTION 'catch';
END; $$ LANGUAGE plpgsql;
```
</details>

<details class="details-e">
<summary>Select into</summary>

```sql
CREATE OR REPLACE FUNCTION some_function() RETURNS RECORD AS $$
DECLARE
    v_record RECORD;
BEGIN
    Select 1, 'Luna', 18, 'Woman' INTO v_record;
    RETURN v_record;
END; $$ LANGUAGE plpgsql;
```

Then test

```sql
SELECT some_function()
-- (1,Luna,18,Woman)
```
</details>

<details class="details-e">
<summary>Using a cursor</summary>

```sql
CREATE OR REPLACE FUNCTION some_function() RETURNS void AS $$
DECLARE
v_cursor CURSOR IS SELECT 'Luna' as NAME; -- some real request 🙄
BEGIN
    FOR v_entry IN v_cursor LOOP
        -- do something
        -- raise exception :)
        RAISE '%', v_entry.name;
	END LOOP;
END; $$ LANGUAGE plpgsql;
```

```sql
SELECT some_function();
-- [...] Luna
```
</details>

<details class="details-e">
<summary>Triggers</summary>

```sql
CREATE OR REPLACE FUNCTION some_function() RETURNS TRIGGER AS $$
BEGIN
    RETURN NEW; -- 
END; $$ LANGUAGE plpgsql;
```

You should check if "BEFORE INSERT" is what you want, and if you should remove "FOR EACH ROW"...

```sql
CREATE TRIGGER some_trigger BEFORE INSERT ON some_table FOR EACH ROW
EXECUTE PROCEDURE some_function();
```
</details>

<hr class="sl">

## Sources

* [IUT-SF Teachings](http://www.iut-fbleau.fr/)
* [ENSIIE Teachings](https://www.ensiie.fr/)