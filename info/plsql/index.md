# Procedural Language

**PL/SQL** (Procedural Language for SQL), or **PL/pgSQL** (for PostgreSQL) are extensions of the SQL, allowing you to run code in your database. There is some small differences between the procedural language in Oracle, and the procedural language in PostgreSQL, but aside from that, almost everything is the same 👍.

<hr class="sl">

## PL/SQL (Oracle) - particularities

```sql
-- enable output, only done once, off by default
set serveroutput on
-- print something
dbms_output.put_line('something'); 
```
```sql
-- show more information about your errors (need to be called multiples times)
show errors;
-- raise an exception
exception_name EXCEPTION;
PRAGMA exception_init(exception_name, code);
raise_application_error(code, "message");
```

<details>
<summary>Procedures 🙄</summary>

This is a sort of function, with some small differences (no return, parameters OUT, cannot be called in SQL, ...).

```sql
CREATE OR REPLACE PROCEDURE
procedure_name(name1 type, name2 type) IS
-- variables
BEGIN
-- code
END;
/ -- compile

-- call (one of these)
execute procedure_name(args);
call procedure_name(args);
```
</details>