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

## Session, security, ...

Okay maybe you want to know more about Session? Well, sessions
are stored on the **server**. It's a file that may be called
like ``0za54c5az165daz0ce851s0d`` (just typing some
random characters). This name is the ``id`` of the session
like ``session_id()``.

Why do I talk about that? Well the client have in his/her
browser a Cookie, called ``session`` (or something
like that) and inside this cookie, the client will
have the ``session_id()``...

When the client make a request, this session_id is send
with the request so the server can  fill ``$_SESSION``.
And yeah, you can change the value in your cookie
to use someone else SESSION.

So Frameworks usually add some checks like an IP check
etc. But what you should often do is remove the sessions
**Server-side**. Since someone that logged out can still
log again using the same session id (without passing
by the login form). It's sometimes
used in hacking but for that you need to get the
sessions id and that's hard to get.