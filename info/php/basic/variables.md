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

You can call a variable from a string like that

```php
<?php
// get n variable value
$five = ${"n"};
```