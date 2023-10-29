# SQL ORDER BY Clause

[Go back](../index.md#sql-clauses-)

<div class="row row-cols-lg-2"><div>

You can sort your results with ORDER BY:

* ⬇️ ASC (default, A → Z)
* ⬆️ DESC (Z → A)

```sql!
SELECT name [...] ORDER BY name;
SELECT name [...] ORDER BY name ASC;
SELECT name [...] ORDER BY name DESC;
SELECT name [...] ORDER BY name, age DESC;
```
</div><div>

You can reference the nth attribute of the select. It's useful when the nth attribute is not a column, but a calculation or something dynamic.

```sql!
SELECT name [...] ORDER BY 1 DESC;
```
</div></div>