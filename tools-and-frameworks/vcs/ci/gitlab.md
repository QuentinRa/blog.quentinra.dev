# GitLab CI/CD workflow

<div class="row row-cols-md-2"><div>

GitLab [CI/CD](index.md) is relatively limited, especially in the free version. For instance, most interfaces to display results are rudimentary or paid.

* [CI/CD Documentation](https://docs.gitlab.com/ee/topics/build_your_application.html) ⛪
* [Code coverage Documentation](https://docs.gitlab.com/ee/ci/testing/code_coverage.html) ✍️
* [Code quality Documentation](https://docs.gitlab.com/ee/ci/testing/code_quality.html) 🧼
* [Unit tests Documentation](https://docs.gitlab.com/ee/ci/testing/unit_test_reports.html) 🧪
* [Security tools Documentation](https://docs.gitlab.com/ee/user/application_security/secure_your_application.html) 🛡️

We assume you're familiar with GitLab, and already have a project created with **Maintainer+** access on it.

To [enable CI/CD](https://docs.gitlab.com/ee/ci/enable_or_disable_ci.html#enable-cicd-in-a-project), go to `Settings > General > Visibility [...] > Repository` and enable `CI/CD`. Don't forget to save changes.
</div><div>

**Terminology**

* **Jobs** ⚒️: a task such as "build project" or "run tests". It's basically a set of commands to accomplish a goal.

* **Stages** 🗃️: jobs are sorted in stages <small>(ex: Build, Test, Deploy)</small>. We commonly have the order: `Build > Test > Deploy`.

* **Pipeline** 🚀: an execution of the stages, on the code associated with a specific commit/branch. The pipeline will fail if a job fails.

The pipeline status is visible next to each commit: ![pipeline success](_images/pipeline_success.png) <small>(passed)</small>.
</div></div>

<hr class="sep-both">

## Runners

<div class="row row-cols-md-2"><div>

A [**runner**](https://docs.gitlab.com/runner/) is an agent running the jobs, e.g., executing the commands.

* **Project runner** 🏠: available to a single project
* **Group runner** 🏘️: available to any project in a group
* **Shared runner** 🍾: available to any project

👉 Only shared runners are available when using [GitLab.com](https://gitlab.com/).

Runners are associated with an [**executor**](https://docs.gitlab.com/runner/#executors). It's the environment used to execute commands, such as a shell or a docker.
</div><div>

...
</div></div>

<hr class="sep-both">

## The .gitlab-ci.yml File

<div class="row row-cols-md-2"><div>

It's a [YAML](/programming-languages/others/data/yaml.md) file. When using the online editor, in `CI/CD > Editor` <small>(you can select the file and the branch)</small>:

* you know if the file is valid or not 🚀
* you can visualize the pipeline 🔎
* you can see the merged YAMl 💵 <small>(useful if you use templates)</small>
* ...

#### Stages

The first step is usually to define the stages:

```yaml!
...
```
</div><div>

#### Variables

```yaml!
...
```
</div></div>

<hr class="sep-both">

## 👻 To-do 👻

Stuff that I found, but never read/used yet.

<div class="row row-cols-md-2"><div>

* how to trigger the pipeline
* Fix the path to enable gitlab ci
* How to register a runner/... (tags...)
* Logs
* Artifacts, Jobs retries
</div><div>


</div></div>