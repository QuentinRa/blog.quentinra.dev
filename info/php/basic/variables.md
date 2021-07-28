# Variables

[Go back](..)

A variable starts with ```$``` like `$my_variable`.
Types are implicit but you can write

```php
<?php
$n = 5; // int
$n = 5.0; // float

$n = "5"; // string
$n = '5'; // string

$n = NULL; // null
$n = null; // null too

$n = true; // true
$n = false; // false
```

Note these two functions

* ``gettype``: returns the type of a variable
* ``is_int``: check the type of a variable
  (here int but you got a bunch of functions like this)

<hr class="sr">

## String specific knowledge

You're gonna use strings a lot since you are gonna echo
a lot. So remember these tips

```php
$number = 5; // int

// "This is 5"
// variable inside string
echo "This is $number";

// without }, the variable would be $numberb
// "This is a5b"
echo "This is a{$number}b"; 

// concatenation
echo "This is ".$number;

// calling variable with name as a string
echo "This is ${"number"}";

// It seems not useful but you can do that too
// (like in Shell)
echo "This is ${number}";
```