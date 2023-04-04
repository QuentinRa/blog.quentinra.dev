# SQL DROP Clause

<div class="row row-cols-md-2"><div>

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