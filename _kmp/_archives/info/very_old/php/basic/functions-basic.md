# Basic functions

[Go back](..)

Finally, here you will learn most of the functions
you will use.

**echo**

Write the text in an argument into the HTML.

```php
echo "Hello World!";
```

<hr class="sr">

**var_dump**

Print a lot of information about a variable
into the HTML (used for debugging).

```php
$a = "15";
var_dump($a);
```

<hr class="sr">

**define**

Create a constant. Constants are called without
a ``$``.

```php
define("MY_CONSTANT", 5);
echo MY_CONSTANT; // 5
```

Note that nowadays, we are not using define anymore.

```php
const MY_CONSTANT = 5;
echo MY_CONSTANT; // 5
```

<hr class="sr">

**redirection**

No, the function redirect is not the one. You must
use this.

```php
header("Location: path");
exit();
```

Do not forget to exit! And valid path would be like
``index.php`` so nothing complicated.

<hr class="sr">

**isset? or empty ?**

You can ask PHP to check if a variable is set 
or empty.

* ``isset``: true if variable exists
* ``unset``: destroy variable
* ``empty``: true if variable is empty (or the variable is not set)

```php
$a_bool = true;

// true
echo isset($a_bool);
// destroy variable
unset($a_bool);
// false
echo isset($a_bool);
// true
echo empty("");
echo empty($a_bool); // not set so it's empty
// false
echo empty("not empty");
```