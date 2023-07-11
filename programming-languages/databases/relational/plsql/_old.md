# Procedural Language

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