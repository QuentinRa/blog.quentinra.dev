# GitHub Actions

<div class="row row-cols-md-2"><div>

GitHub Actions were introduced in 2018 to design CI/CD workflow for GitHub projects. Actions are small reusable code that simplifies the process of creating a CI/CD workflow. 

* [GitHub Actions Marketplace](https://github.com/marketplace) (19k actions)
* [GitHub Actions Documentation](https://docs.github.com/actions)
* [GitHub Actions Quickstart](https://docs.github.com/en/actions/quickstart)
* [GitHub Awesome Actions](https://github.com/sdras/awesome-actions) (21.6k ⭐)
</div><div>

...
</div></div>

<hr class="sep-both">

<div class="row row-cols-md-2"><div>

```yaml
name: Action Name

jobs:
  job_name:
    runs-on: yyy
    steps:
    # unnamed
    - run: xxx
    # named
    - name: XXX
      run: xxx
```
</div><div>

* `ubuntu-latest`

```yaml!
    - name: Check out repository code
      uses: actions/checkout@v3
```
</div></div>

<hr class="sep-both">

## XXX

<div class="row row-cols-md-2"><div>

#### Trigger

```yaml!
on: [push]              # push on any branch

on:
  push:                 # push on main
    branches: [ main ]
  pull_request:         # merge request on main
    branches: [ main ]
  schedule:             # automatically
    - cron: '0 3 * * 5'
```
</div><div>

...
</div></div>

<hr class="sep-both">

## Some actions

<div class="row row-cols-md-2"><div>

#### Java setup

[actions/setup-java](https://github.com/actions/setup-java) to install and configure Java.

```yaml!
    - name: Set up JDK 16
      uses: actions/setup-java@v2
      with:
        java-version: '16'
        distribution: 'adopt'
```
</div><div>

#### Node.js setup

[actions/setup-node](https://github.com/actions/setup-node) to install and configure Node.

```yaml!
    - name: Use Node.js 16.16.0
      uses: actions/setup-node@v2
      with:
        node-version: 16.16.0
    - run: npm ci
    - run: npm run build --if-present
    - run: npm test
```

#### Cache build

[actions/cache](https://github.com/actions/cache) to cache build results.

#### Static code analysis

[github/codeql-action](https://github.com/github/codeql-action) for CodeQL analysis.
</div></div>

<hr class="sep-both">

## 👻 To-do 👻

Stuff that I found, but never read/used yet.

<div class="row row-cols-md-2"><div>

```yaml
# run a command
- run: git clone URL/repository.git other-repository-folder-name
```

Others

* [actions/setup-java](https://github.com/actions/setup-java): install Java
* [awesome-actions](https://github.com/sdras/awesome-actions)

GitHub offers a CI/CD platform called GitHub actions to define CI/CD workflows. Workflows are [YAML](/programming-languages/others/data/yaml.md) files stored in `.github/workflows/`.
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