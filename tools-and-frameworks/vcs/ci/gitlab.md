# GitLab CI/CD workflow

<div class="row row-cols-md-2"><div>

GitLab [CI/CD](index.md) is relatively limited, especially in the free version. For instance, most interfaces to display results are rudimentary or paid.

* [CI/CD Documentation](https://docs.gitlab.com/ee/topics/build_your_application.html) ⛪
* [Code coverage Documentation](https://docs.gitlab.com/ee/ci/testing/code_coverage.html) ✍️
* [Code quality Documentation](https://docs.gitlab.com/ee/ci/testing/code_quality.html) 🧼
* [Unit tests Documentation](https://docs.gitlab.com/ee/ci/testing/unit_test_reports.html) 🧪
* [Security tools Documentation](https://docs.gitlab.com/ee/user/application_security/secure_your_application.html) 🛡️
</div><div>

**Terminology**

* **Jobs** ⚒️: a task such as "running tests". It's basically a set of commands to accomplish a goal.

* **Stages** 🗃️: tasks are sorted in stages. We usually run tasks from the stage "Build", then "Test", then "Deploy".

* **Pipeline** 🚀: an execution of the tasks on the code associated with a specific commit/branch.
</div></div>