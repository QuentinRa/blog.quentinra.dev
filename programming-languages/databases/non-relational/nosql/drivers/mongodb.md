# MongoDB

```php
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