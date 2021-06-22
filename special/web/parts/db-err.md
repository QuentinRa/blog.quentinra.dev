## Database errors

[Go back](..)

You should enable errors for developing purposes if not done.

* <https://stackoverflow.com/questions/8992795/set-pdo-to-throw-exceptions-by-default>
* <https://www.php.net/manual/en/pdo.error-handling.php#odbc-statistics.example.basic>

```php
$pdo = new PDO("pgsql:dbname=tpphp;host=pgsql2;port=5432", "tpphp", "tpphp", array(
  PDO::ATTR_ERRMODE => PDO::ERRMODE_EXCEPTION
));
```