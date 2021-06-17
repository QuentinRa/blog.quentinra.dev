# Sessions

[Go back](..)

You will use ``$_SESSION`` variable.
First start sessions handling using
``session_start();``.

Then you can save some data that will be shared
in all pages of your website like this

```php
// after a login form for instance
$_SESSION['is_logged'] = 'root';

// then later you could do
if ($_SESSION['is_logged']){
    // ...
}
// note that above it's a shortcut for isset like
if (isset($_SESSION['is_logged'])){ /* ... */ }
```

You may destroy a ``$_SESSION`` using `session_destroy`

```php
# one by one
unset($_SESSION['is_logged']);

# all
session_destroy();
```

<div class="sr"></div>