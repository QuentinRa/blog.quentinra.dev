# Database Security

...

<hr class="sl">

## SQL injections

![Level: Novice-Intermediate](https://img.shields.io/badge/level-Novice%20Intermediate-ffd700)

SQL injections means for someone to insert some SQL code inside a SQL query. For instance, if a user have a query taking a username, then the user may submit a SQL query rather than his username.

* <i class="bi bi-shield-check text-success"></i> Use prepared requests (or queries), they are ensuring that parameters of your queries are not interpreted as SQL code
* <i class="bi bi-shield-minus text-danger"></i> You can filter input, but you CAN'T rely on it, as you filter will _most likely_ be bypassed
* <i class="bi bi-shield-minus text-danger"></i> **YOU SHOULD NEVER TRUST DATA FROM THE USER** <small>(actually, don't trust anyone)</small>. SQL injections may be delayed. You may do protect your login queries, but if the username is some SQL code, then any other request using the username may interpret it, hence you should secure **every** request.

<details class="details-e">
<summary>Basics of SQL injection</summary>

Let's say someone submitted this request, trying to login without password to the account 'admin'.

```http request
POST /login.php username="admin' --"&password='nopassword'
```

And in the PHP code, we got a super-stupid-and-lazy-not-prepared SQL request like this <small>(assuming that the password is not encrypted in the Database)</small>.

```php
$sql = "Select * from users where user='$username' AND password='$password'";
```

Then, the SQL request will be as follow. This is because the user used a quote (`'`), which closed the input, allowing him to write his own code. As you should notice, the check for the password is bypassed, and the request will return the record for the user "admin".

```sql
Select * from users where user='admin' --' AND password='nopassword';
```
</details>

A hacker that detected a possible way to inject some SQL (delayed or not), in a POST or even a GET form, may use it to map, steal, and/or maybe destroy your database.

* <i class="bi bi-info-square" style="background:#ffd700"></i> You can manually try to map the Database
* <i class="bi bi-info-square" style="background:#ffd700"></i> You can use **SQLMap** to map a Database

There are two kind of SQL injections, either

* <i class="bi bi-info-square" style="background:#7cfc00"></i> you can see errors, or the result of the query, then it's pretty easy to extract information from it.
* <i class="bi bi-info-square" style="background:#ffd700"></i> you can't see errors. Still, you can guess that there was an error if the purpose of the SQL query was not achieved (ex: login). You will have to use a **boolean-based SQL injection**. For instance, if testing that the DBMS is mariadb, if it's not mariadb, you should make the query fail. If the query worked (ex: login successful), then it means that is was mariadb!

<details class="details-e" open>
<summary>Manually map the database</summary><br>

<details class="details-e">
<summary>Database, version, and user</summary>

You need to find the kind of database, the version, the username, the table and its columns, then steal everything.

* `SELECT @@version`: return the database version
* `SELECT database()`: return the name of the database
* `SELECT user()`: return the name of the database

Some boolean-based SQL injections:

* **For any text**: `' AND (ascii(substr((select database()),1,1))) = 115 --`: return true if the first character of the name of the database is "s" (ascii('s') is 115).
</details>

</details>