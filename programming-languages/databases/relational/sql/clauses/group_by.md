# SQL GROUP BY Clause

[Go back](../index.md#sql-clauses-)

<div class="row row-cols-md-2"><div>

There are cases when we want to apply a calculation to a group. For instance, if we want the average age by genre.

```sql!
SELECT gender, AVG(age) FROM customer 
GROUP BY gender
```
</div><div>

We can't use calculations in the where, as they are only applied to groups. However, we can use the HAVING clause, to only keep groups based on a predicate.

```sql!
-- keep groups for which average >= 20
SELECT gender, AVG(age) FROM customer 
GROUP BY gender HAVING AVG(age) >= 20
```
</div></div>