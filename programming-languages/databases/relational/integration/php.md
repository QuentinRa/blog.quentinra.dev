# SQL in PHP

<div class="row row-cols-md-2"><div>

To integrate a SQL database in a PHP application, you can use **PDO** to write code regardless of the RDBMS, **or use specific function** for each RDBMS such as `mysqli_*` for MariaDB/MySQL.

⚠️ SQL queries are vulnerable to [SQL injections](/cybersecurity/red-team/s3.exploitation/vulns/injection/sql.md). **Always** use prepared statements to avoid them.
</div><div>
</div></div>

<hr class="sep-both">

## Using PDO

<div class="row row-cols-md-2"><div>

```php!
$db = new PDO("mysql:host=nom_host;charset=UTF8;dbname=db_name", "user","password");
$res = $db->query("SELECT * FROM USER");
$result = $res->fetchAll();
```
</div><div>

Instead of `query(...)` use `prepare()` for prepared statements:

```php!
$stmt = $db->prepare("[...] WHERE user=:user AND password=:password;");
// safely pass parameters
$stmt->bindValue(':user' , "some_username", PDO::PARAM_STR);
$stmt->bindValue(':password', "some_password" , PDO::PARAM_STR);
$stmt->execute();
```

</div></div>

<hr class="sr">

## Mariadb / MySQL

<div class="row row-cols-md-2"><div>

You will use [mysqli](https://www.php.net/manual/en/book.mysqli.php) functions.

```php!
// connect
$connexion = mysqli_connect("host","user","passwd","db_name");
// make a request
$res = mysqli_query($connexion, "SELECT * FROM USER");

// iterate results
// you could use foreach
while($row = mysqli_fetch_assoc($res)){
    // one row per one row
}

// close
mysqli_close($connexion);
```
</div><div>

There are some functions you may use:

```php!
$nr = mysqli_num_rows($res);
$id = mysqli_insert_id($connexion);
$sql_request = addslashes($sql_request);
$sql_request = mysqli_escape_string($connexion, $sql_request);
```

Instead of `mysqli_query(...)` use `mysqli_prepare()` for prepared statements. Inside the query, use `?` for parameters.

```php!
$stmt = mysqli_prepare($connexion, "[...] WHERE user=? AND password=?;");
// safely pass parameters
mysqli_stmt_bind_param($stmt, "ss", array("some_username", "some_password"));
mysqli_stmt_execute($stmt);
$res = mysqli_stmt_get_result($stmt);
```

👉 The code is similar to the one for PDO. The second argument of bind_param is the type of each argument <small>(`s`=string)</small>.
</div></div>