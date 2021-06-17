# ...

[Go back](..)

<div class="sr"></div>

**SQL INJECTIONS**

Okay, note this one : **SQL INJECTIONS**. Let's says
some write in a field username `root' OR 0=0 -- c`
and password ``a_fake_password``.

When you made a SQL request, you may
have done
```php
$username = "root' OR 0=0; -- c";
$password = "a_fake_password";
$request = "Select * FROM users Where username='$username' AND password='$password'";
```
and if you did, replace username by the value
above

```sql
Select * FROM users Where username='root' OR 0=0; -- c' AND password='$password';
```

Are you seeing the bypass ? ``0=0`` is true and the `'` make the request end
meaning that we added some code into the SQL request. The OR make it like
we could log in without a password since the password check is commented and
we set ``condition OR true`` so the where is always `true`.

The ONLY reliable way to patch this is to do **PREPARED STATEMENTS**.