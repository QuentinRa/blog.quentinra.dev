# Procedural Language

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