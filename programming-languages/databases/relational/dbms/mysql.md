# MySQL 🍃

<div class="row row-cols-lg-2"><div>

If the service is started (`service mysql status`), log in using:

```ps
# requirement: sudo apt install default-mysql-client
$ mysql -u <username> -p -h <ip> -P <port>
$ mysql -u root -p
> source xxx.sql;                # import
> DESCRIBE table_name;           # definition of a table
> SELECT VERSION();              # version
> SELECT database();             # show current database
> SHOW DATABASES;                # list databases
> USE a_database;                # select one
$ mysql -u root -p db < xxx.sql  # import
```

☠️ By default, there is no password for root (blank).

🐲 MySQL/MariaDB default port is 3306.
</div><div>

#### MySQL or PostgreSQL

**MySQL**/**PostgreSQL** store structural data in `information_schema`:

* Tables: `SELECT table_name FROM information_schema.tables WHERE TABLE_SCHEMA='a_db';`
* Columns: `SELECT column_name FROM information_schema.columns WHERE TABLE_SCHEMA='a_db' AND TABLE_NAME='a_table';`
</div></div>