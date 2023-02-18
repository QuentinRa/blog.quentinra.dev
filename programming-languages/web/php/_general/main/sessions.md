# Sessions

[Go back](../../../../../_kmp/_archives/info/very_old/php/index.md#main-concepts)

You will use the `$_SESSION` variable. First start sessions handling using `session_start();`, making the variable available. Sessions are used to save data between your pages.

```php
// in login successful
$_SESSION['is_logged'] = 'root';

// then later you could do
// "check if logged"
if (isset($_SESSION['is_logged'])){
    // code if logged
}
```

You may destroy a `$_SESSION` using `session_destroy`

```php
# one by one
unset($_SESSION['is_logged']);

# all
session_destroy();
```