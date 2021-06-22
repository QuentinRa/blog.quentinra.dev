## Artificial keys

These are attributes for which the value is incremented each time a new row
is added. In ``postgre`` it's called sequences.

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

**Attribute type is SERIAL**.