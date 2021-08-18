# git clone

[Go back](../index.md#basic-usage)

You can get a project from the server using this command

```bash
git clone URL
```

to get the ``URL``, you can do something like this

![clone](clone.png)

* click on the arrow
* choose ``SSH`` (no login is you configured ssh keys) or ``HTTPS`` (always login)
* then copy the link, that's your ``URL``

<hr class="sl">

## git init

You can create a repository from existing files using

```bash
git init
git remote add origin URL
```

with URL the same as above.

<hr class="sr">

## git remote

You can **switch to another URL** using

```bash
git remote set-url origin new_url
```

such as ``HTTPS`` to `SSH`.

