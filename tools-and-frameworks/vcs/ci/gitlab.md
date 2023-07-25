# GitLab CI/CD workflow

<div class="row row-cols-md-2"><div>

GitLab [CI/CD](index.md) is relatively limited, especially in the free version. For instance, most interfaces to display results are rudimentary or paid.

* [CI/CD Documentation](https://docs.gitlab.com/ee/topics/build_your_application.html) ⛪
* [Code coverage Documentation](https://docs.gitlab.com/ee/ci/testing/code_coverage.html) ✍️
* [Code quality Documentation](https://docs.gitlab.com/ee/ci/testing/code_quality.html) 🧼
* [Unit tests Documentation](https://docs.gitlab.com/ee/ci/testing/unit_test_reports.html) 🧪
* [Security tools Documentation](https://docs.gitlab.com/ee/user/application_security/secure_your_application.html) 🛡️

We assume you're familiar with GitLab, and already have a project created with **Maintainer+** access on it.

To enable CI/CD, go to `Settings > General > Visibility [...] > Project` and enable `CI/CD`. Don't forget to save changes.
</div><div>

**Terminology**

* **Jobs** ⚒️: a task such as "build project" or "run tests". It's basically a set of commands to accomplish a goal.

* **Stages** 🗃️: tasks are sorted in stages <small>(ex: Build, Test, Deploy)</small>. We commonly have the order: `Build > Test > Deploy`.

* **Pipeline** 🚀: an execution of the stages, on the code associated with a specific commit/branch. The pipeline will fails if a task fails.

The pipeline status is visible next to each commit: ![pipeline success](_images/pipeline_success.png) <small>(passed)</small>.
</div></div>