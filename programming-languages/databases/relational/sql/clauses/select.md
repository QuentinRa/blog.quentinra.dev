# SQL SELECT Clause

<div class="row row-cols-md-2"><div>

The SELECT clause specify what data we are selecting.

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

* Select a value/function

```sql!
SELECT 5 [...]
SELECT LEFT(name, 1) as 'First letter' [...]
```
</div></div>