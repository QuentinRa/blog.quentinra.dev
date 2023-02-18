# Login/Logout

[Go back](../../../../../_kmp/_archives/info/very_old/php/index.md#main-concepts)

This is how you could handle, without a framework/library, a simple login form in PHP.

* The HTML form

There are two things you should notice: <b>1</b> the name "login" for the login field, and the name "password" for the password, and <b>2</b>: the method is POST and the action is <b>login.php</b>.

```html
<!-- form.html -->
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

* now we need to code **login.php**

```php
<?php
// a method the redirect to the
// used to return to form.html is the form is invalid
function to_form() { header("Location: form.html"); exit(); };

// fields are missing
if (empty($_POST['login']) || empty($_POST['password'])) {
    to_form();
}

// save into variables, remove the trailing spaces
$login = trim($_POST['login']);
$password = trim($_POST['password']);

// check if the username is not already used
// ... omitted ...

// you may check the size (if this is a form to create an account)
if (strlen($login) < 4 || strlen($password) < 6){
    // example of saving error
    $_SESSION['login_message'] = 'Error: login / password too short';
    to_form();
}

// try login
// $hash = password_hash("toto", PASSWORD_DEFAULT);
// ...
$success = password_verify($password, "... some hash ...");

// save
if ($success){
    $_SESSION['logged_user'] = $login;
    $_SESSION['login_message'] = "Message: logged.";
    var_dump("ok");
    // ...
} else {
    $_SESSION['login_message'] = "Error: login failed !";
    to_form();
}
```

Note that you must encrypt your password in order to store it in a database properly.

```php
// save the hash in the database
$hash = password_hash("mdp", PASSWORD_DEFAULT);
// then as each login, use this method
// with the hash in the database and "mdp"
// the input from the user
$boolean = password_verify("mdp", $hash);
```