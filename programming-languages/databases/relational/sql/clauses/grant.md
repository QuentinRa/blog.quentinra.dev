# SQL GRANT Clause

[Go back](../index.md#sql-clauses-)

<div class="row row-cols-lg-2"><div>

You can **grant permissions to each user**, or grant permission to a role, and **grant the role to each user**. There are tons of privileges, so you should refer to the documentation of your RDBMS.

```sql!
GRANT xxx, yyy ON sometable TO someuser
GRANT xxx, yyy ON sometable.* TO someuser
GRANT xxx, yyy ON sometable TO PUBLIC -- everyone
GRANT ALL PRIVILEGES ON sometable TO someuser -- all
```

You can allow someone to be able to grant their permissions:

```sql!
GRANT xxx ON sometable TO someuser WITH GRANT OPTION
```
</div><div>

**Note** : you can only grant privileges on one table at once, and to one user per request.

<table class="table table-bordered border-dark table-dark bg-transparent">
<thead><tr><th colspan="2">Some privileges</th></tr></thead>
<tbody>
<tr><td>SELECT</td><td>DELETE</td></tr>
<tr><td>UPDATE</td><td>UPDATE(ATTRIBUTE)</td></tr>
<tr><td>INSERT</td><td>CREATE</td></tr>
<tr><td>ALTER</td><td>DROP</td></tr>
<tr><td>EXECUTE</td><td>...</td></tr>
</tbody>
</table>
</div></div>