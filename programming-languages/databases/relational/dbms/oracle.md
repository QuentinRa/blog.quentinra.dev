# Oracle 💵

[![footprinting](../../../../cybersecurity/_badges/htb/footprinting.svg)](https://academy.hackthebox.com/course/preview/footprinting)

<div class="row row-cols-lg-2"><div>

[Oracle Database](https://www.oracle.com/database/) or Oracle DBMS is a proprietary multi-model database management system developed by Oracle.

Each database is identified by a System Identifier (SID). Clients need the SID to connect to a database <small>(or default value is used)</small>.

Oracle databases can be managed using [TNS](/operating-systems/networking/protocols/tns.md).
</div><div>

Common Commands:

```sql!
select table_name from all_tables;
select table_name from user_tables;
select table_name from dba_tables;    -- DBA only
select column_name, data_type from all_tab_columns where table_name = 'table_name';
show CON_NAME;                        -- Show SID | Oracle 12c+
select * from user_role_privs;        -- list current privileges
select name, password from sys.user$; -- retrieve hashes | DBA only
```
</div></div>

<hr class="sep-both">

## XXX

<div class="row row-cols-lg-2"><div>

Every select must be associated with a table. You can use `dual`:

```sql!
SELECT 'abc' FROM dual
```
</div><div>
</div></div>