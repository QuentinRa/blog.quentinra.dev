# Git commands

<div class="row row-cols-md-2 mt-4"><div>

* ➡️ Create a project on your GIT server

  * [Documentation on GitHub](https://docs.github.com/en/repositories/creating-and-managing-repositories/creating-a-new-repository)
  * The process is quite similar for others
</div><div>

* **fetch**: get the latest version from the server

```bash
# fetch locally, but don't apply any changes
# useful when you want to check the code first
$ git fetch
```
</div></div>

<hr class="sep-both">

## 🧹 Rebase 🧹

<div class="row row-cols-md-2 mt-4"><div>

The command `git rebase` is used to edit a repository commit history. There are many cases, such as

* 🧼 Renaming commits
* 📦 Merging multiple commits into one
* 💣 Rearrange/Delete commits
* 🔫 Delete files that were previously committed
* ...

You will usually work on a range of commits. The range is starting with your current commit, and ending with the provided commit. 

```bash
# rebase the last 10 commits
$ git rebase -i HEAD~10
```

Once inside the interactive editor (vim), you will see lines like

```text
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

Then, close the editor <small>(on Windows: CTRL+C, then `:wq`)</small>. Then, the editor will open itself again, according to the instructions you used.

Additional commands

```bash
$ git status # check where you are
$ git commit --amend # modify commit
$ git rebase --continue # next task
```
</div></div>

<hr class="sep-both">

## 💪 Advanced commands 💪

<div class="row row-cols-md-2 mt-4"><div>

* 📦 **Convert a normal folder to a Git repository**

<details class="details-n">
<summary>&nbsp;<code>git init</code></summary>

```bash
# create .git
$ git init
$ git remote add origin CLONE_URL
```
</details>

* 🗓️ **Update CLONE_URL** <small>(ex: repository renamed/moved, HTTP $\to$ SSH)</small>

<details class="details-n">
<summary>&nbsp;<code>git remote</code></summary>

```bash
# get current clone URL
$ git remote get-url origin
# update the clone URL
$ git remote set-url origin NEW_CLONE_URL
```
</details>

* 🦄 **Steal commits from another local+unrelated repository**

<details class="details-n">
<summary>&nbsp;<code>git remote/fetch/merge</code></summary>

The goal is to "steal" commits from another local repository. For instance, if you started a project from scratch, but you want to get back the previous project commits.

```bash
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
# now, your repositories has commits from the previous repository
```
</details>
</div><div>

* 🔎 **Find the commit that messed up your project**

<details class="details-n">
<summary>&nbsp;<code>git bisect</code></summary>

If the project was working in **A**, and not working in **B**, then you can use `git bisect` to find the bad commit. This command uses a binary search algorithm (`recherche dichotomique`).

```bash
git bisect start A B
git bisect bad # not this one
git bisect good # it works here
git bisect skip # skip
git bisect reset # exit
```
</details>

* 🍒 **Pick a commit from another branch**

<details class="details-n">
<summary>&nbsp;<code>git cherry-pick</code></summary>

If the project was working in **A**, and not working in **B**, then you can use `git bisect` to find the bad commit. This command uses a binary search algorithm (`recherche dichotomique`).

```bash
# pick a commit
git cherry-pick SHA1
# pick files but do not commit
git cherry-pick SHA1 --no-commit
```
</details>
</div></div>

<hr class="sep-both">

## 🧺 Other commands 🧺

<div class="row row-cols-md-2 mt-4"><div>


* See previous commits

<details class="details-n">
<summary>&nbsp;<code>git log</code>: the sad life of client-less dudes 😢</summary>

```bash
$ git log
$ git log -n # last n
$ git log --oneline # one line per commit
$ git log --decorate # ...
$ git log --stat # changed files
$ git log -p # show diff
$ git log --pretty=fuller # custom: https://mirrors.edge.kernel.org/pub/software/scm/git/docs/git-log.html#_pretty_formats
$ git log --no-walk <COMMIT> # see one commit
$ git log --graph # draw graph
$ git log --grep="feat:" # filter by message
$ git log -- README.md # filter by files
```
</details>

<details class="details-n">
<summary>&nbsp;<code>git shortlog</code>: quick recap of who committed</summary>

```bash
$ git shortlog
```
</details>

<details class="details-n">
<summary>&nbsp;<code>git reflog</code>: browse your commits</summary>

```bash
$ git reflog --date=iso
```
</details>
</div><div>

* Random Utilities

<details class="details-n">
<summary>&nbsp;<code>git show</code>: show your changes</summary>

```bash
$ git show
$ git show -s --pretty=fuller HEAD
```
</details>

<details class="details-n">
<summary>&nbsp;<code>git diff</code>: diff between two commits</summary>

```bash
$ git diff
$ git diff <COMMIT>
$ git diff --check <COMMIT> # markers/whitespace errors
```
</details>

<details class="details-n">
<summary>&nbsp;<code>git config</code>: aliases, default branch...</summary>

```bash
# add aliases
$ git config --global alias.toto 'add .'
$ git toto # same as 'git add .'
```

```bash
# use "main" as the default branch
$ git config --global init.defaultBranch main
```
</details>

<details class="details-n">
<summary>&nbsp;<code>git ls-remote</code>: get information about the remote repository</summary>

```bash
git ls-remote
git ls-remote --heads
git ls-remote --tags
git ls-remote --heads --tags
```
</details>

</div></div>

<hr class="sep-both">

## 👻 To-do 👻

Stuff that I found, but never read/used yet.

<div class="row row-cols-md-2"><div>

Stuff

* Digital Object Identifiers (see [GitHub article](https://guides.github.com/activities/citable-code/))
* GitGraph.js

Learn

* `git subtree`, [see 2nd answer](https://stackoverflow.com/questions/11706215/how-can-i-fix-the-git-error-object-file-is-empty) (VM crash/shutting down)
</div><div>
</div></div>