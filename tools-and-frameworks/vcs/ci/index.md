# CI/CD workflow

<div class="row row-cols-md-2"><div>

**Continuous integration** (CI) 🏭 refers to the implementation of an ongoing workflow that is executed regularly within the development process. Common tasks often found in CI workflows:

* **Code Compilation** 📦: compile the project
* **Testing** 🧪: execute unit tests, ui tests...
* **Code analysis** 🪲: execute static and/or dynamic code analysis... to find bugs, code smells, dead code...
* **Code quality** 🫧: formatting, code style...
* ...
</div><div>

**Continuous development** (CD) 🚚 further extend it with the continuous deployment of artifacts. Common tasks are:

* **Monitoring** 📝: generate and alert about metrics such as tests failed, code analysis failed, code quality not met...
* **Documentation** 📚: deploy generated documentation website
* **Release** 🌍: deploy a release build
* ...

All tasks may be executed on-demand or on specific events.
</div></div>

<hr class="sep-both">

## Benefits

<div class="row row-cols-md-2"><div>

#### Testing

You can configure your workflow to test your code in different environments <small>(ex: Linux, Windows, macOS)</small> and using different versions of tools <small>(ex: different versions of node-js/java/...)</small>.
</div><div>

#### Isolation

Continuous workflow can work in isolated reproducible environment, hence ensuring that the code do work on other machines.

#### Save time

It may take some time to implement complex CI/CD workflows, but once implemented, it reduces the time taken to manually perform tasks that could be automated.
</div></div>

<hr class="sep-both">

## 🗃️  External Solutions  🗃️

<div class="row row-cols-md-2 mt-3"><div>

There are many tools that can be integrated during CI/CD workflows that provides code quality, security reviews, dependencies monitoring... Most are paid and free for open-source projects.

**Code quality, coverage, and reviews**

* [sonarcloud](https://sonarcloud.io) (quite a lot of feedback)
* [codefactor](https://www.codefactor.io/) (good)
* [deepsource](https://deepsource.io/) (not very deep)
* lgtm.com (deprecated, see [code scanning](https://docs.github.com/en/code-security/code-scanning/automatically-scanning-your-code-for-vulnerabilities-and-errors/about-code-scanning))
* [codecov](https://about.codecov.io/) (👻)
* [codacy](https://www.codacy.com/) (👻)
* [scrutinizer-ci](https://scrutinizer-ci.com/) (👻)
* [CircleCI](https://circleci.com/) (👻)
* [codeclimate](https://codeclimate.com/) (👻)
* [coveralls](https://coveralls.io/) (👻)
* [gerritcodereview](https://www.gerritcodereview.com/index.html) (👻)
</div><div>

**Security**

* [snyk](https://snyk.io/) (security, good)

**Language-specific**

* [StyleCI](https://styleci.io/) (👻, style for PHP/CSS/JS)
* [packagist](https://packagist.org/) (👻, PHP packages)
* [deps.rs](https://deps.rs/) (👻, Rust dependencies alerts)
* [DavidDM](https://david-dm.org/) (👻, Node.js dependencies)
* [PackageQuality](https://packagequality.com/) (👻, npm packages)

**Random**

* [weblate](https://weblate.org/) (👻, paid, continuous localization)
</div></div>

<hr class="sep-both">

## 👻 To-do 👻

Stuff that I found, but never read/used yet.

<div class="row row-cols-md-2"><div>

* [Basics of CI/CD](https://levelup.gitconnected.com/basics-of-ci-cd-a98340c60b04)
* [gitpod](https://www.gitpod.io/)
* [Travis](https://www.travis-ci.com/) (👻)
</div><div>
</div></div>