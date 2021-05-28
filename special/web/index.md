# Web

Your websites will be accessible
with a url like this ``http://pgsql.pedago.ensiie.fr/~prenom.nom/``.


## Enable errors

```php
<?php

error_reporting(E_ALL);
ini_set("display_errors", 1);

$c = new PDO("pgsql:dbname=tpphp;host=pgsql2;port=5432", "tpphp", "tpphp");
```

## Connect to database

Beware that the database is only accessible from the inside.

```php
<?php
$c = new PDO("pgsql:dbname=tpphp;host=pgsql2;port=5432", "tpphp", "tpphp");
```

But you should create a new db account. You will have to login using your
**ENSIIE** credentials to ``pgsql`` host. Simply do
``psql -h pgsql -U your_ensiie_login -d a_database``.

If you still haven't created a database, then login without a database,
check SQL course/internet (or maybe that `CREATE DATABASE name;`) and create
it before login.

```sql
-- create
CREATE USER username LOGIN PASSWORD 'a_password';
-- grant, REPLACE username;
-- almost all rights
GRANT INSERT, SELECT, UPDATE, DELETE, TRUNCATE,
    REFERENCES, TRIGGER on all tables in schema public TO username;
-- grant, REPLACE username;
-- related to "AUTO_INCREMENT" keyword
GRANT USAGE, SELECT ON ALL SEQUENCES IN SCHEMA public TO username;
```

## Database errors

You should enable error for developping purposes if not done.

* <https://stackoverflow.com/questions/8992795/set-pdo-to-throw-exceptions-by-default> 
* <https://www.php.net/manual/en/pdo.error-handling.php#odbc-statistics.example.basic>

## Artificial keys

Theses are attributes for which the value is incremented each time a new row
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

## W3Validator

W3Validator is used to verify if you are writing your code using good practices.
At ENSIIE, to check your pages, you must copy and paste le code here :
<https://validator.w3.org/#validate_by_input)> since URL will not work (because
of login). You can do the same for css <https://jigsaw.w3.org/css-validator/#validate_by_uri>.

In normal website, you can add a logo

```html
<p>
    <a href="https://validator.w3.org/check?uri=referer"><img
            src="http://www.w3.org/Icons/valid-xhtml10"
            alt="Valid XHTML 1.0!" height="31" width="88" /></a>
</p>
```

(Source: <https://www.w3.org/QA/Tools/Icons>, <https://validator.w3.org/docs/help.html#icon>)

that will redirect to W3Validator and your page in it, but that's by URL so
for us that's pretty useless.

**Anyone can use this logo so that not something used to show that you passed
the test, but something that can allow someone to easily check your page
on W3Validator**.