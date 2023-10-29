# <samp>git</samp> commands

<div class="row row-cols-md-2"><div>

You can install [Git](../_general/index.md) CLI using:

```shell!
$ sudo apt install git # Debian, Ubuntu...
$ brew install git     # macOS
$ git --version
```

Aside from `git clone`, directories must have a parent with a `.git` to use <samp>git</samp> commands. It's automatically created when cloning a remote Git project, but you can also use <small>(see also: "git remote")</small>:

```shell!
$ git init # create .git
```
</div><div>

You'll have to configure GIT before you can use it. The name and the email are used to sign commits. Anyone who can access the commits knows who committed <small>(name+email)</small> and when.

```shell!
$ git config --global user.name "Example Example"
$ git config --global user.email "example@example.com"
```

You may also create aliases:

```shell!
$ git config --global alias.toto 'add .'
$ git toto # same as 'git add .'
```

➡️ See `~/.gitconfig`. You can use `--local` for a per-project configuration. See the configuration using: `git config [...] -l`.
</div></div>

<hr class="sep-both">

## Basic Git commands

<div class="row row-cols-md-2"><div>

#### git clone

Download a GIT repository from a Git server.

```ps
# basic clone
$ git clone URL
# clone and store the project in "folder"
$ git clone URL folder
# clone a branch (see branching)
$ git clone URL -b name
$ git clone URL --branch name
```

#### git add

Track and stage files.

```ps
# add files/folders manually
$ git add file
$ git add file1 file2 folder
# stage all files
$ git add .
$ git add *
# stage only specific lines
$ git add -p file
```

#### git status

List information such as untracked, modified, and staged files.

```ps
$ git status
```

➡️ See also: `git diff` and `git log`.
</div><div>

#### git commit

Create a commit with all the staged files. Every commit must have a message explaining what's in the commit.

```ps
# open "vim" to enter the message
$ git commit
# pass the message directly
# press SHIFT+ENTER for multi-line messages
$ git commit -m "message"
$ git commit -am "xxx"    # automatically add modified files
$ git commit -m "xxx" --allow-empty  # allow an empty commit
```

#### git pull

Ensure the local project is up-to-date with the latest commits, or download them and `git merge` if necessary.

```ps
$ git pull          # current branch
```

#### git fetch

Same as `git pull`, but does not merge changes.

```ps
$ git fetch        # current branch
$ git fetch origin # all branches on a remote
```

➡️ You will have to use `git merge` or `git rebase`.

#### git push

Ensure the remote is up-to-date with the latest commits, and push them to the remote if necessary.

```ps
$ git push          # current branch
```
</div></div>

<hr class="sep-both">

## Git branching

<div class="row row-cols-md-2"><div>

#### git branch

You can list, create, and delete branches.

```ps
# list all branches
$ git branch -a
# create a branch
$ git branch "branch_name"
# delete a branch
$ git branch -d "branch_name"
```

#### git checkout

Navigate to the project corresponding to the given commit.

```ps
# navigate to commit xxx
$ git checkout xxx
# navigate to branch "branch_name"
$ git checkout branch_name
# create a branch from the current commit,
# then navigate to it
$ git checkout -b "branch_name"
```

#### git bisect

If the project was working in commit **A**, and not working in commit **B**, then you can use `git bisect` to find the bad commit. It uses a binary search algorithm.

```shell!
$ git bisect start A B
$ git bisect bad # not this one
$ git bisect good # it works here
$ git bisect skip # skip
$ git bisect reset # exit
```

#### git cherry-pick

You can get a commit from another branch with `git cherry-pick`. The commit is added to the history of your branch.

```shell!
$ git cherry-pick SHA1             # pick a commit
$ git cherry-pick SHA1 --no-commit # pick only files
```
</div><div>

#### git stash

Before a merge, you cannot have changes locally that were not committed. You can use `git stash` to put them on a `shelf` and `pop` them when you're done.

```shell!
$ git status # some files not committed
$ git stash  # save changes
$ git [...]  # any command that might do a merge
$ git stash pop # load back your changes
```

#### git merge

Merge a target's history <small>(e.g., its commits)</small> in our history.

