# Sessions

[Go back](..)

You will use the ``$_SESSION`` variable.
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

Maybe you want to know more about sessions? Well, they
are stored on the **server**. It's a file that may be called
``0za54c5az165daz0ce851s0d`` (just typing some
random characters). This filename is the ``id`` of the session,
you can get it with ``session_id()``.

Why do I talk about that? Well the client will have in his
browser a Cookie, called ``session`` (or something
like that) and inside this cookie, the client will
have the ``session_id()``...

When the client makes a request, this session_id is sent
with the request so the server can fill ``$_SESSION``.
And yeah, you can change the value in your cookie
to use someone else SESSION.

So Frameworks usually add some checks like an IP check
etc. But what you should often do is remove the sessions
**Server-side**. Since someone that logged out can still
log again using the same session id (without passing
by the login form). It's sometimes
used in hacking but for that, you need to get the
session id and that's hard to get.