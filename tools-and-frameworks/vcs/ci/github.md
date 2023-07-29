# GitHub

<div class="row row-cols-md-2"><div>

...
</div><div>

...
</div></div>

<hr class="sep-both">

## 👻 To-do 👻

Stuff that I found, but never read/used yet.

<div class="row row-cols-md-2"><div>

**GitHub Actions**

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
</div><div>

**Dependabot**

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
</div></div>