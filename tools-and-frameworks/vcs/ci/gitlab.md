# GitLab CI/CD workflow

<div class="row row-cols-md-2"><div>

GitLab [CI/CD](index.md) is relatively limited, especially in the free version. For instance, most interfaces to display results are rudimentary or paid.

* [CI/CD Documentation](https://docs.gitlab.com/ee/topics/build_your_application.html) ⛪
* [Code coverage Documentation](https://docs.gitlab.com/ee/ci/testing/code_coverage.html) ✍️
* [Code quality Documentation](https://docs.gitlab.com/ee/ci/testing/code_quality.html) 🧼
* [Unit tests Documentation](https://docs.gitlab.com/ee/ci/testing/unit_test_reports.html) 🧪
* [Security tools Documentation](https://docs.gitlab.com/ee/user/application_security/secure_your_application.html) 🛡️ <small>(static analysis...)</small>

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
stages:
  - build
  - test
  - deploy
```

<br>

#### Variables

You can declare variables globally or inside a job.

```yaml!
variables:
  VAR_NAME: "some value"
  VAR_NAME_2: "$VAR_NAME/2"   # can use variables

job:
  stage: build
  script: # usages (quoted + ${}, or unquoted)
    - echo "$VAR_NAME ${VAR_NAME_2}" $VAR_NAME
```

➡️ See also: [external secrets](https://docs.gitlab.com/ee/ci/secrets/).
</div><div>
</div></div>

<hr class="sep-both">

## CI Templates

<div class="row row-cols-md-2"><div>

```
variables:
  VAR_NAME: "some value"
  
include:
  - project: 'whole/path/to/project'
    file: 'xxx.yml'
    ref: 'main'
```
</div><div>

```
task:
  before_script:
    - xxx
  script:
    - yyy    
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

```
job-a:
  artifacts:
    paths:
      - folder/

# inherit folder from "job-a"
job-b:
  dependencies:
    - job-a
```

</div><div>

```
cache:
  paths:
    - /xxx/

job-b:
  rules:
    - if: $CI_COMMIT_BRANCH == "main"
      when: always
    - if: $CI_COMMIT_TAG
      when: always
  only:
    - master
```

```yaml!
image: xxx:5000/docker_img
# not loading .bashrc

variables:
  GIT_STRATEGY: none # empty clone
  # $CI_PROJECT_NAME $CI_COMMIT_REF_NAME

  script:
    - xxx || true
    - "command here"
    - git clone https://gitlab-ci-token:${CI_JOB_TOKEN}@example.com/XXX
    - sed -i 's/xxx/yyy'$(echo $XXX | sed 's/\//\\\//g')'\/yyy/g' file
    - "line=$(($(grep -n "xxx" file | cut -d: -f1) - 1))"
    - sed -i $line' i xxx'
    - sed -i $line' i \\txxx'
before_script:
after_script:

  artifacts:
    when: always
    reports:
      junit: "*_tests.xml"
    expire_in: 3 days
```
</div></div>