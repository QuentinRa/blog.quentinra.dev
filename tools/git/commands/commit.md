# git commit

[Go back](../index.md#basic-usage)

To make a save (commit), you need to add the files that will be included in the commit. If a file didn't change since the last commit, you don't have to add it again.

```bash
# all files from the current folder
git add .
# only one file
git add file
# or one folder
git add folder
```

Then, you can commit, with a message summarizing your changes.

```bash
git commit -m "commit message"
# or
git commit -m "This is a long commit message.
Press SHIFT+ENTER to add another line.
"
```

You can also remove the option "m". The vim editor will be opened, allowing you to enter your message (CTRL-C then enter `:q!` to exit without saving or `:wq` to save and exit).

```bash
git commit
```