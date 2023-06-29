# SQL SELECT Clause

[Go back](../index.md#sql-clauses-)

<div class="row row-cols-md-2"><div>

The SELECT clause specifies what data we are selecting.

* Select all attributes

```sql!
SELECT * [...]
```

* Select some attributes (id, name, age, and gender)

```sql!
SELECT id, name, age, gender [...]
```

* No duplicate results (each line once)

```sql!
SELECT DISTINCT name [...]
```
</div><div>

* Rename output columns

```sql!
SELECT name as 'Customer name' [...]
```

* Select an expression

```sql!
SELECT 5 [...]
SELECT LEFT(name, 1) as 'First letter' [...]

-- concatenate Ms/Mr/none and the name
SELECT CONCAT((CASE gender
                WHEN 'Woman' THEN 'Ms. '
                WHEN 'Man' THEN 'Mr. '
                ELSE '' -- default
        END), name) as 'Name'
FROM customer
```
</div></div>

<hr class="sep-both">

## Calculations

<div class="row row-cols-md-2"><div>

* Simple calculation

```sql!
SELECT age+1 [...]
```

* Functions

```sql!
SELECT SUM(age) [...]; -- 18+24
SELECT AVG(age) [...]; -- (18+24)/2
SELECT MIN(age) [...]; -- 18
SELECT MAX(age) [...]; -- 24
SELECT COUNT(*) [...]; -- 2 = number of tuples
```
</div><div>

* You may add DISTINCT <small>(no duplicates)</small> or ALL <small>(default, allow duplicates)</small>

```sql!
SELECT COUNT(DISTINCT age) FROM customer; -- 2 (no duplicates ages)
SELECT SUM(DISTINCT age) FROM customer; -- 18 + 24
SELECT SUM(ALL age) FROM customer; -- same as SUM(age)
```
</div></div>