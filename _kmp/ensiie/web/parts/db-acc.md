# Create a database account (ENSIIE/PostgreSQL)

[Go back](..)

The goal is to **create a database**, **a new user**, and **grant him permissions**, so that you use this user to access the database, instead of your ENSIIE credentials <small>(You could use the user "tpphp" (password tpphp) instead of doing this, but don't 🙄)</small>.

Connect using SSH to the ENSIIE server. Write the first command to connect using your ENSIIE credentials.

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