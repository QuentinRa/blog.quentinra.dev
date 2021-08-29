# git clone

[Go back](../index.md#basic-usage)

You can get a project from the server using this command `git clone`.

```bash
git clone URL
```

To get the `URL`, you can do something like this on the page of your repository

![clone](clone.png)

* click on the arrow
* choose `SSH` (no login, if you configured ssh keys) or `HTTPS` (always login)
* then copy the link, that's your `URL`

<hr class="sl">

## git clone (other uses)

You can also add a folder, to put the content directly inside a folder.

```bash
git clone URL folder
```

You can also pick a branch (explained later), using

```bash
git clone URL --branch name
```

<hr class="sr">

## git init

You can create a repository from existing files using `git init`, with URL the same as above.

```bash
git init
git remote add origin URL
```

<hr class="sl">

## git remote

You can **switch to another URL** using `git remote`, such as switching from ``HTTPS`` to `SSH`.

```bash
git remote set-url origin new_url
```

