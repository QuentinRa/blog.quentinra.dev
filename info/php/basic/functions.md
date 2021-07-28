# Functions

[Go back](..)

You will use the keyword ``function``.

* you can give default parameters
* you can or not specify a return type
* you can or not specify arguments types
* you can or not add implicit arguments
* you can add default values for parameters
* you can create anonymous functions (without a name)

By default, variables used and not declared
inside a function must be either a parameter or 
global variables.

<hr class="sr">

**Simple function**

```php
<?php
function my_function($param1, $param2=5) {
    // ... code ...
}

function complex_function($param1, &$param2, $param3=5) {
    // ... code ...
}
```

Parameters are passed by value in PHP.

In ``complex_function``, `&$param2` means that
param2 is passed by address. In most
cases, you won't use that if you are doing
some client-server PHP.

<hr class="sr">

**Simple function with return**

Simply use the return keyword.

```php
<?php
// return something
function my_function() { return 5; }
```

<hr class="sl">

**Adding types**

If you know what are the types of an argument or
the return type, then since PHP7 you can add it.

```php
<?php
// return something
function my_function(xxx $arg) : xxx { return /* ... */; }
```

xxx would be

* ``?`` if NULL is accepted
* the type
* or the types, separated by a ``|`` (only in PHP >= 8)

Giving us

```php
<?php
// return something
function float_or_int(bool $bool) : ?int { 
    return $bool ? 5 : null;
}
```

<hr class="sr">

**Using non-global variables**

You can use block-level variables inside
a function. You would use that If you are forced to
write a function taking only one argument but you
want your function to use more than one.

(Such a function is usually a callback, a function
called by another function when a job is done)

```php
<?php
$a = 10;

// this will fails, a is not defined
function () { 
    echo $a;
}

// and this will work, since we are using
// the value of the the block-level variable "$a"
function () use ($a) {
    echo $a;
}
```