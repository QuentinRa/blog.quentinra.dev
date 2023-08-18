# <samp>git</samp> commands

<div class="row row-cols-md-2"><div>

You can install [Git](../_general/index.md) CLI using:

```shell!
$ sudo apt install git # Debian, Ubuntu...
$ brew install git     # macOS
$ git --version
```
</div><div>

You'll have to configure GIT before you can use it. The name and the email are used to sign commits. Anyone that can access the commits knows who committed <small>(name+email)</small> and when.

```shell!
$ git config --global user.name "Example Example"
$ git config --global user.email "example@example.com"
```
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
</div><div>

#### git commit

Create a commit with all staged files. Every commit must have a message explaining what's in the commit.

```ps
# open "vim" to enter the message
$ git commit
# pass the message directly
# press SHIFT+ENTER for multi-lines messages
$ git commit -m "message"
$ git commit -am "xxx"    # automatically add modified files
$ git commit -m "xxx" --allow-empty  # allow an empty commit
```

#### git pull

Download and apply the latest changes, for the current branch, from the remote repository.

```ps
$ git pull
```

#### git push

Send the latest commits only present locally, for the current branch, to the remote repository.

```ps
$ git push
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
</div><div>

#### git merge

Merge a target's history <small>(e.g., its commits)</small> in our history.

```ps
$ git merge xxx             # a commit
$ git merge "branch_name"   # a branch
```

If we both edited a file, it generates a **conflict**. ⚠️ Conflicts need to be handled for the merge to end.

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

You will usually work on a range of commits. The range is starting with your current commit, and ending with the provided commit.

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
* `fixup`: squash, and discard commit message
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
</div><div>

Other commands such as `shortlog` and `reflog` are based on `log`.

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
</div></div>

<hr class="sep-both">

## 🪄 Git extras 🪄

<div class="row row-cols-md-2"><div>

#### 🪄 Git submodules

Git submodules are the appropriate way of having external Git repositories inside a Git repository.

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
</div><div>

#### 🪄 Git Large File Storage

Git LFS should be used with caution. It offers a dedicated Git storage solution for large files; however, for free users utilizing SaaS Git servers like GitHub, it does have several limitations.

For example, on GitHub, it permits uploading files larger than 50 MB, yet there are impractical bandwidth quotas and storage constraints.

Some commands you might use:

```bash
$ git lfs init
$ git lfs update
$ git lfs ls-files
$ git lfs fetch --all origin
$ git lfs uninstall
```

See also: `.gitattributes`.
</div></div>

<hr class="sep-both">

## 👻 To-do 👻

Stuff that I found, but never read/used yet.

<div class="row row-cols-md-2"><div>

* `git tag`
* `git reset`
* `git restore`
* `git switch`
* `git filter-branch` (see [disable git-lfs](https://stackoverflow.com/questions/48699293/how-do-i-disable-git-lfs), and [here](https://stackoverflow.com/questions/43762338/how-to-remove-file-from-git-history))
</div><div>

Cheatsheets

* [gitlab.com](https://about.gitlab.com/images/press/git-cheat-sheet.pdf)
* [education.github.com](https://education.github.com/git-cheat-sheet-education.pdf)
* [training.github.com](https://training.github.com/downloads/github-git-cheat-sheet.pdf)
* [cheat-sheets.org](http://www.cheat-sheets.org/saved-copy/git-cheat-sheet.pdf)
* [atlassian.com](https://www.atlassian.com/dam/jcr:e7e22f25-bba2-4ef1-a197-53f46b6df4a5/SWTM-2088_Atlassian-Git-Cheatsheet.pdf)
</div></div>