# Exploit a Database

<hr class="sl">

## Random

Note: this isn't a course about SQL, but stuff that may be useful to hackers.

<div class="row row-cols-md-2"><div>

* `service xxx status`: check if a service is enabled. 
  * `mysql`
  * `postgresql`
  * `...`
* `mysql -u root -p -h <ip>`: login as root to the database at `<ip>`
  * Use `mysql -u root -p` for a local database.
  * Try an empty password, as this is the default password for root.
</div><div>

Inside the SQL console, you may use

* `source <sql>`: in MySQL console, import a SQL file.

Note that even if you can insert a path, you should start the SQL console inside the folder with the SQL file, and only enter the filename. This is because, if the file is importing data from other files, it less likely to still work if the statements are executed from another folder than the one with the script.

* `DESCRIBE <table>`: see the structure of `<table>`
</div></div>

<hr class="sl">

## SQLMap

<div class="row row-cols-md-2"><div>

From the [SQLMap GitHub Repository](https://github.com/sqlmapproject/sqlmap): "sqlmap is an open source penetration testing tool that automates the process of detecting and exploiting SQL injection flaws and taking over of database servers.".

Try injecting a form

```bash
# try login.php
sqlmap -u URL/login.php
```

Try dumping the table "users" in the database "db_name"

```bash
sqlmap -u UGL/login.php -D db_name -T users –dump
```

Notes

* Try both with, and without union tests
* `XXX xxx is vulnerable`: enter yes to try exploiting this parameter
</div><div>

* `-u URL`: try injecting this URL
* `--dbs`: display all databases
* `--tables`: display tables
* `--column`: display columns
* `-C xx, yy`: display only columns xx, and yy
* `--dbms=some_dbms`: provide dbms, increase the chances of success
* `-D db_name`: the name of the database
* `--time-sec timeout`: specify a timeout
* `--dump`: save current data
* `--dump-all`: save all data
* `--batch`: do all requests at once (do not way for input)

> [SQLMap CheatSheet](https://www.security-sleuth.com/sleuth-blog/2017/1/3/sqlmap-cheat-sheet) (external)
</div></div>