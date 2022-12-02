# Edit your commit history

[Go back](../index.md#git-master)

You can edit your commit history using `git rebase`, to merge commits, edit a message, remove a commit, etc.

```bash
git rebase -i
```

You will usually select a few commits, you could use this to check the last 10 commits

```bash
git rebase -i HEAD~10
```

<hr class="sl">

## How does it work?

First, using `-i`, you are using the interactive mode. This is opening an editor with "pick SHORT_SHA1 commit_message". You can rearrange commits (move lines), and replace pick by

* **pick** = use commit
* reword = use commit, but edit the commit message
* **edit** = use commit, but stop for amending
* **squash** = use commit, but meld into previous commit
* fixup = like "squash", but discard this commit's log message
* exec = run command (the rest of the line) using shell
* drop = remove commit
* ...

You may have to press "i" to enable input, and CTRL-C, then `:wq` to save and exit (or `q!` to exit without saving). If you squashed commits, the editor will open itself again, and allow you to merge the commits messages.

```bash
# since the editor didn't open itself for me, I did
# check
git status
# modify commit
git commit --amend
# next task
git rebase --continue
```