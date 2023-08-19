# Git Files and good practices

<div class="row row-cols-md-2"><div>

#### 📦 .gitignore

A "git ignore" is a really useful files to avoid uploading big or sensitive files on GitHub. You can

* Generate one: [gitignore.io](https://www.toptal.com/developers/gitignore).
* Find a template: [gitignore](https://github.com/github/gitignore)

```ini
*.zip # ignore every zip
!toto.zip # don't ignore toto.zip
data/ # ignore every folder called 'data'
data/* # ignore everything inside folders called 'data'
/data # ignore only the folder data in the root directory
```
</div><div>

You may reach a point where you have too many files are the root of your project. On GitHub, you can move these files to a `.github` at the root of your project, and GitHub will still detect them.
</div></div>

<hr class="sep-both">

## 🌞 Good practices 🌞

<div class="row row-cols-md-2 mt-4"><div>

#### 🌞 **Versioning**

The most used way to give name versions of your project is the [Semantic Versioning](https://semver.org/).

* 🗒️ The format is **MAJOR.MINOR.PATCH**
  * MAJOR: breaking change (of the API)
  * MINOR: non-breaking change, backward compatible
  * PATCH: internal change
* When <math xmlns="http://www.w3.org/1998/Math/MathML">
  <mtext>MAJOR</mtext>
  <mo>=</mo>
  <mn>0</mn></math>: in development
* When <math xmlns="http://www.w3.org/1998/Math/MathML">
  <mtext>MAJOR</mtext>
  <mo>&#x2265;</mo>
  <mn>1</mn></math>: Stable

> An alternative is [Calendar Versioning](https://calver.org/).
</div><div>

#### 🌞 **Commits**

Commits must be **atomic**, meaning you shouldn't do more than one thing per commit <small>(ex: adding a small feature)</small>. The second thing is properly naming commits:

* 📃 Usually, we add a type before any message, followed by `:`. <small>(build, docs, feat (=MINOR), fix (=PATCH), style, test, chore, ci, perf, refactor, revert, security, and deps)</small>
* ✍️Then, we add the commit message, with is a short description
* 📦  We may then leave a blank line, and add a body describing more the commit, such as adding a list of changes, or labels such as `Co-authored-by`, `Reviewed-by`, `Refs`...

> See [Conventional Commits](https://www.conventionalcommits.org/en/) and [
commitlint](https://commitlint.js.org/#/).<br>
> Example: [Atom - Git commit messages](https://github.com/atom/atom/blob/master/CONTRIBUTING.md#git-commit-messages) or [commitment](https://github.com/thiagodp/commitment/blob/master/rules-en.md).
</div></div>

<hr class="sep-both">

## 👻 To-do 👻

Stuff that I found, but never read/used yet.

<div class="row row-cols-md-2"><div>

* Git Hooks and [husky](https://github.com/typicode/husky)
* GitHub Discussions
* [About READMEs](https://docs.github.com/en/repositories/managing-your-repositorys-settings-and-features/customizing-your-repository/about-readmes)
* [Working Open Workshop](https://mozillascience.github.io/working-open-workshop/)
</div><div>

* [GitHub Cheat Sheet](https://github.com/tiimgreen/github-cheat-sheet)
* [branch protection rule](https://docs.github.com/en/repositories/configuring-branches-and-merges-in-your-repository/defining-the-mergeability-of-pull-requests/managing-a-branch-protection-rule)
* [controlook-zz](https://github.com/controlook-zz/standards) or [Git Commit Message](https://cbea.ms/git-commit/#seven-rules) and [code-review-tips](https://github.com/ryanmcdermott/code-review-tips)
</div></div>