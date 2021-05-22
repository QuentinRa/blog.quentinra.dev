# Web

Your websites will be accessible
with a url like this ``http://pgsql.pedago.ensiie.fr/~prenom.nom/``.

```php
<?php

error_reporting(E_ALL);
ini_set("display_errors", 1);

$c = new PDO("pgsql:dbname=tpphp;host=pgsql2;port=5432", "tpphp", "tpphp");
```