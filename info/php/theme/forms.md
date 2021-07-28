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

If you want to store that the user logged in etc,
use sessions.

<hr class="sr">

**Validate**

You must check what the user sends to you, even
if you checked in HTML. The user can bypass the HTML/JS
verifications but not the PHP one, at least no easily.

You MUST do checks like

* isset
* empty

and you might use ``trim(...)`` to remove the spaces
before and after like `   this is toto  `` becomes
``this is toto`` after trim.

You can also use ``nl2br(...)`` to convert `\n` to
``<br/>``.

Finally, you must use filters to check things like
"is this value a number?" or this is email looking
like a real one?

```php
$email = $_POST['email'];

// check if a field validate a filter
if (filter_var($email, FILTER_VALIDATE_EMAIL) != false){
    // consider that the email is proprely formatted
} else {
    // send error ...
}
```

* FILTER_VALIDATE_FLOAT
* FILTER_VALIDATE_INT
* ...

You could also use ``ctype_digit(text)`` returning
true if the text is an int.