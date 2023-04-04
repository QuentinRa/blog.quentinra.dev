# MongoDB

[Go back](../../../../../_kmp/_archives/info/very_old/php)

Here we are considering that you read the NoSQL
database so you know

* what are NoSQL databases
* what's MongoDB

And that you trying to learn how you could call your
MongoDB database in PHP.

<hr class="sr">

## Installation

**On Windows, you should**

* read the official tutorial [here](https://www.php.net/manual/en/mongodb.installation.windows.php)
* on this [page](https://pecl.php.net/package/mongodb)
    * find the line of the version you want like ``1.9.1``
    * click on the DDL icon
    * find the block with your phpversion
      * Wamp, http://localhost, 3rd line
      * or create a php script and call phpinfo() function
    * find your ThreadSafe property (TS)
      * Wamp, http://localhost/?phpinfo=-1
      * or phpinfo()
      * and look for ``Thread Safety`` value
    * download your version according to TS value
* you should have a ``php_mongodb.dll`` file
* on Wamp
  * find your php folder inside this folder ``C:\wamp64\bin\php``
  * inside, paste the ddl file in ``ext/``
  * edit php.ini, add `extension=mongodb.dll` or ``extension=mongodb`` (this is working too)
  * you may restart your server (recommended by me)
* you should see your extension on ``http://localhost/``, "mongodb"
* if not, what I had to do was
  * right-click on wamp
  * tools
  * change php cli version
  * and set it to the right php version

**On Linux, you should**

* look [at the tutorial here](https://www.php.net/manual/en/mongodb.installation.pecl.php)
* install pecl : `sudo apt-get update` and `sudo apt-get install php-dev php-pear`
* run ``sudo pecl install mongodb`` (or `sudo pecl install mongodb-1.9.1` for version 1.9.1)
* you can uninstall a version with ``sudo pecl uninstall mongodb`` if needed
* on debian, you should **not** edit php.ini
  * replace v.v by your version ``sudo nano /etc/php/v.v/mods-available/mongodb.ini``
  * ``php -ini | head`` if you don't know
  * add ``extension=mongodb.so``
  * enable ``sudo phpenmod mongodb``
  * restart ``sudo systemctl restart apache2``
* otherwise edit ``php.ini`` and add ``extension=mongodb.so``
  * ``php -ini | head`` if you don't know where your .ini is
  * restart ``sudo systemctl restart apache2``

**Final part**

Then in your project, use composer

```bash
composer require mongodb/mongodb
```

Then try a script like this

```php
<?php
require 'vendor/autoload.php';
// use MongoDB\Client;

$client = new MongoDB\Client('url');
$db = $client->db_name;
```

<hr class="sl">

## Login

You may pass your username / password (if you have one)
inside the URL but you may also use an array

```php
<?php
use MongoDB\Client;

$client = new MongoDB\Client('url', [
    'username' => "",
    'password' => ""
]);
$db = $client->db_name;
```

<hr class="sr">

## Some notes

You should look at the documentation 
[here](https://docs.mongodb.com/php-library/current/tutorial/)
because it readable but I gathered a lot
of things that I used but were not easy
to find (at least for me)

```php
// connect
$client = new Client('mongodb://localhost:27017');

// use db_name
// call methods on "collection_name"
$collection = $client->{'db_name'}->collection_name;
// that's the same
$collection = $client->{'db_name'}->{'collection_name'};
// same too
$collection = $client->db_name->collection_name;

// select name, age, email
// from db_name.collection_name
// where name="..."
$result = $collection->findOne(
    [ 'name' => "..."  ],
    [
        'projection' => [
          'name' => 1,
          'age' => 1,
          'email' => 1
        ]
    ]
);
// select * 
$result = $collection->findOne([ 'name' => "..."  ]);

if ($result === null) {
    // not found
}

// all those that have a property called name
$result = $collection
        ->find([ 'name' => array('$exists' => true) ])
        // you shouldn't do that if you have a lot
        // of results and properly iterate the cursor
        // unless you are planning to iterate everything
        ->toArray()
;

foreach ($result as $r){
    // ...
}

$result = $collection->updateOne(
    [ 'attribute' => "value"  ],
    [
        // change value
        '$set' => [ 'attribute' => "new_value"],
        // OR / AND you can unset an attribute
        '$unset' => ['attribute2' => true],
    ]
);
// some methods
$r = $result->getModifiedCount();
$r = $result->getMatchedCount();
```

<hr class="sl">

## Sources

* <https://docs.mongodb.com/php-library/current/tutorial/>
* <https://stackoverflow.com/questions/30781476/how-to-unset-a-field-from-all-documents-with-php-mongo-adapter>
* sudo apt install php7.4-mongodb