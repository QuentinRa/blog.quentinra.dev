# GitLab CI/CD workflow

<div class="row row-cols-md-2"><div>

GitLab [CI/CD](index.md) is well-known and popular mature solution for devops. From my perspective, GitLab CI free version is relatively limited. For instance, most interfaces to display CI results are rudimentary or paid.

* [CI/CD Documentation](https://docs.gitlab.com/ee/topics/build_your_application.html) ⛪
* [Code coverage Documentation](https://docs.gitlab.com/ee/ci/testing/code_coverage.html) ✍️
* [Code quality Documentation](https://docs.gitlab.com/ee/ci/testing/code_quality.html) 🧼
* [Unit tests Documentation](https://docs.gitlab.com/ee/ci/testing/unit_test_reports.html) 🧪
* [Security tools Documentation](https://docs.gitlab.com/ee/user/application_security/secure_your_application.html) 🛡️ <small>(static analysis...)</small>
* [GitLab templates](https://gitlab.com/gitlab-org/gitlab/-/tree/master/lib/gitlab/ci/templates) ✨

We assume you're familiar with GitLab, and already have a project created with **Maintainer+** access on it.
</div><div>

To [enable CI/CD](https://docs.gitlab.com/ee/ci/enable_or_disable_ci.html#enable-cicd-in-a-project), go to `Settings > General > Visibility [...] > Repository` and enable `CI/CD`. Don't forget to save changes.

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

It's a [YAML](/programming-languages/others/data/yaml.md) file. See the [reference](https://docs.gitlab.com/ee/ci/yaml/). When using the online editor, in `CI/CD > Editor` <small>(you can select the file and the branch)</small>:

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
  # GIT_STRATEGY: none # empty clone
  # see also: $CI_PROJECT_NAME (repository name)
  #           $CI_COMMIT_REF_NAME (commit name)

job:
  stage: build
  script: # usages (quoted + ${}, or unquoted)
    - echo "$VAR_NAME ${VAR_NAME_2}" $VAR_NAME
```

➡️ See also: [external secrets](https://docs.gitlab.com/ee/ci/secrets/) and [predefined variables](https://docs.gitlab.com/ee/ci/variables/predefined_variables.html).

<br>

#### Tags

If you add a tag to a job, then only runners having this tag can run it.

```yaml!
job:
  tags:
    - xxx
```
</div><div>

#### Image

You can declare the image to use globally or inside a job.

```yaml!
image: xxx:5000/docker_img
```

#### Default

You can use the [default](https://docs.gitlab.com/ee/ci/yaml/#default) keyword to set default properties.

```yaml!
default:
  tag:
    - xxx
```

#### Script

You can use [`before_script`](https://docs.gitlab.com/ee/ci/yaml/#before_script), [`script`](https://docs.gitlab.com/ee/ci/yaml/#script), and [`after_script`](https://docs.gitlab.com/ee/ci/yaml/#after_script) to write down the commands executed by the runner.

```yaml!
  script:
    - pwd          # a simple command call
    - "pwd"        # some complex command must be quoted

    - exit 0       # job success
    - exit 1       # job failure
    
    - xxx || true  # allow one command to fail

    # some "sed" that may be useful
    - sed -i 's/xxx/yyy'$(echo $XXX | sed 's/\//\\\//g')'\/yyy/g' file
    - "line=$(($(grep -n "xxx" file | cut -d: -f1) - 1))"
    - sed -i $line' i xxx'
    - sed -i $line' i \\txxx'
```

⚠️ Environment is reset between two jobs. See also: [artifacts](#artifacts).

⚠️ Commands are not exactly behaving the same as in your terminal.

```yaml!
# tested on a runner with a docker executor
   - source xxx.sh              # export XXX="..."
   - echo $XXX                  # XXX is empty
   - source xxx.sh && echo $XXX # XXX is not empty
```

Allowed repositories can be cloned from a pipeline.

```yaml!
    - git clone https://gitlab-ci-token:${CI_JOB_TOKEN}@example.com/XXX
```
</div></div>

<hr class="sep-both">

## Advanced usages

<div class="row row-cols-md-2"><div>

#### allow_failure

You can allow a job to fail without failing the pipeline. In such scenario, an orange icon with an exclamation mark will be shown.

```yaml!
job:
  allow_failure: true
```

#### when

You can use `when` to execute jobs conditionally.

```
job:
  when: on_failure   # a stage failed in the previous stage
  when: always       # even if pipeline fails
```

#### rules

You can use `rules` to conditionally add/remove a job.

```yaml!
job:
  rules:
    - if: $CI_COMMIT_BRANCH == "main"
      when: always
```

#### only

You can use `only` to execute jobs only on predefined branches.

```
job:
  only:
    - master
```
</div><div>

#### Artifacts

Artifacts can be used to pass files to following jobs or to export results for users to see or download them.

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

For instance, for [code quality](https://docs.gitlab.com/ee/ci/testing/code_quality.html) or [unit tests](https://docs.gitlab.com/ee/ci/testing/unit_test_reports.html) which are both free:

```yaml!
  artifacts:
    when: always
    reports:
      # shown in the pipeline "tests" tab
      junit: "*_tests.xml"
      # shown in the pipeline "code quality" tab
      codequality: "report.json"
    expire_in: 3 days
```
</div></div>

<hr class="sep-both">

## CI Templates

<div class="row row-cols-md-2"><div>

It's possible to extract some logic into a reusable YAML template. The aforementioned template can be [included](https://docs.gitlab.com/ee/ci/yaml/#include) using various ways. One is:

```yaml!  
include:
  # include https://example.com/path/to/project
  - project: 'path/to/project'
    file: 'xxx.yml'
    ref: 'main'
```

Once loaded, you can override jobs and variable from the template.
</div><div>

Assuming the template has a variable `VAR_NAME`, declaring a variable with the same name in the including file will override its value.

Assuming the template has a job `some_job`, then we may further tune it in the including file <small>(check the merged YAML view to see what happens)</small>.

```yaml!
some_job:       # job declared in the template
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
* Logs
* Webhook
</div><div>

```
cache:
  paths:
    - /xxx/
```
</div></div>