# git commit

[Go back](../index.md#basic-usage)

Use this one to commit all added files. 
To add files that will be in the commit, use

```bash
# all files from the current folder
git add .
# only one file
git add file
# or one folder
git add folder
```

Then, and only then you can call for commit. Commit will
add to the save only modified files that got already
added once or a new file that you added just now.

```bash
git commit -m "commit_message"
```