# SQL DROP Clause

[Go back](../index.md#sql-clauses-)

<div class="row row-cols-lg-2"><div>

DROP is used to delete users, tables, databases...

* Database 🗄

```sql!
DROP DATABASE db_name;
```

* Table 🗃️

```sql!
DROP TABLE table_name;
```
</div><div>

* User 🧑

```sql!
DROP USER username:
DROP USER username@'%': -- for non local
DROP USER username CASCADE -- drop schema too
```
</div></div>