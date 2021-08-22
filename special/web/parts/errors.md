# Enable errors

[Go back](..#error-500-internal-server-error)

To enable errors, simply write these lines at the beginning of your code <span class="tms">(not necessarily at the beginning, but make sure that this code is executed before the errors happen)</span>.

```php
<?php

error_reporting(E_ALL);
ini_set("display_errors", 1);
```
