# Git commands

<div class="row row-cols-md-2 mt-4"><div>
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

* GitGraph.js
* `git subtree`, [see 2nd answer](https://stackoverflow.com/questions/11706215/how-can-i-fix-the-git-error-object-file-is-empty) (VM crash/shutting down)
</div></div>