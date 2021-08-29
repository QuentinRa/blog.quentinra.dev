# git status

[Go back](../index.md#basic-usage)

Use `git status` to get the list of the files that aren't committed, the number of local commits, ...

```bash
git status
```

<hr class="sl">

## git log

For users without an interface, `git log` might also help, as it displays information about each commit.

```bash
git log
# prettier log
git log --pretty=fuller
# see one commit (replace HEAD by an ID or something)
git log --no-walk --pretty=fuller HEAD
```

<hr class="sr">

## git reflog

You can also use reflog to see your commits.

```bash
git reflog --date=iso
```

<hr class="sl">

## git show

You can also use `git show`, which is showing your changes, and may show the same output as git log (according to the parameters).

```bash
git show
git show -s --pretty=fuller HEAD
```