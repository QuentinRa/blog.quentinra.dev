# Create a database account

[Go back](..)

You should create a new DB account. You will have to log in
using your **ENSIIE** credentials to ``pgsql`` host. 
Simply do 
``psql -h pgsql -U your_ensiie_login``.

Create a database ```CREATE DATABASE a_database_name;```.

Exit and log in again
``psql -h pgsql -U your_ensiie_login -d a_database_name``.

Copy this code, replace

* ``username`` by the new user username (0/3)
* ``a_password`` by the user password (0/1)

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