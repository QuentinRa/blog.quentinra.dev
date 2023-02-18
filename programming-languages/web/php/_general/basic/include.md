# Include/Require

[Go back](../../../../../_kmp/_archives/info/very_old/php)

You will split your code into different files. You
can import or require them according to your preference.

* include: if the include fails, continue
* require: if the include fails, crash with an error

Most of the times, you will use ``include_once``
or ``require_once`` to prevent a file to be included/required
again.

```php
// examples
include "test.php";
include_once "test.php";
require "test.php";
require_once "test.php";
```