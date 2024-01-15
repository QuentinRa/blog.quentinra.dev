# SQL in PHP

<div class="row row-cols-lg-2"><div>

To integrate a SQL database in a PHP application, you can use **PDO** to write code regardless of the RDBMS, **or use a specific function** for each RDBMS such as `mysqli_*` for MariaDB/MySQL.

⚠️ SQL queries are vulnerable to [SQL injections](/cybersecurity/red-team/s3.exploitation/vulns/injection/sqli.md). **Always** use prepared statements to avoid them.
</div><div>
</div></div>

<hr class="sep-both">

## Using PDO

<div class="row row-cols-lg-2"><div>

```php!
$db = new PDO("dbms_name:host=hostname;charset=UTF8;dbname=db_name", "user","password");
$res = $db->query("SELECT * FROM USER");
$result = $res->fetchAll();
```

➡️ DBMS names could be `mysql`, `pgsql`... 

If you are having a hard time debugging errors, you can enable PDO exceptions by adding a 4th argument:

```php!
$pdo = new PDO(..., [PDO::ATTR_ERRMODE => PDO::ERRMODE_EXCEPTION]);
```

➡️ Edit: this is now the default mode since PHP 8.0.
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

## MariaDB / MySQL

<div class="row row-cols-lg-2"><div>

You will use [mysqli](https://www.php.net/manual/en/book.mysqli.php) functions. To create a non-prepared statement:

```php!
// connect
$connexion = mysqli_connect("host","user","passwd","db_name");
// execute and get the result
$res = mysqli_query($connexion, "SELECT * FROM USER");
```

OR to create a prepared statement, using `?` for parameters:

```php!
$stmt = mysqli_prepare($connexion, "[...] WHERE user=? AND password=?;");
// safely pass parameters
mysqli_stmt_bind_param($stmt, "ss", array("some_username", "some_password"));
// execute
mysqli_stmt_execute($stmt);
// get the result
$res = mysqli_stmt_get_result($stmt);
```

👉 The code is similar to the one for PDO. The second argument of bind_param is the type of each argument <small>(`s`=string)</small>.
</div><div>

To exploit the results:

```
// 1️⃣ if there is only one line
$row = $res->fetch_assoc() ?? null;

// 2️⃣ otherwise, iterate results
while($row = mysqli_fetch_assoc($res)){}

// close
mysqli_close($connexion);
```

There are some functions you may use:

```php!
$nr = mysqli_num_rows($res);
$id = mysqli_insert_id($connexion);
$sql_request = addslashes($sql_request);
$sql_request = mysqli_escape_string($connexion, $sql_request);
```
</div></div>