# Git projects

<div class="row row-cols-md-2"><div>

You can find notes about Git [here](/it/dev/git/index.md). Here, I will assume that you're already familiar with Git, and you will notes about stuff like

* 📦 Basic files: README.md, LICENSE, and .gitignore
* 🍒 Special files: CONTRIBUTING.md, CHANGELOG.md...
* 🏹 Server-side features
* 🌞 Good practices
* ...
</div><div>

This imaged tutorial about [GitHub for collaboration](https://mozillascience.github.io/working-open-workshop/github_for_collaboration/) is quite good.
</div></div>

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

## 🏹 Server-side features 🏹

<div class="row row-cols-md-2 mt-4"><div>

#### 🏹 Issues

When someone found a bug/problem with the project, they will usually create an issue. [See GitHub tutorial](https://guides.github.com/features/issues/).

On GitHub/GitLab/???, you can create issue templates.

> See <kbd>Options > Features > Issues</kbd> on GitHub.<br>
> See [GitHub Issue templates](https://github.com/stevemao/github-issue-templates) (3.5k ⭐)

<br>

#### 🏹 Wiki

The wiki is used by developers to write some primitive documentation that is store "near" your project. You can add images inside, that are stored in your repository <small>(try with/without a leading `/`)</small>.

You can clone your wiki with `.wiki.git` instead of `.git`!

<br>

#### 🏹 Forks

Usually, repositories do not allow everyone to contribute. Instead, they can fork the repository, which will create a copy that they own. They will work on it, and they will be able to create a Pull Request to the original repository, that may be merged by the original repository's maintainers. [See GitHub tutorial](https://docs.github.com/en/get-started/quickstart/fork-a-repo).
</div><div>

#### 🏹 Pull Requests (PR) / Merge requests

In most cases, developers establish a formal procedure to merge branches into main. Anyone will have to create a Pull Request asking if they can merge. Then, reviewers will check the code, and allow master/main to be modified. [See GitHub tutorial](https://docs.github.com/en/github/collaborating-with-issues-and-pull-requests/proposing-changes-to-your-work-with-pull-requests/creating-a-pull-request).

On GitHub/???, you can create pull requests templates.

> See [GitHub Issue templates](https://github.com/stevemao/github-issue-templates) (3.5k ⭐)

<br>

#### 🏹 References

I'm still not sure if this is only available on GitHub or not, but every issue/pull request as an Id, for instance, `#1`. You can reference this Id anywhere else, for instance, inside a commit! At least on GitHub, on the issue/Pull request page, we will see the referencing commit SHA1.

> On GitHub, you can also reference a user with `@username`.

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

## ✍️ GitHub exclusive features ✍️

<div class="row row-cols-md-2 mt-4"><div>

#### ✍️GitHub Actions

GitHub Actions are some code that is run every time a commit/a pull request/... is made. This is up to you. For instance, you could run some tests. [See this tutorial](https://docs.github.com/en/actions/quickstart).

On a repository, go to the action tab, select an action, and it will autogenerate a template for you to add it into your project.

<details class="details-e">
<summary>Notes</summary>

```yaml
# run a command
- run: git clone URL/repository.git other-repository-folder-name
```

Others

* [actions/setup-java](https://github.com/actions/setup-java): install Java
* [awesome-actions](https://github.com/sdras/awesome-actions)
</details>

<br>

#### ✍️Co-authors

If you know someone else email, then you can include them as author of a commit. Note that the one creating the commit (you) will be marked as commiter, so there will always be at least two names, unless you directly edit the GIT configuration 🚓.

```bash
git commit -m "xxx

Co-authored-by: name <name@example.com>"
```

<br>

#### ✍ Reference code in issues

There is a nice way of referencing code from the same repository inside an issue/a pull request. See [GitHub tutorial](https://docs.github.com/en/issues/tracking-your-work-with-issues/creating-an-issue#creating-an-issue-from-code).

* Open the target file
* Click on the line number of the line you want to reference
* Hold Shift and press another line to select an interval
* Click on "..."
* Copy permalink
* Then simply paste the permalink inside an issue/a pull request

> It won't always work. In such cases, simply click on "..." on a file, get the permalink, and append to it `#LX` <small>(line X)</small> or `#LX-LY` <small>(line X to line Y)</small>.

</div><div>

#### ✍️CODEOWNERS

This file is a dictionary with patterns associated with GitHub usernames. Repositories can be configured so that if a file owned by a codeowner is modified, then inside the Pull Request, the CodeOwner will be asked for a review. See [GitHub tutorial](https://docs.github.com/en/repositories/managing-your-repositorys-settings-and-features/customizing-your-repository/about-code-owners).

```
*       @QuentinRa
```

<br>

#### ✍️Git attributes

While the file `.gitattribute` is not exclusive to GitHub, it is used by GitHub [linguist](https://github.com/github/linguist/tree/master/docs) if we want to edit the rules that GitHub uses to determine languages used by our project.

```
# Ex: add Markdown files in the language list
*.md linguist-documentation=false linguist-detectable=true
```

<br>

#### ✍️Dependabot

A bot checking your dependencies, and creating pull-request with the new version that you're suggested to update to. [See this tutorial](https://docs.github.com/en/code-security/dependabot/dependabot-version-updates/configuring-dependabot-version-updates#enabling-dependabot-version-updates).

<details class="details-e">
<summary>Examples</summary>

```yaml
version: 2
updates:
  - package-ecosystem: "gradle"
    directory: "/"
    schedule:
      interval: "daily"
```

```yaml
version: 2
updates:
  - package-ecosystem: "npm"
    directory: "/"
    schedule:
      interval: "daily"
      time: "13:00"
    open-pull-requests-limit: "99"
    versioning-strategy: "increase"
```
</details>

<br>

#### ✍️Projects

This is a feature that includes Agile-Scrum Scrum boards. It's actually a bit more complex and less convenient. You can create **tasks**, but you can't do much with them. Once you convert them to **issues**, you can assign people to them along with tags. They are useful to track/sort **issues** and keep track of **milestones**.

<br>

#### ✍️Random

List of stuff that I have yet to test out.

* [CITATION files](https://docs.github.com/en/repositories/managing-your-repositorys-settings-and-features/customizing-your-repository/about-citation-files) (👻)
* **Templates**: see [git-repository-template](https://github.com/misitebao/template-git-repository) / [opensource-template](https://github.com/EmbarkStudios/opensource-template)
</div></div>

<hr class="sep-both">

## 🎉 Fancy GitHub 🎉

<div class="row row-cols-md-2 mt-4"><div>

General

* [Skyline with your contributions](https://skyline.github.com/)

* [GitHub User Profile](https://docs.github.com/en/account-and-profile/setting-up-and-managing-your-github-profile/customizing-your-profile/managing-your-profile-readme)

* [GitHub Organization Profile](https://github.blog/changelog/2021-09-14-readmes-for-organization-profiles/)

</div><div>

Cards (usually added on a profile/...)

* [GitHub Stats Card](https://github.com/anuraghazra/github-readme-stats)
  * User stats
  * Repository Card
  * Most used languages
  * WakaTime
* [GitHub Profile Trophy](https://github.com/ryo-ma/github-profile-trophy)
* [metrics](https://github.com/lowlighter/metrics) (really nice cards, see [omBratteng profile](https://github.com/omBratteng/omBratteng))
* [Jokes' Cards](https://readme-jokes.vercel.app/api)
</div></div>

<hr class="sep-both">

## 🚀 Continuous integration (CI) 🚀

<div class="row row-cols-md-2"><div>

There are many tools out there providing features for open-source project, such as watching dependencies to detect vulnerabilities, find vulnerabilities/code smells/... in the code...

**Code quality and reviews**

* [sonarcloud](https://sonarcloud.io) (quite a lot of feedback)
* [codefactor](https://www.codefactor.io/) (good)
* [deepsource](https://deepsource.io/) (not very deep)
* lgtm.com (deprecated, see [code scanning](https://docs.github.com/en/code-security/code-scanning/automatically-scanning-your-code-for-vulnerabilities-and-errors/about-code-scanning))
* [codecov](https://about.codecov.io/) (👻)
* [codacy](https://www.codacy.com/) (👻)
* [scrutinizer-ci](https://scrutinizer-ci.com/) (👻)
* [CircleCI](https://circleci.com/) (👻)
</div><div>

**Others**

* [weblate](https://weblate.org/) (👻, paid, continuous localization)
* [snyk](https://snyk.io/) (security, good)

**Language-specific**

* [StyleCI](https://styleci.io/) (style for PHP/CSS/JS)
* [packagist](https://packagist.org/) (PHP packages)
* [deps.rs](https://deps.rs/) (Rust dependencies alerts)
* [DavidDM](https://david-dm.org/) (Node.js dependencies)
* [PackageQuality](https://packagequality.com/) (npm packages)
</div></div>

<hr class="sep-both">

## 👻 To-do 👻

Stuff that I found, but never read/used yet.

<div class="row row-cols-md-2"><div>

Continuous Integration (CI)

* [Heroku](https://www.heroku.com/home) / [Heroku (student)](https://www.heroku.com/students)
* Git Hooks and [husky](https://github.com/typicode/husky)
* [Basics of CI/CD](https://levelup.gitconnected.com/basics-of-ci-cd-a98340c60b04)

Badges

* [OpenSSF Best Practices Badge](https://github.com/coreinfrastructure/best-practices-badge)
* [holopin](https://www.holopin.io/)

GitHub features

* Discussions
</div><div>

Random

* [GitHub Cheat Sheet](https://github.com/tiimgreen/github-cheat-sheet)
* [branch protection rule](https://docs.github.com/en/repositories/configuring-branches-and-merges-in-your-repository/defining-the-mergeability-of-pull-requests/managing-a-branch-protection-rule)
* [controlook-zz](https://github.com/controlook-zz/standards) or [Git Commit Message](https://cbea.ms/git-commit/#seven-rules) and [code-review-tips](https://github.com/ryanmcdermott/code-review-tips)
* [About READMEs](https://docs.github.com/en/repositories/managing-your-repositorys-settings-and-features/customizing-your-repository/about-readmes)
* [opensource.guide](https://opensource.guide/)
* [best practices CII/FLOSS](https://bestpractices.coreinfrastructure.org/fr)
* [best practices CII/FLOSS - GitHub](https://github.com/coreinfrastructure/best-practices-badge)
* [Government best practices](https://government.github.io/best-practices/)
* [Working Open Workshop](https://mozillascience.github.io/working-open-workshop/)
* [fossa](https://fossa.com/) (+badge)
* [codetriage](https://www.codetriage.com/) (get issues from your favorites repos in your inbox)
* [opencollective](https://opencollective.com/)
* [cla-assistant](https://cla-assistant.io/)
* [gitter](https://gitter.im/)
</div></div>