```ps
$ git merge xxx             # a commit
$ git merge "branch_name"   # a branch
```

If we both edited a file, it generated a **conflict**. ⚠️ Conflicts need to be handled for the merge to end.

**Option 1**: Use `git status` to list all problems and solve them. Each file will have conflicts marked like this:


```text!
<<<<<<< HEAD
This is the content from the current branch.
=======
This is the conflicting content from branch_name.
>>>>>>> branch_name
```

**Option 2**: Abort the merge

```ps
$ git merge --abort
```

➡️ See also: `git mergetool` to use a [merge tool](#diff-and-merge-tools).
</div></div>

<hr class="sep-both">

## Git Rebase

<div class="row row-cols-md-2"><div>

The command `git rebase` is used to edit a repository commit history. There are many cases, such as

* 🧼 Renaming commits
* 📦 Merging multiple commits into one
* 💣 Rearrange/Delete commits
* 🔫 Delete files that were previously committed
* ...

You will usually work on a range of commits. The range starts with your current commit, and ends with the provided commit.

```ps
# Ex: rebase the last 10 commits
$ git rebase -i HEAD~10
```

Once inside the interactive editor (vim), you will see lines such as:

```text!
pick SHA1_HEADER commit_message
```
</div><div>

You can replace the instruction "pick" with

* `reword`: edit commit message
* `edit`: edit commit
* `squash`: merge this commit with the previous one
* `fixup`: squash, and discard the commit message
* `exec`: run a command
* `drop`: remove/drop commit

Then, close the editor <small>(on Windows: CTRL+C, then `:wq`)</small>. The editor will open itself again, according to the instructions you used.

Process each commit until the rebase is done.

**Additional commands** 🧪

```shell!
$ git status # check where you are
$ git commit --amend # modify commit
$ git rebase --continue # next task
```
</div></div>

<hr class="sep-both">

## Git Logs

<div class="row row-cols-md-2"><div>

#### git diff

Show differences between two commits

```shell!
$ git diff
$ git diff <COMMIT>
$ git diff --check <COMMIT> # markers/whitespace errors
```

➡️ See also: `git difftool` to set up [a tool](#diff-and-merge-tools) to view diffs.

#### git log

Browse your commits. Mix options to tune the output.

```ps
$ git log
$ git log -n                 # last n commits
$ git log --oneline          # one line per commit
$ git log --decorate         # ...
$ git log --stat             # changed files
$ git log -p                 # show diff
$ git log --pretty=fuller    # custom: https://mirrors.edge.kernel.org/pub/software/scm/git/docs/git-log.html#_pretty_formats
$ git log --no-walk <COMMIT> # see one commit
$ git log --graph            # draw graph
$ git log --grep="feat:"     # filter by message
$ git log -- README.md       # filter by files
```

Other commands such as `shortlog` and `reflog` are based on `log`.
</div><div>

#### gitk

**GUI** to browse commits.

```shell!
$ gitk
```

#### git shortlog

Summary of commits per user.

```shell!
$ git shortlog
```

#### git reflog

One-line per commit with the name, data, and SHA1.

```shell!
$ git reflog
```

#### git ls-remote

Get information about the remote repository.

```shell!
$ git ls-remote
$ git ls-remote --heads
$ git ls-remote --tags
$ git ls-remote --heads --tags
```
</div></div>

<hr class="sep-both">

## git remote

<div class="row row-cols-md-2"><div>

A few commands you might use when dealing with remotes.

**To list remotes:**

```shell!
$ git remote                    # list remotes
local
origin
$ git remote -v                 # remote + URLs
origin  xxx.git
```

**To get details about a remote:**

```shell!
$ git remote show <remote_name> # show details
Fetch URL: xxx.git
Push  URL: xxx.git
[...]
```
</div><div>

**To add a remote, use:**

```ps
$ git remote add origin CLONE_URL
```

**To update a remote URL** <small>(ex: repository renamed/moved, HTTP to SSH)</small>:

```ps
# get the current URL
$ git remote get-url origin
# update the URL
$ git remote set-url origin NEW_URL
```

**Other notes** 📚

<details class="details-n">
<summary>Use commits from a previous project</summary>

The goal is to "steal" commits from another local repository. For instance, if you started a project from scratch, but want to get back the previous project commits.

```bash!
# remove everything as you don't want old files
$ cd AnotherRepository
$ rm -rf *
$ git add .
$ git commit -m "feat: delete everything"
# move to the other repository
$ cd ../YourRepository
$ git remote add other ../AnotherRepository
$ git fetch other
$ git merge other/main --allow-unrelated-histories
# Now, your repository has commits from the previous repository
```
</details>
</div></div>

<hr class="sep-both">

## 🪄 Git extras 🪄

<div class="row row-cols-md-2"><div>

#### 🪄 Git submodules

Git submodules are the appropriate way to store (link) external Git repositories inside a Git repository.

```bash
# init submodules for a cloned project (v1)
$ git submodule init
$ git submodule update
# init submodules for a cloned project (v2)
$ git submodule update --init --recursive
# to clone a project and init submodules
$ git clone --recursive URL
$ git clone --recurse-submodules URL
# to add a Git repository as a submodule
$ git submodule add CLONE_URL
$ git submodule add CLONE_URL LOCAL_PATH
```

You can find your submodules in `.gitmodules`.

<br>

#### git subtree

Git subtree is similar to [git submodules](#-git-submodules), but external repositories commits are merged and part of the project history.

This can be convenient when **you need to edit the code of an external repository** which you can't do using submodules, but forking the external repository and using it with submodules is better.

```ps
$ git subtree add --prefix path/to/folder URL commit -squash
$ git subtree pull --prefix path/to/folder URL commit -squash
```
</div><div>

#### 🪄 Git Large File Storage

Git LFS should be used with caution. It offers a dedicated Git storage solution for large files; however, for free users utilizing SaaS Git servers like GitHub, it does have several limitations.

For example, GitHub free users have impractical bandwidth quotas and storage constraints.

Some commands you might use:

```bash
$ git lfs init
$ git lfs update
$ git lfs ls-files
$ git lfs fetch --all origin
$ git lfs uninstall
```

See also: `.gitattributes`.

<br>

#### Diff and merge tools

Git clients

* [meld](https://meldmerge.org/) (👻)
* [TortoiseGitMerge](https://tortoisegit.org/docs/tortoisegitmerge/) (👻)

Git tools

* [Beyond compare](https://www.scootersoftware.com/) (👻)
* [diffuse](https://diffuse.sourceforge.net/) (👻)
* [tkdiff](https://sourceforge.net/projects/tkdiff/) (👻)
* [kdiff3](https://kdiff3.sourceforge.net/) (👻)
</div></div>

<hr class="sep-both">

## 👻 To-do 👻

Stuff that I found, but never read/used yet.

<div class="row row-cols-md-2"><div>

* `git show`
* `git tag`
* `git reset`
* `git restore`
* `git switch`
* `git filter-branch` (see [disable git-lfs](https://stackoverflow.com/questions/48699293/how-do-i-disable-git-lfs), and [here](https://stackoverflow.com/questions/43762338/how-to-remove-file-from-git-history)) 
* `git filter-repo`
* `git diff -U3 > xxx.patch`
* `git apply xxx.patch`
</div><div>

Cheatsheets

* [gitlab.com](https://about.gitlab.com/images/press/git-cheat-sheet.pdf)
* [education.github.com](https://education.github.com/git-cheat-sheet-education.pdf)
* [training.github.com](https://training.github.com/downloads/github-git-cheat-sheet.pdf)
* [cheat-sheets.org](http://www.cheat-sheets.org/saved-copy/git-cheat-sheet.pdf)
* [atlassian.com](https://www.atlassian.com/dam/jcr:e7e22f25-bba2-4ef1-a197-53f46b6df4a5/SWTM-2088_Atlassian-Git-Cheatsheet.pdf)

[corrupt git files](https://stackoverflow.com/questions/11706215/how-can-i-fix-the-git-error-object-file-is-empty)

```ps
find .git/objects/ -type f -empty | xargs rm
git fetch -p
git fsck --full
```
</div></div>