# Version-control using Git

<div class="row row-cols-md-2"><div>

When working on a project, here are a few problems

* **code sharing** 📬: the need to allow other developers/contributors to read, or even edit the code

* **a need for time travel** 🗃️: the developer removed some old long time ago, and now needs to access it again. There could also be a case in which there is a need to go back to a previous version

* **duplicates** 🎭: a copy of a project to test something, it takes places. And what if you want to merge them?

* **computer dies** 😵: if your computer dies, and you don't have backups, then you lost your project for good
</div><div>

Version-control is helpful to solve these, and Git is the most well-known one. To use Git, there are two actors involved

* **clients** 👲: these are computers that will download project, work on them, upload their changes...
  * The command `git` / [git-scm](https://git-scm.com/) (Windows) 
  * [GitHub Desktop](https://desktop.github.com/)
  * [Git extension (VSCode)](https://code.visualstudio.com/docs/sourcecontrol/overview) (👻)
  * [GitKraken](https://www.gitkraken.com/) (👻)
  * JetBrains integrated Git client <br><span>&nbsp;</span>

* **servers** 🖥️: they will host the code, and make it available to those allowed, or public if you're working open-source.
  * [GitHub](https://github.com/) (Microsoft, my favorite)
  * [GitLab](https://about.gitlab.com/) (Well-known alternative to GitHub)
  * [Gogs](https://gogs.io/) (open-source, self-hosted)
  * [Gitea](https://gitea.com/) (👻)
  * [Bitbucket](https://bitbucket.org/) (👻)
</div></div>

<hr class="sep-both">

## 🐍 Git workflow 🐍

<div class="row row-cols-md-2 mt-4"><div>

Git allows us to create **commits** which are snapshots (`sauvegardes`) of your project. These commits are stored in **branches** 🪵, which are quite similar to local copies of the project.

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
# get the latest version on the server
$ git pull
# ... work a lot ...
# check what changed
$ git status
# add files to the backup
$ git add .
# snapshot named "I worked a lot" 
$ git commit -m "I worked a lot"
# send the snapshot to the server
$ git push
```
</div></div>

<hr class="sep-both">

## 🔑 SSH/GPG Keys 🔑

<div class="row row-cols-md-2"><div>

Setting up SSH keys is a must in most projects. Without SSH keys, you have to log in everytime you want to pull/push to the server.

```bash
$ ssh-keygen -t ed25519 -C "email"
# press ENTER every time.
# You should add a passphrase to protect your key. If someone want to
# use your key, the will be prompted to enter the passphrase.
$ cat ~/.ssh/id_rsa.pub
$ Copy the key in Settings > SSH Keys on GitHub/...
```

> [GitHub tutorial](https://docs.github.com/en/authentication/connecting-to-github-with-ssh/generating-a-new-ssh-key-and-adding-it-to-the-ssh-agent).<br>
> Before, we were using `ssh-keygen -t rsa -b 4096 -C "email"`.
</div><div>

GPG keys are a bit different. They are used to sign your commits, and prove that you were the one that committed. It's possible for someone that has your email to usurp your identify after all.

* [GitHub tutorial](https://docs.github.com/en/github/authenticating-to-github/managing-commit-signature-verification/generating-a-new-gpg-key)

<details class="details-e">
<summary>Increase the delay between passphrase prompts</summary>

You will need to **write a passphrase almost every time you are committing**, unless you provided your passphrase in the last **10 minutes**. You can increase the time your passphrase is cached

```bash
# note the location of the file
# this is usually ~/.gnupg/gpg-agent.conf
$ gpg-agent --gpgconf-list | head -n1
# create the file, or edit it
# cached 8 hours
$ echo "max-cache-ttl 28800" >> ~/.gnupg/gpg-agent.conf
$ echo "default-cache-ttl 28800" >> ~/.gnupg/gpg-agent.conf
# reload
$ gpg-connect-agent reloadagent /bye
```
</details>

On GitHub, verified commits are tagged with a tag "verified" next to them: ![Verified commit](_images/gpg.png)
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
* git tag
* git reset
* git filter-branch

Learn

* [git-scm/doc](https://git-scm.com/doc)
* [github.com](https://github.com/git-guides/)
* [adopteungit](https://github.com/lgiraudel/adopteungit)
* [dubrayn](https://dubrayn.github.io/IPS-DEV/git.html#1)
* [Git & Github Desktop](https://docs.google.com/presentation/d/1vtK6LoqwF4rQQZZy-ovuEgsYUwwMRXsqDVMOjAPSBt0/edit#slide=id.p) and [learn-git-milestones](https://github.com/omundy/learn-git-milestones)
</div><div>

Cheatsheets

* [gitlab.com](https://about.gitlab.com/images/press/git-cheat-sheet.pdf)
* [education.github.com](https://education.github.com/git-cheat-sheet-education.pdf)
* [training.github.com](https://training.github.com/downloads/github-git-cheat-sheet.pdf)
* [cheat-sheets.org](http://www.cheat-sheets.org/saved-copy/git-cheat-sheet.pdf)
* [atlassian.com](https://www.atlassian.com/dam/jcr:e7e22f25-bba2-4ef1-a197-53f46b6df4a5/SWTM-2088_Atlassian-Git-Cheatsheet.pdf)
</div></div>