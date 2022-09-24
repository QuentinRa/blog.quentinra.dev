# Database Security

...

<hr class="sl">

## SQL injections

SQL injections means for someone to insert some SQL code inside a SQL query. For instance, if a user have a query taking a username, then the user may submit a SQL query rather than his username.

* <i class="bi bi-shield-check text-success"></i> Use prepared requests (or queries), they are ensuring that parameters of your queries are not interpreted as SQL code
* <i class="bi bi-shield-minus text-danger"></i> You can filter input, but you CAN'T rely on it, as you filter will _most likely_ be bypassed
* <i class="bi bi-shield-minus text-danger"></i> **YOU CAN NEVER TRUST DATA FROM THE USER** <small>(actually, don't trust anyone)</small>. SQL injections may be delayed. You may do protect your login queries, but if the username is some SQL code, then any other request using the username may interpret it, hence you should secure **every** request.

<details class="details-e">
<summary>Basics of SQL injection</summary>

Let's say someone submitted this request, trying to login without password to the account 'admin'.

```http request
POST /login.php username="admin'-- -"&password='nopassword'
```

And in the PHP code, we got a super-stupid-and-lazy-not-prepared SQL request like this <small>(assuming that the password is not encrypted in the Database)</small>.

```php
$sql = "Select * from users where user='$username' AND password='$password'";
```

Then, the SQL request will be as follow. As you should notice, the check for the password is bypassed, and the request will return the record for the user "admin".

```sql
Select * from users where user='admin' -- -' AND password='nopassword';
```

> We are adding `--` to comment the rest of the original request. We especially ensure that there is a space after the start of the comment with `-- -`, because some DBMS may deem the request as invalid if there is no space after the start of a comment.
</details>