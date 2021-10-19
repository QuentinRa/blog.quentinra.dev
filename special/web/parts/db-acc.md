# Create a database account (ENSIIE/PostgreSQL)

[Go back](..)

The goal is to **create a database**, **a new user**, and **grant him permissions**, so that you use this user to access the database, instead of your ENSIIE credentials <small>(You could use the user "tpphp" (password tpphp) instead of doing this, but don't 🙄)</small>.

Connect using SSH to the ENSIIE server. Write the first command to connect using your ENSIIE credentials.

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

This will create a new user with a password, and grant him/her permissions on the database you created.

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