# MySQL 🍃

[![footprinting](../../../../cybersecurity/_badges/htb/footprinting.svg)](https://academy.hackthebox.com/course/preview/footprinting)
[![attacking_common_services](../../../../cybersecurity/_badges/htb/attacking_common_services.svg)](https://academy.hackthebox.com/course/preview/attacking-common-services)
[![wordpresscve202129447](../../../../cybersecurity/_badges/thm-p/wordpresscve202129447.svg)](https://tryhackme.com/r/room/wordpresscve202129447)
[![devvortex](../../../../cybersecurity/_badges/htb-p/devvortex.svg)](https://app.hackthebox.com/machines/Devvortex)

<div class="row row-cols-lg-2"><div>

[MySQL](https://github.com/mysql) is an open-source relational database management system. It was acquired by Oracle. There is a well-known fork called [MariaDB](mariadb.md).

🐲 MySQL (and MariaDB) default port is 3306.

```shell!
$ sudo apt install default-mysql-client
```

By default, there is no password for root <small>(blank ☠️)</small>.

```ps
$ mysql -u root -p                          # connect
$ mysql -u <username> -p -h <ip> -P <port>  # same
$ mysql -u root -p db_name < xxx.sql        # import sql
$ mysql -u root -ppassword                  # no space
```
</div><div>

Some commands:

```sql!
source xxx.sql;                -- import
DESCRIBE table_name;           -- definition of a table
SELECT VERSION();              -- version
SELECT database();             -- show current database
SHOW DATABASES;                -- list databases
USE a_database;                -- select one
SHOW TABLES;                   -- list tables
```

MySQL store structural data in `information_schema`:

* Tables: `SELECT table_name FROM information_schema.tables WHERE TABLE_SCHEMA='db_name';`
* Columns: `SELECT column_name FROM information_schema.columns WHERE TABLE_SCHEMA='db_name' AND TABLE_NAME='table_name';`
* Users: `SELECT CONCAT(user, '%', host) as 'username', authentication_string FROM mysql.user;`
* Privileges: `Select privilege_type From information_schema.user_privileges Where GRANTEE = CURRENT_USER();`
</div></div>

<hr class="sep-both">

## 👻 To-do 👻

Stuff that I found, but never read/used yet.

<div class="row row-cols-lg-2"><div>

* `service mysql status`: check if service started
* nmap `mysql-*`
* MySQL Workbench
</div><div>

MySQL custom commands

* `select * from mysql.func` (if empty no user defined functions)
* `sys_exec` function
* `select @@plugin_dir;` (if writable, we may inject a shellcode)
* mysql exploitdb UDF exploit
</div></div>