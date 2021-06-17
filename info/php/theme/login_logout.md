# Login/Logout

[Go back](..)

It's a summary of what's written in others pages.

```html
<form method="post" action="login.php">
    <div>
        <label for="login">Login</label>
        <input name="login" type="text" value="Calistro" id="login" />
    </div>

    <div>
        <label for="password">Password</label>
        <input name="password" type="password" value="tester" id="password" />
    </div>
    
    <button type="submit">Submit</button>
</form>
```

And a ``login.php``

```php
<?php
// used to return to form
function to_form() { header("Location: form.html");exit(); };

// check field got send
if (empty($_POST['login']) || empty($_POST['password'])){
    to_form();
}

// save into variables
$login = trim($_POST['login']);
$password = trim($_POST['password']);

// check if already in db or size
// ... omitted ...
if (strlen($login) < 4 || strlen($password) < 6){
    // save error
    $_SESSION['login_message'] = 'Error: login / password too short';
    to_form();
}

// try login
// ...
$success = password_verify($password, "... some hash ...");

// save
if ($success){
    $_SESSION['logged_user'] = $login;
    $_SESSION['login_message'] = "Message: logged.";
    to_form();
} else {
    $_SESSION['login_message'] = "Error: login failed !";
}
to_form();
```

Note that you must encrypt your password in order
to store it in a database properly.

```php
// save the hash in the database
$hash = password_hash("mdp", PASSWORD_DEFAULT);
// then as each login, use this method
// with the hash in the database and "mdp"
// the input from the user
$boolean = password_verify("mdp", $hash);
```