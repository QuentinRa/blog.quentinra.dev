# Structured Query Language

* `name`

```sql
SELECT age + 1 FROM customer; -- simple calculation
```

<hr class="sl">

## DML (Data Manipulation) - Useful stuff

<details class="details-e">
<summary>UNION/INTERSECT/EXCEPT <i class="small">on two sets of results</i></summary>

You can make the union, the intersection, or the difference of two requests' results, **but they must have the same number of selected elements** in SELECT. **TRICK**: We usually use `NULL` (or a value) if the two queries do not have the same number of selected element.</small>.

```sql
SELECT name, age FROM customer c
UNION -- you could use INTERSECT or EXCEPT 
SELECT name, NULL FROM customer c;
-- 4 rows
-- Luna (18)
-- Henry (24)
-- Luna (null)
-- Henry (null)
```

> **Note**: ORDER, or LIMIT can only be applied on the whole request.
</details>

You can **only** make calculations in **SELECT**, or in a new clause **HAVING** <small>(NOT in the WHERE, but you may use a nested request)</small>.

The clause **HAVING** is only working on groups <small>(ex: group by name, and check the average age per record having this name)</small>. You may create groups of one element by making groups on the primary key as the primary key is unique.

```sql
-- this request is returning the sum of age PER GENDER
SELECT gender, SUM(age) FROM customer 
GROUP BY gender -- Woman(18), Not specified (24)

-- same but we are ONLY KEEPING GROUPS for which the SUM is greater (or equals) than 20
SELECT gender, SUM(age) FROM customer 
GROUP BY gender HAVING SUM(age) >= 20 -- Not specified (24)

-- better (' and ` are not needed if there are no spaces)
SELECT gender, SUM(age) as 'Sum of age' FROM customer 
GROUP BY gender HAVING `Sum of age` >= 20
```

<hr class="sl">

## DDL (Data Definition)

<details class="details-e">
<summary>Databases</summary>

```sql
-- list databases
SHOW DATABASES

-- alter
ALTER DATABASE db_name CHARACTER SET utf8mb4
```
</details>

<details class="details-e">
<summary>Tables</summary>

<details class="details-e mt-3">
<summary>Attributes and constraints</summary>

<div class="row mx-0 row-cols-md-2"><div>

These are the most used of the predefined constraints.

* You can create your **own constraints** using `constraint nale check (bool_expression)` (named constraint) or `check (bool_expression)` (unammed constraint).

<hr>

A **table should always have a primary key** <small>(artificial key, or foreign key)</small>! A primary key can be made of multiple attributes (ex: id_user, and id_purchase), and in such case, the key **as a whole** must be unique, and not null, but a part of the key (meaning each attribute) may be null, or not unique.

```sql
-- considering (id_user, id_purchase, item_name) with key(id_user, id_purchase)
(5, 12, "Book") -- ok
(5, 13, "Computer") -- ok
(5, 12, "Phone") -- NOT OK, duplicate key
```

</div><div>

<details class="details-e">
<summary>FOREIGN KEY</summary>

If a record in a table is referencing another record in another table, a good way of doing that is for the referencing table to reference the **primary key** of the other table, as it is unique for each record. That's what you can do with **FOREIGN KEY**. But, if you are deleting, or updating, the referenced record's primary key, then by default the request will fail, as this would break things with the referencing record. You may change this default behavior:

```sql
-- if referenced deleted, delete referencing
FOREIGN KEY (attribute1) REFERENCES some_table(attribute1) ON DELETE CASCADE,
-- default: block request
FOREIGN KEY (attribute1) REFERENCES some_table(attribute1) ON DELETE RESTRICT,

-- if referenced updated, update referencing
FOREIGN KEY (attribute1) REFERENCES some_table(attribute1) ON UPDATE CASCADE,
-- default: block request
FOREIGN KEY (attribute1) REFERENCES some_table(attribute1) ON UPDATE RESTRICT
```
</details>

* Constraints

```sql
-- custom constraints
-- 1) applied on an attribute
attribute date check (attribute > '2000-01-01'),
-- 2) applied on the table
constraint example check (LENGTH(fullname) > 5),
check (id_user IN (/* some request */))
```
</div></div>
</details>

```sql
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

<details class="details-e">
<summary>TIP: Transfer data from one table to another</summary>

```sql
ALTER TABLE a_table rename tmp_name;

-- create another table
CREATE TABLE a_table(...);

-- copy values in the new table
INSERT INTO a_table(...) SELECT ... from tmp_name;

-- cleanup
DROP TABLE tmp_name;
```
</details>
</details>

<hr class="sl">

## Advanced concepts

<details class="details-e">
<summary>Transactions</summary>

Sometimes, you need to chain the queries in order to keep the database coherent. Every query in the transaction will be executed before another transaction (or query) is proceeded.

```sql
-- sequential
set transaction serializable
```

The transaction "ends" when you use either COMMIT or ROLLBACK. You can also use transactions to only allow some kind of changes (ex : read only).

```sql
-- select
set transaction read only /*code*/
set transaction read committed /*code*/
-- update/insert/delete...
set transaction read write /*code/
```
</details>

<details class="details-e">
<summary>Views</summary>

Views are virtual tables, that may be used to make things easier to access complex tables, or to prevent users from accessing some attributes in a table. Basically, **a view is a virtual table created from a SQL request**.

```sql
-- create
CREATE VIEW nomVue [Attributs] AS requêteSQL
-- check delete/update before creating view
CREATE VIEW nomVue [ Attributs ] AS requêteSQL WITH CHECK OPTION
-- delete
DROP VIEW nom_vue
```
</details>