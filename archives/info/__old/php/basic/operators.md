# Operators

[Go back](..)

**Usual operators**

* operation: ``+``, ``-``, ``*``, ``/``
* operation+assignation: ``+=``, ``-=``, ``*=``, ``/=``
* compare:``>``, ``>=``, ``<=``, ``<``
* booleans: ``&&``, `||`, `!` (not)
* booleans: `and`, `or` (use &&/|| instead, because theses do not have the same priority)

<hr class="sr">

**others**

* ``**`` (power)
* ``%`` (mod)
* ``^`` (xor)
* ``.`` (concatenation)
* ``=`` (assign)

<hr class="sr">

**To test equality/difference**

* (strict, type matters) : ``===`` or `!==`
* (non strict) : ``==`` or `!=`/`<>`

> Note that this statement ``0 == 'true' && 0 == 'false'``
> is **TRUE** in PHP so use strict equality if you don't
> know what to use.

<hr class="sr">

**Create if not exists**

You can use ``??`` to create a variable that is not set.

```php
// if b exists, then a=b, else a=0
$a = $b ?? 0;
```
