# Structures

[Go back](..)

**if**

```php
<?php
if ($condition) { /* code */ }
elseif ($condition) { /* code */ }
else { /* code */ }
```

Or this alternate form

```php
<?php
if ($condition):
?>
<!-- some html code only shown when condition is true -->
<?php
endif;
?>
```

<hr class="sr">

## Loops

You may use

* ``continue;`` to go  to the next loop turn
* ``break;`` to exit a loop

```php
<?php
// for
for ($i = 0; $i < 10; $i++) { /* code */ }
for ($i = 0; $i < 10; $i++): /* code */ endfor;

// while
while ($condition){ /* code */ }
while ($condition): endwhile;

// do while
do { /* code */ } while ($condition);
?>
```

<hr class="sr">

## Switch

Some switch case statement, executing some
code according to the value of the variable.

```php
switch ($number){
    case 0: /* code */ break;
    case 1: /* code */ break;
    case 2: case 3:
        /* code for two and three */
        break;
    default: /* code */ break;
}

switch ($number): /* code */ endswitch;
```