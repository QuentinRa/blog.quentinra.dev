# Git projects

<div class="row row-cols-md-2"><div>

You can find notes about Git [here](/it/dev/git/index.md). Here, I will assume that you're already familiar with Git, and you will notes about stuff like

* 📦 Basic files: README.md, LICENSE, and .gitignore
* 🍒 Special files: CONTRIBUTING.md
* 🏹 Server-side features
* 👌 Good practices
* ...
</div><div>

This imaged tutorial about [GitHub for collaboration](https://mozillascience.github.io/working-open-workshop/github_for_collaboration/) is quite good.
</div></div>

<hr class="sep-both">

## 📦 Basic files 📦

<div class="row row-cols-md-2 mt-3"><div>

#### README.md

...
</div><div>

...
</div></div>

<hr class="sep-both">

## 🍒 Special files 🍒

<div class="row row-cols-md-2 mt-3"><div>

#### CONTRIBUTING.md

...
</div><div>

...
</div></div>

<hr class="sep-both">

## 🏹 Server-side features 🏹

<div class="row row-cols-md-2 mt-4"><div>

* ➡️ **Issues**

When someone found a bug/problem with the project, they will usually create an issue. [See GitHub tutorial](https://guides.github.com/features/issues/).

On GitHub/GitLab/???, you can create issue templates.

> To create a template, go to <kbd>Options > Features > Issues</kbd>.<br>
> See [GitHub Issue templates](https://github.com/stevemao/github-issue-templates) (3.5k ⭐)

* ➡️ **Wiki**

The wiki is used by developers to write some primitive documentation that is store "near" your project. You can add images inside, that are stored in your repository <small>(try with/without a leading `/`)</small>.

You can clone your wiki with `.wiki.git` instead of `.git`!

* ➡️ **Forks**

Usually, repositories do not allow everyone to contribute. Instead, they can fork the repository, which will create a copy that they own. They will work on it, and they will be able to create a Pull Request to the original repository, that may be merged by the original repository's maintainers. [See GitHub tutorial](https://docs.github.com/en/get-started/quickstart/fork-a-repo).
</div><div>

* ➡️ **Pull requests** (PR) / Merge requests

In most cases, developers establish a formal procedure to merge branches into main. Anyone will have to create a Pull Request asking if they can merge. Then, reviewers will check the code, and allow master/main to be modified. [See GitHub tutorial](https://docs.github.com/en/github/collaborating-with-issues-and-pull-requests/proposing-changes-to-your-work-with-pull-requests/creating-a-pull-request).

On GitHub/???, you can create pull requests templates.

> See [GitHub Issue templates](https://github.com/stevemao/github-issue-templates) (3.5k ⭐)

* ➡️ **References** 🏹

I'm still not sure if this is only available on GitHub or not, but every issue/pull request as an Id, for instance, `#1`. You can reference this Id anywhere else, for instance, inside a commit! At least on GitHub, on the issue/Pull request page, we will see the referencing commit SHA1.

> On GitHub, you can also reference a user with `@username`.

</div></div>

<hr class="sep-both">

## ✍️ GitHub exclusive features ✍️

<div class="row row-cols-md-2 mt-4"><div>

* ➡️ **GitHub Actions**

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
</details>
</div><div>

* ➡️ **Dependabot**

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

* ➡️ **Projects**

This is a feature that includes Agile-Scrum Scrum boards. It's actually a bit more complex and less convenient. You can create **tasks**, but you can't do much with them. Once you convert them to **issues**, you can assign people to them along with tags. They are useful to track/sort **issues** and keep track of **milestones**.
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
* [Jokes' Cards](https://readme-jokes.vercel.app/api)
</div></div>

<hr class="sep-both">

## 👻 To-do 👻

Stuff that I found, but never read/used yet.

<div class="row row-cols-md-2"><div>

Continuous Integration (CI)

* [Heroku](https://www.heroku.com/home) / [Heroku (student)](https://www.heroku.com/students)
</div><div>


</div></div>