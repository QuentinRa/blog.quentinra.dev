# SQL ALTER Clause

[Go back](../index.md#sql-clauses-)

The ALTER clause is used to edit tables, databases...

<hr class="sep-both">

## ALTER Database

<div class="row row-cols-lg-2"><div>

```sql!
ALTER DATABASE db_name
    -- change the charset
    CHARACTER SET utf8mb4
```
</div><div>
</div></div>

<hr class="sep-both">

## ALTER Table

<div class="row row-cols-lg-2"><div>

```sql!
ALTER TABLE a_table
    -- rename
    RENAME new_name
    RENAME COLUMN a_column TO new_name;
    -- add
    ADD a_column a_type a_default_value
    ADD CONSTRAINT name CHECK ...
    -- add/drop default value
    ALTER column_name DROP DEFAULT
    ALTER column_name SET DEFAULT
    -- drop 
    DROP COLUMN column_name
    DROP CONSTRAINT constraint_name
;
```
</div><div>

Special case 🔥: transferring data from one table to another.

```sql!
ALTER TABLE a_table rename tmp_name;

-- create another table
CREATE TABLE a_table([...]);

-- copy values in the new table
INSERT INTO a_table([...]) SELECT [...] from tmp_name;

-- cleanup
DROP TABLE tmp_name;
```
</div></div>