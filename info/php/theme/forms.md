# Forms

[Go back](..)

So you know about POST and GET. You know about action
so a form shortened quite a bit might look like this

```html
<form action="script.php" method="post">
    <input name="username" value="...">
</form>
```

Then in ``script.php`` (since the path lead
to script.php in action), you can read what
you received using ``$_POST`` or `$_GET`
created and filled for you according to what
method was used.

```php
if (count($_POST) == 0) { /* redirect to form */ }

// we got our input field having
// the name="username"
if (isset($_POST['username'])){
    // you can use the username to do something
    $username = $_POST['username']; // value is "..."
    // since in the form the value was "..."
}
```