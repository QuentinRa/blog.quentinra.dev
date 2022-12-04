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

## ✍️ GitHub exclusive features ✍️

<div class="row row-cols-md-2 mt-4"><div>

* **GitHub Actions**

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

* **Dependabot**

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

* **Projects**

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