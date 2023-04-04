# Structured Query Language

* `name`

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

<hr class="sl">

## DDL (Data Definition)

```sql
-- list databases
SHOW DATABASES
```

<hr class="sl">

## Advanced concepts

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