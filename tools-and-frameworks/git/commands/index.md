# Git commands

<div class="row row-cols-md-2"><div>

There are many problems when working on projects, and most can be addressed with Version-control. **Git** is the most used one.

* **code sharing** 📬: allow other to read/edit the code
* **a need for time travel** 🗃️: find back some code that was removed... Go back to a previous version...
* **duplicates** 🎭: copies of the project to test something. What if you want to merge/share your changes?
* **computer dies**/accidental removal/... 😵: [...]
* **information** 🔎: who added/changed something? when?...
</div><div>

**Where to learn?**

* [OH MY GIT!](https://ohmygit.org/) <small>(👻, a game to learn Git)</small>

</div></div>

<hr class="sep-both">

## Actors

<div class="row row-cols-md-2"><div>

#### Git clients 👲

These are computers that will download project, work on them, upload their changes... You can use:

* The command `git`, and [git-scm](https://git-scm.com/) on Windows
* [GitHub Desktop](https://desktop.github.com/)
* [The Git extension in VSCode](https://code.visualstudio.com/docs/sourcecontrol/overview) (👻)
* [GitKraken](https://www.gitkraken.com/) (👻)
* JetBrains integrated Git client
</div><div>

#### Git servers 🖥

They will host the code, and make it available to those allowed, or to everyone if you're working on open-source projects. You can use:

* [GitHub](https://github.com/) <small>(Microsoft, my favorite)</small>
* [GitLab](https://about.gitlab.com/) <small>(Well-known alternative to GitHub)</small>
* [Gogs](https://gogs.io/) <small>(open-source, self-hosted)</small>
* [Gitea](https://gitea.com/) (👻)
* [Bitbucket](https://bitbucket.org/) (👻)
</div></div>

<hr class="sep-both">

## 🐍 Git workflow 🐍

<div class="row row-cols-md-2 mt-4"><div>

Git allows us to create **commits** which are snapshots (`sauvegardes`) of your project. These are stored in **branches** 🪵, which are quite similar to local copies of the project.

```bash
# install
$ sudo apt install git
# check
$ git --version
# required config
# warning: visible by others, used to sign/attribute commits
$ git config --global user.name "Example Example"
$ git config --global user.email "example@example.com"
```

* ➡️ Create a project on your GIT server

  * [Documentation on GitHub](https://docs.github.com/en/repositories/creating-and-managing-repositories/creating-a-new-repository)
  * The process is quite similar for others

</div><div>

* ➡ Download the project locally

```bash
$ git clone URL
```

* ➡ When working on your project

```bash
# get the latest snapshot from the server
$ git pull
# ... work a lot ...
# check what changed
$ git status
# add files to the snapshot
$ git add .
# snapshot named "I worked a lot" 
$ git commit -m "I worked a lot"
# send the snapshot to the server
$ git push
```
</div></div>

<hr class="sep-both">

## 🎉 Git commands 🎉

<div class="row row-cols-md-2 mt-4"><div>

* **clone**: fetch a repository (=project) from the server

```bash
# basic clone
$ git clone URL
# clone and store the files in "folder"
$ git clone URL folder
# clone a branch
$ git clone URL -b name
$ git clone URL --branch name
```

* **pull/fetch**: get the latest version from the server

```bash
$ git pull
# fetch locally, but don't apply any changes
# useful when you want to check the code first
$ git fetch
```

* **add**: select files that were added/modified since the previous snapshot/commit, and should be added to the next commit

```bash
# all added/modified
$ git add .
$ git add *
# add one file
$ git add file
# add one folder
$ git add folder
# select the part of a file that you want to add
$ git add -p file
```
</div><div>

* **commit**: create a snapshot with a message

```bash
# open "vim" to enter the message
$ git commit
# pass the message directly
# press SHIFT+ENTER for multiple comments!
$ git commit -m "message"
# automatically add modified files
$ git commit -am "message"
# empty commit
$ git commit -m "message" --allow-empty
```

* **status**: see files added/changed, commits that were not pushed to the server...

```bash
$ git status
```

* **push**: send your commits to the server

```bash
$ git push
```
</div></div>


<hr class="sep-both">

## SHA1

<div class="row row-cols-md-2 mt-4"><div>

Every commit is identified by a unique SHA1 value. This allows us to move between commits, or more generically, do any operations on specific commits.

```bash
# use the shortened SHA1
$ git checkout 1ed803c2
# use the whole SHA1
$ git checkout 1ed803c298f6dbfdc95bba1db3322c0f0ed7b6a5
```

There are a few shortcuts

* **HEAD**: the last commit
* **@**: same, the last commit

To identify a commit from a specific branch use `origin/myBranch`.
</div><div>

And many operators that can be applied on your SHA1

```bash
# one commit before
$ git checkout sha1^
# n commit before
$ git checkout sha1^n
$ git checkout sha1~n
# every commit done 'two month ago' ours
$ git checkout sha1@{two month ago}
# the closest commit to a date
$ git checkout sha1@{2021-05-05}
```
</div></div>

<hr class="sep-both">

## 🪵 Branches, and merges 🪵 

<div class="row row-cols-md-2 mt-4"><div>

A branch is a copy of your project. The main branch is usually called **main**/**master** by default, and you will most likely work directly on it.

Sometimes, to avoid breaking the main branch, we create other branches to add/edit a feature, to avoid breaking your teammates project.

```bash
$ git branch "branch_name"
$ git checkout "branch_name"
# shortcut to create + checkout
$ git checkout -b "branch_name"
# delete a branch
$ git branch -d "branch_name"
```
</div><div>

Once you're finished, you will want to merge your work with another copy (branch) of the project.

```bash
# ex: merge "branch_name" with main
$ git checkout main
$ git merge "branch_name"
```

⚠️ Unfortunately, it doesn't always work out nicely. If the main branch was changed since we created our copy, then it's likely that a file was changed on both branches. 

If this happens, you will have to open every file, and resolve conflicts. Git will put in every file the two versions, and you will have to remove/keep what you want.

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

## 🪄 Git extras 🪄

<div class="row row-cols-md-2"><div>

#### 🪄 Git submodules

Git submodules are the appropriate way of having others Git repositories inside another Git repository. 

```bash
# version 1
$ git submodule init
$ git submodule update
# version 2
$ git clone --recursive URL
$ git clone --recurse-submodules URL
# Alternative for update
$ git submodule update --init --recursive
# Add another git
$ git submodule add CLONE_URL
$ git submodule add CLONE_URL LOCAL_PATH
```

You can find your submodules in `.gitmodules`.
</div><div>

#### 🪄 Git LFS

Git LFS should not be used. On GitHub, it allows you to upload files bigger than 50 Mo on GitHub, but there are bandwidth quotas/a limited storage for free.

```bash
# random commands
$ git lfs init # see .gitattributes
$ git lfs update
$ git lfs ls-files
$ git lfs fetch --all origin
$ git lfs uninstall
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
* `git tag`
* `git reset`
* `git switch`
* `git filter-branch` (see [disable git-lfs](https://stackoverflow.com/questions/48699293/how-do-i-disable-git-lfs), and [here](https://stackoverflow.com/questions/43762338/how-to-remove-file-from-git-history))

Learn

* [git-scm/doc](https://git-scm.com/doc)
* [github.com](https://github.com/git-guides/)
* [adopteungit](https://github.com/lgiraudel/adopteungit)
* [dubrayn](https://dubrayn.github.io/IPS-DEV/git.html#1)
* [Git & Github Desktop](https://docs.google.com/presentation/d/1vtK6LoqwF4rQQZZy-ovuEgsYUwwMRXsqDVMOjAPSBt0/edit#slide=id.p) and [learn-git-milestones](https://github.com/omundy/learn-git-milestones)
* 👉 An imaged tutorial: [GitHub for collaboration](https://mozillascience.github.io/working-open-workshop/github_for_collaboration/) <small>(quite good)</small>.
* [learngitbranching](https://learngitbranching.js.org/)
* `git restore`, `git subtree`, [see 2nd answer](https://stackoverflow.com/questions/11706215/how-can-i-fix-the-git-error-object-file-is-empty) (VM crash/shutting down)
</div><div>

Cheatsheets

* [gitlab.com](https://about.gitlab.com/images/press/git-cheat-sheet.pdf)
* [education.github.com](https://education.github.com/git-cheat-sheet-education.pdf)
* [training.github.com](https://training.github.com/downloads/github-git-cheat-sheet.pdf)
* [cheat-sheets.org](http://www.cheat-sheets.org/saved-copy/git-cheat-sheet.pdf)
* [atlassian.com](https://www.atlassian.com/dam/jcr:e7e22f25-bba2-4ef1-a197-53f46b6df4a5/SWTM-2088_Atlassian-Git-Cheatsheet.pdf)
</div></div>