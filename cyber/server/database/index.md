# Exploit a Database

[![sqlinjectionlm](../../_badges/sqlinjectionlm.svg)](https://tryhackme.com/room/sqlinjectionlm)

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

## SQL Injections (SQLi)

<div class="row row-cols-md-2"><div>

Most websites are using SQL database to store records. For instance, when using a login form, the username will most likely be used to fetch a user, then there will be a check of the password.

In some cases, SQL injections are possible. It means that instead of providing our username, we will provide some SQL code that will be injected in the SQL request, and allow a hacker to access the database via the login form.

**Example of injectable PHP code**: this code is fetching a list of products matching the product name send by the client.

```php
$sql = "Select name,desc from product where name LIKE '%$name%'";
```

If the user enter the following payload (value) instead of a product name

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

## SQLInjections in practice

<div class="row row-cols-md-2"><div>

There are many scenarios in which a hacker will find a SQL injection. The example above was a **Union-based SQLi**.


<table class="table table-bordered table-striped border-dark"><thead>
<tr><th>Name</th><th>Description</th></tr>
</thead><tbody>

<tr><td class="text-center" colspan="2"><b>In-band SQLi</b> (same channel to attack, and gather results)</td></tr>

<tr><td>Error-based</td><td>The simplest SQL injection. The SQL errors are displayed to the user. The hacker can easily use it to adapt the query, and broke into the database.
</td></tr>

<tr><td>Union-based</td><td>An attacker use an injectable entrypoint returning a list of results, and append to them records fetched illegally.
</td></tr>

<tr><td class="text-center" colspan="2"><b>Blind/inferential SQLi</b> (observe the database response to map it)</td></tr>

<tr><td>Boolean-based</td><td>The attack will first look for a successful injectable query. Then, it will append to the working query a condition such as  "AND is the DBMS starting with 's'". If the query is successful, then it means the answer was "yes". Question by question, the hacker is mapping the database.
</td></tr>

<tr><td>Time-based</td><td>The attack add in the request a call to <code>sleep(n)</code> if successful. If the request take $n$ seconds more than usual, then the hacker will know that the query was successful.</td></tr>

<tr><td>Others</td><td>Out-of-band-based, Voice-based, Stacked queries-based...
</td></tr>
</tbody></table>
</div><div>

**Payloads** are the values that you are using the break into the database.

* [sql-injection-payload-list](https://github.com/payloadbox/sql-injection-payload-list) (2.6k ⭐)
* [PayloadsAllTheThings/SQL Injection](https://github.com/swisskyrepo/PayloadsAllTheThings/tree/master/SQL%20Injection) (42.3k ⭐)
* Tools, such as SQLMap (25k ⭐)

Mitigations

* Use **prepared requests** (statements), they are ensuring that parameters of your queries are not interpreted as SQL code
* Input validation or escaping user input: You can filter input, but you CAN'T rely on it, as you filter will _most likely_ be bypassed
* Do not trust anyone. SQL injections may be delayed. You may do protect your login queries, but if the provided username is some SQL code, then any other request using the username may interpret it, hence you should secure every request, even if there are not handling data from the user, as they may later. You should use an API for better security.
</div></div>

<hr class="sr">

## SQLMap

<div class="row row-cols-md-2"><div>

From the [SQLMap GitHub Repository](https://github.com/sqlmapproject/sqlmap) (25k ⭐): "sqlmap is an open source penetration testing tool that automates the process of detecting and exploiting SQL injection flaws and taking over of database servers.".

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

> You can use **BurpSuite** with SQLMap. Once you intercepted a request, right-click on it, and use **Save item**. Then, in SQLMap, use `-r /path/to/your/saved/item`. If your antivirus is blocking SQLMap, this may bypass it.

<hr class="sl">

## Famous payloads

<div class="row row-cols-md-2"><div>

Testing if a SQL injection is possible. If it "works", it means that we will have "3 quotes" in the SQL query, so there will be an error.

```none
'
```
</div><div>

Login without password on a website that do password check in an injectable query. The `1=1` is, like `-- -`, something to support some DBMS that are not allowing "1", or "TRUE".

```none
' OR 1=1 -- -
```
</div></div>