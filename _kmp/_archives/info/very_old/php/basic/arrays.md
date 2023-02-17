# Arrays

[Go back](..)

Arrays are rather strange in PHP. You can have
arrays having values of different types...

<hr class="sr">

**Creation**

The legacy syntax is ``array`` but now we use `[]`.

```php
// legacy syntax
$a = array(5, "51", null, false);
// new syntax
$a = [ 5, "51", null, false ];
```

<hr class="sl">

**Get an element**

Like in many other languages, you are using indexes
to get an element, starting from 0.

```php
// legacy syntax
$a = array(5, "51", null, false);

$five = $a[0]; // 5
```

<hr class="sl">

**Methods**

You might like 

* ``count($array)``: get the number of elements
* ``is_array($array)``: check if it's an array
* and don't forget isset if you are not sure
that some index exists.

<hr class="sl">

**Named indexes**

Some indexes of your array might have a name, all if you want.
Note that by default, the indexes of your array
are 0,1,... And these will be used not already
on unnamed indexes.

```php
$user = array("user" => "calistro", "password" => "", "id" => 42, 13, 2 => "premier");
echo $user["user"]; // calistro
echo $user["id"]; // 42
echo $user[0]; // print 13
echo $user[1]; // error : not defined
echo $user[2]; // print "premier"

// notice that we are not using ""
echo "Mon nom est $user[user] !";
var_dump($user);
```

<hr class="sl">

**foreach**

Finally, I can add this new statement: ``foreach``
(you have a `foreach(...): /* code */ endforeach; ` too).

```php
$tab = [5, 6, 7];

// first version, without asking indexes
foreach ($tab as $value) {
    // $value will be 5 then 6 then 7
}

$user = array("user" => "calistro", 13, 2 => "premier");
foreach ($user as $key => $value) {
    // $key will be "user" then 0 then 2
    // $value will be "calistro" then 13 then "premier"
}
```