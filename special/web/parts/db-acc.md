# Create a database account

[Go back](..)

You should create a new DB account. You will have to log in using your **ENSIIE** credentials to the ``pgsql`` host. Simply do 

```bash
# your_login_ensiie = name if your email is name@ensiie.fr
psql -h pgsql -U your_login_ensiie
# create a database (replace a_database_name)
CREATE DATABASE a_database_name;
# exit
# ...
# log in again (replace a_database_name)
psql -h pgsql -U your_ensiie_login -d a_database_name
```

Copy this code, BUT replace

* ``username`` by the new user username (0/3)
* ``a_password`` by the new user password (0/1)

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