# git commit

[Go back](../index.md#basic-usage)

To make a save (commit), you first need to add the files
that will be included in the commit. If a file didn't change
since the last commit, you don't have to add it again.

```bash
# all files from the current folder
git add .
# only one file
git add file
# or one folder
git add folder
```

Then, you can commit, with a message
summarizing your changes.

```bash
git commit -m "commit message"
```