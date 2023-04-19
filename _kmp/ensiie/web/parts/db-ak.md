# Artificial keys

[Go back](..)

An artificial key is an attribute that is supposed to be unique and increase each time you add a row/record. In Postgres, it's called sequences. The **type of the attribute is SERIAL**.

```sql
-- start with 1 and will increment by 1 ...
CREATE SEQUENCE public.sequence_name
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;

-- set sequence for attribute "a_column_name"
-- replace a_table_name and a_column_name
ALTER TABLE ONLY public.a_table_name ALTER COLUMN a_column_name
-- replace sequence_name
SET DEFAULT nextval('public.sequence_name'::regclass);
```