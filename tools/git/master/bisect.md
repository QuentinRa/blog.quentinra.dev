# Searching a bug with git bisect

[Go back](../index.md#git-master)

Let's say, you know that in the commit **A** the project was working, and in the commit B, you know that the project is broken, then using `git bisect`, you can make it easier to find the commit that nuked your project (this is done using the binary search algorithm (`recherche dichotomique`).

```bash
# you can use HEAD or a commit ID
git bisect start A B
# not this one
git bisect bad
# found
git bisect good
# skip
git bisect skip
# you can exit anytime with
git bisect reset
```

You can give a range of dates with

```bash
git bisect start HEAD HEAD@{two month ago}
git bisect start HEAD HEAD@{2021-05-05}
```