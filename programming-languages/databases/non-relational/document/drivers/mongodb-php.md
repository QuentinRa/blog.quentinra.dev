# MongoDB - PHP Driver

<div class="row row-cols-md-2"><div>

This section is about using [MongoDB](../mongodb.md) in [PHP](/programming-languages/web/php/_general/index.md).

First, you have to install the PHP extension.

<details class="details-n">
<summary>Linux</summary>

You may [follow this tutorial](https://www.php.net/manual/en/mongodb.installation.pecl.php) or [the documentation](https://www.mongodb.com/docs/drivers/php/).

```bash!
$ sudo apt-get update
$ sudo apt-get install php-dev php-pear
$ sudo pecl install mongodb # add -version if needed
$ # sudo pecl uninstall mongodb # if needed
```

On Debian, **do not** edit `php.ini`.

```bash!
$ sudo nano /etc/php/x.x/mods-available/mongodb.ini
extension=mongodb.so
$ sudo phpenmod mongodb
$ sudo systemctl restart apache2 # Apache
```

To test 👻: `sudo apt install php7.4-mongodb`.
</details>

<details class="details-n">
<summary>Windows</summary>

You may [follow this tutorial](https://www.php.net/manual/en/mongodb.installation.windows.php).

First, you have to find if your webserver is thread-safe (TS) or not. Use `phpinfo()` and search for `Thread Safety`.

```bash!
# 1.13.0 == MongDB version
# 7.4 == PHP version
# ts == thread-safe, nts == not thread-safe
$ wget https://windows.php.net/downloads/pecl/releases/mongodb/1.13.0/php_mongodb-1.13.0-7.4-ts-vc15-x64.zip
$ unzip php_mongodb-1.13.0-7.4-ts-vc15-x64.zip
$ mv "php_mongodb.dll" "C:\wamp64\bin\php\ext\"
```

Edit `php.ini` and add `extension=mongodb.dll` or `extension=mongodb`. Restart your server. 

You should see mongodb in the extension list shown by `phpinfo()`.
</details>

Then, you install it using [composer](/programming-languages/web/php/composer/index.md):

```bash
composer require mongodb/mongodb
```
</div><div>

A simple starter script with no framework:

```php
<?php
require 'vendor/autoload.php'; // composer autoloader

$client = new MongoDB\Client('mongodb://xxx');
// or
$client = new MongoDB\Client('mongodb://xxx', [
    'username' => "",
    'password' => ""
]);
```

Refer to the [documentation](https://www.mongodb.com/docs/php-library/current/tutorial/).
</div></div>

<hr class="sep-both">

## Examples

<div class="row row-cols-md-2 mt-3"><div>

#### Get a database

```php!
$db = $client->db_name;
$db = $client->{'db_name'};
```

<br>

#### Get a collection

```php!
$collection = $db->collection_name;
$collection = $db->{'collection_name'};
```

<br>

#### Update a document

```php!
$result = $collection->updateOne(
    [ 'attribute' => "value"  ],
    [
        '$set' => [ 'attribute' => "new_value"],
        '$unset' => ['attribute2' => true],
    ]
);
$r = $result->getModifiedCount();
$r = $result->getMatchedCount();
```

</div><div>

#### Find documents

```php!
$result = $collection->find(...)->toArray()
foreach ($result as $r){
    // ...
}

$result = $collection->findOne(...);
if ($result === null) {
    // not found
}
```

Some examples of values for parameters:

```php!
$filter = [ 'name' => "..."  ];
$filter = [ 'name' => ['$exists' => true]  ];

$projection =
    [
        'projection' => [
          'name' => true,
          'age' => true,
          'email' => true
        ]
    ]
;
```
</div></div>