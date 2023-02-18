# SQL

[Go back](../../../../../_kmp/_archives/info/very_old/php)

In most cases, you should use PDO to handle database requests
since that's not something dependant on your database manager 
(MariaDB, Postgres, ...).

```php
<?php
$db = new PDO("mysql:host=nom_host;charset=UTF8;dbname=nom_base", "user","password");
$res = $db->query("sql query");
$result = $res->fetchAll();
```

<hr class="sr">

## Mariadb / MySQL

You will use functions starting with ``my_sqli``.
[Read the doc](https://www.php.net/manual/en/book.mysqli.php).

```php
<?php
// connect
$connexion = mysqli_connect("host","user","passwd","db_name");
// make a request
$res = mysqli_query($connexion, "ordre SQL");

// iterate results
// you could use foreach
while($row = mysqli_fetch_assoc($res)){
 // one row per one row
}
// close
mysqli_close($connexion);
```

You might use

```php
$nr = mysqli_num_rows($res);
$id = mysqli_insert_id($connexion);
// add \ before '
$code_sql = addslashes($code_sql);
// or you may use
$code_sql = mysqli_escape_string($connexion, $code_sql);
```

<hr class="sr">

## SQL INJECTIONS

Okay, **SQL INJECTIONS** is something quite important. Let's says
some write in a field username `root' OR 0=0 -- c`
and password ``a_fake_password``.

When you made a SQL request, you may
have done
```php
$username = "root' OR 0=0; -- c";
$password = "a_fake_password";
$request = "Select * FROM users Where username='$username' AND password='$password'";
```
and if you did, replace username by the value
above

```sql
Select * FROM users Where username='root' OR 0=0; -- c' AND password='$password';
```

Are you seeing the bypass? ``0=0`` is true and the `'` make the request end
meaning that we added some code into the SQL request. The OR makes it like
we could log in without a password since the password check is commented and
we set ``condition OR true`` so the where is always `true`.

The ONLY reliable way to patch this is to do **PREPARED STATEMENTS**.

Instead of writing
```php
$request = "Select * FROM users Where username='$username' AND password='$password'";
```
you will write
```php
$request = "Select * FROM users Where username=? AND password=?";
```
Then you will "bind"=associate a value with each ``?``.

<hr class="sr">

## Prepared statements in PDO

```php
$user = "user"; $pwd = "pass"; // fake
$db = new PDO("mysql:host=nom_host;charset=UTF8;dbname=nom_base", "user","password");
$res = $db->query("sql query");
$result = $res->fetchAll();
$stmt = $db->prepare("... WHERE user = :user AND password = :password;");
$stmt->bindValue(':user' , $user, PDO::PARAM_STR);
$stmt->bindValue(':password', $pwd , PDO::PARAM_STR);
$stmt->execute();
// results
$all = $stmt->fetchAll();
```

<hr class="sr">

## Prepared statements in MariaDB

```php
<?php
// connect
$connexion = mysqli_connect("host","user","passwd","db_name");
// request
$stmt = mysqli_prepare($connexion, "SQL REQUEST");
// bind ?
// types are i, d, s, ...
// sss means 3 strings so the array must
// contains 3 strings replacing 3 ???
mysqli_stmt_bind_param($stmt, "sss", array($value, $value, ...));
// execute
mysqli_stmt_execute($stmt);
// read result
while($row =mysqli_fetch_assoc(mysqli_stmt_get_result($stmt))){ // on peut faire un foreach
    // ...
}
// close
mysqli_close($connexion);
```