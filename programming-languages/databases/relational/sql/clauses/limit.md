# SQL LIMIT Clause

[Go back](../index.md#sql-clauses-)

<div class="row row-cols-md-2"><div>

The limit cause can be used to skip the first **k** results, or/and define the max number of results **n**.

```sql!
[...] LIMIT n; -- return up to n records
[...] LIMIT k, n; -- skip k records, returns up to n records
[...] LIMIT 0, 1; -- up to one record
[...] LIMIT 1, 1; -- up to one record, skip the first record
```
</div><div>
</div></div>