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

GitLab runners are managed by a service called `gitlab-runner`. You can [find instructions here](https://docs.gitlab.com/runner/install/) to install it.

Some commands you might use:

```shell!
$ sudo gitlab-runner -h
$ # you may use a new user
$ sudo gitlab-runner install --user=xxx --working-directory=yyy
$ sudo gitlab-runner start
$ sudo gitlab-runner list
$ sudo gitlab-runner verify --delete # delete "dead" runners
```
</div><div>

```shell!
$ # use --tls-ca-file=xxx.crt if you've CA problems
$ sudo gitlab-runner register --url URL --registration-token XXX
Enter a description
Enter tags (cannot be edited, can be used to assign jobs)
Enter a maintenance note
Enter an executor (docker, shell, ...)
$ sudo gitlab-runner verify
$ sudo gitlab-runner restart
```

Once created, the runner can be configured, to some extent, by editing `/etc/gitlab-runner/config.toml`. For instance, you could:

* use a custom helper image <small>(docker executor, `helper_image = ""`)</small>
* change the default docker image <small>(docker executor, `image = ""`)</small>
* add docker volumes <small>(docker executor, `volumes = []`)</small>
* ...

Don't forget to restart after any change:

```shell!
$ sudo gitlab-runner restart
```
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

It's possible to extract some logic into a reusable YAML template. The aforementioned template can be included using various ways. One is:

```yaml!  
include:
  # include https://example.com/path/to/project
  - project: 'path/to/project'
    file: 'xxx.yml'
    ref: 'main'
```

Once loaded, you can override tasks and variable from the template.
</div><div>

Assuming the template has a variable `VAR_NAME`, declaring a variable with the same name in the including file will override its value.

Assuming the template has a task `some_task`, then we may further tune it in the including file <small>(check the merged YAML view to see what happens)</small>.

```yaml!
some_task:       # task declared in the template
  before_script: # we can add new properties
    - xxx
  script:        # we can override a property's value
    - yyy    
```
</div></div>

<hr class="sep-both">

## GitLab custom badges

<div class="row row-cols-md-2"><div>

GitLab offers 3 [badges](https://docs.gitlab.com/ee/user/project/badges.html): pipeline status, coverage status, and release status. It's possible to use [external APIs]() for public projects. Otherwise, a common solution is to build badges during CI pipeline.

🧨 A major downside is that badges are NOT shown when a pipeline fails. A possible solution <small>(not tested)</small> is to save badges somewhere instead of using artifacts <small>(ex: make CI commit to a branch)</small>.

👉 You'll need to pull the image `xxx`. In the code sample, it's assumed to be available at `xxx:5000/anybadge`, but you can change it.

To load a badge, go to `Settins > General > Badges`. Assuming the job is called `generate_badges` and the badge is `badge.svg`, the URL is: `https://example.com/%{project_path}/-/jobs/artifacts/%{commit_sha}/raw/badge.svg?job=generate_badges`
</div><div>

```yaml!
generate_badges:
  script:
    # output is a sort of: [ hello ][  world  ]
    #              colors: [ black ][  red  ]
    - badge_label="hello"
    - badge_text="world"
    - badge_color="red"
    - docker run --rm -v $(PWD):/src xxx:5000/anybadge anybadge --value="$badge_text" --file=badge.svg --label="$badge_label" -c=$badge_color -o
  artifacts:
    paths:
      - badge.svg
```

If needed, you can use `test` and `&&/||` to write conditionals:

```yaml!
    - res=$(exit 0)
    - badge_color=$(test $res -eq 0 && echo "green" || echo "red")
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
* Webhook
* Each task can use a different docker image, different runner, and env is reset between jobs
* Exit 0, Exit 1

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
allow_failure: true

  artifacts:
    when: always
    reports:
      junit: "*_tests.xml"
      codequality: "report.json"
    expire_in: 3 days
```

```yaml!
default:
  tags:
    - xx
```

[bug](https://docs.gitlab.com/runner/shells/index.html#shell-profile-loading)
</div></div>