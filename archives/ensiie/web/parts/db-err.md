# Database errors

[Go back](..)

Enabling PDO errors will decrease the time you need for debugging database-related errors. For instance, a lot of persons got a problem with permissions, but they took time before finding that this was the error (because the errors were disabled). I'm advising you to enable them during the development.

```php
$pdo = new PDO("pgsql:dbname=tpphp;host=pgsql2;port=5432", "tpphp", "tpphp", array(
  PDO::ATTR_ERRMODE => PDO::ERRMODE_EXCEPTION
));
```

Sources

* <https://stackoverflow.com/questions/8992795/set-pdo-to-throw-exceptions-by-default>
* <https://www.php.net/manual/en/pdo.error-handling.php#odbc-statistics.example.basic>