# GitHub Actions

<div class="row row-cols-md-2"><div>

GitHub Actions were introduced in 2018 to design CI/CD workflow for GitHub projects. Actions are small reusable code that simplifies the process of creating a CI/CD workflow. 

* [GitHub Actions Marketplace](https://github.com/marketplace) (19k actions)
* [GitHub Actions Documentation](https://docs.github.com/actions)
* [GitHub Actions Quickstart](https://docs.github.com/en/actions/quickstart)
* [GitHub Awesome Actions](https://github.com/sdras/awesome-actions) (21.6k ⭐)
* [GitHub Workflow Syntax](https://docs.github.com/en/actions/using-workflows/workflow-syntax-for-github-actions) (⛪)
</div><div>

...
</div></div>

<hr class="sep-both">

<div class="row row-cols-md-2"><div>

## Basic syntax

Workflows are defined in [YAML](/programming-languages/others/data/yaml.md) files stored in `.github/workflows/`. Their name is based on the YAML file name, e.g., `Build` for `build.yml`.

A basic Action executing `job_name` on every `push`:

```yaml!
name: Action Name

on: [push]

jobs:
  job_name:
    runs-on: ubuntu-latest
    steps:
    # unnamed command
    - run: echo "Hello, World!"
    # named command
    - name: Saying Hello
      run: echo "Hello, World!"
```
</div><div>

A runner is an agent executing commands. The `runs-on` parameter designates which runner to use. You can use [GitHub-hosted runners](https://docs.github.com/en/actions/using-workflows/workflow-syntax-for-github-actions#choosing-github-hosted-runners) such as `ubuntu-latest` or `windows-latest` or use [self-hosted runners](https://docs.github.com/en/actions/hosting-your-own-runners/managing-self-hosted-runners/about-self-hosted-runners).

A common action is `checkout` to clone your repository:

```yaml!
    - name: Check out repository code
      uses: actions/checkout@v3
```

For each step, you may use these optional attributes:

```
      - name: XXX
        # only execute based on a condition
        if: runner.os == 'Windows'
        # run multiple commands
        run: |
          xxx
          xxx
        env: # set an environment variable
          XXX: xxx
```
</div></div>

<hr class="sep-both">

## Advanced syntax

<div class="row row-cols-md-2"><div>

#### Trigger

The [`on` keyword](https://docs.github.com/en/actions/using-workflows/events-that-trigger-workflows) determines what events can trigger a workflow.

```yaml!
on:
  pull_request:         # on any pull request

on:
  push:                 # push on main
    branches: [ main ]
  pull_request:         # merge request on main
    branches: [ main ]
  schedule:             # automatically
    - cron: '0 3 * * 5'
```
</div><div>

#### Strategy

The [`strategy` keyword](https://docs.github.com/en/actions/using-workflows/workflow-syntax-for-github-actions#jobsjob_idstrategy) let us define variables. The job below will be executed `4` times as we have `4` values <small>(cartesian product of all variables)</small>.

```yaml!
    strategy:
      matrix:
        some_variable: [10, 11, 12, 13]

    steps:
      - name: Use Version ${{ matrix.some_variable }}
        run: echo "use version ${{ matrix.some_variable }}"

```
</div></div>

<hr class="sep-both">

## Some actions

<div class="row row-cols-md-2"><div>

#### Java actions

[actions/setup-java](https://github.com/actions/setup-java) to install and configure Java.

```yaml
    - name: Set up JDK 16
      uses: actions/setup-java@v2
      with:
        java-version: '16'
        distribution: 'adopt'

    - name: Run gradle tests
      uses: gradle/gradle-build-action@v2
      with:
        arguments: test
```

➡️ See also: [gradle-wrapper-validation](https://github.com/gradle/wrapper-validation-action).

#### OCAML actions

[ocaml/setup-ocaml](https://github.com/ocaml/setup-ocaml) to install and configure OCaml.

```yaml!
      - name: Use OCaml 4.13.1
        uses: ocaml/setup-ocaml@v2
        with:
          ocaml-compiler: 4.13.1
```
</div><div>

#### Node.js actions

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

[github/codeql-action](https://github.com/github/codeql-action) for CodeQL static code analysis.

#### Code quality analysis

[JetBrains/qodana-action](https://github.com/JetBrains/qodana-action) for Qodana code quality analysis.
</div></div>

<hr class="sep-both">

## 👻 To-do 👻

Stuff that I found, but never read/used yet.

<div class="row row-cols-md-2"><div>

* [Running jobs in a container](https://docs.github.com/en/actions/using-jobs/running-jobs-in-a-container)
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