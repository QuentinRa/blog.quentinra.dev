# Arrays

[Go back](..)

Arrays are rather strange in PHP. You can have
arrays having values of different types...

<div class="sr"></div>

**Creation**

The legacy syntax is ``array`` but now we use `[]`.

```php
// legacy syntax
$a = array(5, "51", null, false);
// new syntax
$a = [ 5, "51", null, false ];
```

<div class="sl"></div>

**Get an element**

Like in many other languages, you are using indexes
to get an element, starting from 0.

```php
// legacy syntax
$a = array(5, "51", null, false);

$five = $a[0]; // 5
```

<div class="sl"></div>

**Methods**

You might like 

* ``count($array)``: get the number of elements
* ``is_array($array)``: check if it's an array
* and don't forget isset if you are not sure
that some index exists.

