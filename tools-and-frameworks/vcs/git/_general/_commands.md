# Git commands

<div class="row row-cols-md-2 mt-4"><div>

* ➡️ Create a project on your GIT server

  * [Documentation on GitHub](https://docs.github.com/en/repositories/creating-and-managing-repositories/creating-a-new-repository)
  * The process is quite similar for others

* **fetch**: get the latest version from the server

```bash
# fetch locally, but don't apply any changes
# useful when you want to check the code first
$ git fetch
```
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

* Random Utilities

<details class="details-n">
<summary>&nbsp;<code>git show</code>: show your changes</summary>

```bash
$ git show
$ git show -s --pretty=fuller HEAD
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

Stuff

* Digital Object Identifiers (see [GitHub article](https://guides.github.com/activities/citable-code/))
* GitGraph.js

Learn

* `git subtree`, [see 2nd answer](https://stackoverflow.com/questions/11706215/how-can-i-fix-the-git-error-object-file-is-empty) (VM crash/shutting down)
</div></div>