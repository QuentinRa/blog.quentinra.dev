# Pick up commits with

[Go back](../index.md#git-master)

You can pick up commits from another branch, using the command `git cherry-pick`. It does look useful, but it may introduce duplicates commits, mess with everything, and you may have to do a rebase later. Still, I think it may be useful

```bash
# pick a commit by ID
git cherry-pick SHA1
# no commit
git cherry-pick SHA1 --no-commit
```