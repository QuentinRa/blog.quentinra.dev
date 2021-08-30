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
# you can replace 7 by another number
git log -7
# no difference for me, show commit on one line
git log -10 --oneline
git log -10 --oneline --decorate
# show changed files
git log -10 --oneline --decorate --stat
# show diff
git log -10 --oneline -p
# prettier log
git log --pretty=fuller
# draw graph
git log --graph --oneline --decorate
# see one commit (replace HEAD by an ID or something)
git log --no-walk --pretty=fuller HEAD
# custom format (name commit sha1 on date)
# format here https://mirrors.edge.kernel.org/pub/software/scm/git/docs/git-log.html#_pretty_formats
git log --pretty=format:"%cn committed %h on %cd"
# filter by message
git log --grep="feat:"
# filter by files
git log -- README.md
```

<hr class="sr">

## git shortlog

You can see the commits made by each person using `git shortlog`

```bash
git shortlog
```

<hr class="sl">

## git reflog

You can also use reflog to see your commits.

```bash
git reflog --date=iso
```

<hr class="sr">

## git show

You can also use `git show`, which is showing your changes, and may show the same output as `git log` (according to the parameters).

```bash
git show
git show -s --pretty=fuller HEAD
```