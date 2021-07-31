# git clone

[Go back](../index.md#basic-usage)

You can get a project from the server
using this command

```bash
git clone URL
```

to get the ``URL`` in Github you can do something
like this

![clone](clone.png)

* click on the arrow
* choose ``SSH`` (no login is you configured ssh keys)
or ``HTTPS`` (always login)
* then copy the link, that's your ``URL``

You can change it using ``git remote``
command it you cloned using the wrong URL.

<hr class="sl">

# git init

Also just in case, you can create a repository
from existing files using

```bash
git init
```

then do as usual until your try to push and
they ask you do use

```bash
git remote add origin URL
```

with URL the same as above.

Also, you can switch to another URL using

```bash
git remote set-url origin new_url
```

such as ``HTTPS`` to `SSH`.

