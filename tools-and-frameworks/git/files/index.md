# Git Files and good practices

<hr class="sep-both">

## 📦 Basic files 📦

<div class="row row-cols-md-2 mt-3"><div>

#### 📦 README.md

The README.md <small>(or README.rst)</small> is a file in Markdown describing the project, how to install it, how to use it... [See makeareadme.com](https://www.makeareadme.com/)

* ✍️ What's the project's name and goal/description
* 🧸 How can we install it? Run it? Test it?
  * Add examples (GIF, Input-Output, demo...)
  * Provide a link to some documentation
* 📦 Why have you made this project? Who is your audience?
* 🌳 Credits, maintainers, contributors, License...

> A lot of developers are using badges to show some information about the project such as ![badge](https://img.shields.io/github/license/quentinra/blog.quentinra.dev). See [shields.io](https://shields.io/), [badgen.net](https://badgen.net/), [markdown-badges](https://github.com/Ileriayo/markdown-badges), [unmaintained.tech](https://unmaintained.tech/), and [License badges](https://gist.github.com/lukas-h/2a5d00690736b4c3a7ba).

There are a few things you may also find in use

* [Repository stars over time](https://starchart.cc/)
* [Show contributors](https://contrib.rocks/)
</div><div>

#### 📦 LICENSE / LICENSE.txt

A license describes what others can do with your code. No license means that your code is copyrighted. We usually use these

* the MIT license ⭐
* the Apache license, version 2.0
* the [creative common kinds of licenses](https://creativecommons.org/)
* [Creative Commons](https://creativecommons.org/choose/)

> See [choosealicense.com](https://choosealicense.com/), and especially the [licenses](https://choosealicense.com/licenses/) page.
...

<br>

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
</div></div>

<hr class="sep-both">

## 🍒 Special files 🍒

You may reach a point where you have too many files are the root of your project. On GitHub, you can move these files to a `.github` at the root of your project, and GitHub will still detect them.

<div class="row row-cols-md-2 mt-3"><div>

#### 🍒 CONTRIBUTING.md

Explain how they can contribute to your project.

* 📦 What is the structure of the code?
* 👥 How/When should others open issues/Pull-requests?
* 🧹 Is there guidelines/a style to adopt when coding?
* 🌳 Is there a forum/place to exchange about the project/...?

> Example: [atom - CONTRIBUTING.md](https://github.com/atom/atom/blob/master/CONTRIBUTING.md)

<br>

#### 🍒 CODE_OF_CONDUCT.md

What behavior is tolerated? What's behavior isn't tolerated?

* [Contributor Covenant](https://www.contributor-covenant.org/version/2/1/code_of_conduct/code_of_conduct.md) (the most used one, ![Contributor Covenant](https://img.shields.io/badge/Contributor%20Covenant-2.1-4baaaa.svg))
* Write your own

➡️ See also [Contributor License Agreements (CLAs)](https://cla-assistant.io/).

<br>

#### 🍒 SECURITY.md

This file explains which versions are eligible for security patches, for how long they will be receiving patches (LTS/...), and what's the process to report a vulnerability.
</div><div>

#### 🍒 CHANGELOG.md

Keep track of every change. See [keepachangelog.com](https://keepachangelog.com/en/).

* 🗓️  From the latest changes to the oldest ones
* ✍️For each version
  * Give the release date (YYYY-MM-DD)
  * Tell what was added/changed/deprecated/removed/fixed
  * You may link issues, pull requests, and commits
* Changes that were not released are usually in "[Unreleased]"

> See [conventional-changelog](https://github.com/conventional-changelog) and [github-changelog-generator](https://github.com/github-changelog-generator/github-changelog-generator).

<br>

#### 🍒 ROADMAP.md

A roadmap help other know the direction that the project will take, like what features are you planning to add.

* What's the project goal (short/mid/long term)?
* How can people can get involved?
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