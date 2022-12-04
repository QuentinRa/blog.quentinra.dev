# Commits

In CONTRIBUTING.md, as you will see later, you have to define guidelines/a style for things such as commits. For instance, some are adding smileys and so [as you can see here](https://github.com/atom/atom/blob/master/CONTRIBUTING.md#git-commit-messages).

According to [Conventional Commits](https://www.conventionalcommits.org/en/v1.0.0/), the structure should be

```bash
<type>[(optional scope)]: <description>

[optional body]

[optional footer(s)]
```

with

* **type** (you may add a `!` before `:` for MAJOR changes)
  * build, docs, **feat** (=MINOR), **fix** (=PATCH), style, test
  * chore, ci, perf, refactor, revert, security
  * upgrading/downgrading dependencies
* **description**: short description, you may reference issues/pull requests
* **body**: a list of every change, one per line, or a complete description of your change
* **footer**: you may add "BREAKING CHANGE" (=MAJOR), Co-authored-by, Reviewed-by, Refs etc.

You may check that your message [is valid using commitlint](https://github.com/conventional-changelog/commitlint). If you don't understand **MAJOR.MINOR.PATCH**, check the section about versioning (a bit further).

<hr class="sl">

## CONTRIBUTING.md

Tell others, how they can contribute to your project.

* Maybe add a description/table of contents
* How **issues** are handled?
* How **pull requests** are handled?
* What **guidelines**/**style** are you following?
  * commits ([example](https://github.com/thiagodp/commitment/blob/master/rules-en.md))
  * code
  * documentation
* Where, and How, can we **ask a question**?
* Is there a place to **discuss**/**chat**?
* Example: [atom - CONTRIBUTING.md](https://github.com/atom/atom/blob/master/CONTRIBUTING.md)

<hr class="sr">

## CHANGELOG.md

This is useful to help the developers know what you did, or everything major that happened. The website [keep a changelog](https://keepachangelog.com/en/1.0.0/#how) is giving you a lot of help.

* latest to oldest
* for each version
  * give the release date (YYYY-MM-DD)
  * tell us what you added/changed
  * tell us what you deprecated/removed/fixed
  * you may link issues, pull requests, and commits

On GitHub, the **releases** could be an alternative to the CHANGELOG.md, or you can use both.

You got tools that may help you generate a changelog, but I didn't test them

* [github-changelog-generator](https://github.com/github-changelog-generator/github-changelog-generator)
* [conventional-changelog](https://github.com/conventional-changelog)

<hr class="sl">

## CODE_OF_CONDUCT.md

What behavior is tolerated? What's behavior isn't tolerated? You should explain this in the Code Of Conduct.

The most used template is the [Contributor Covenant (Markdown - 2.1)](https://www.contributor-covenant.org/version/2/1/code_of_conduct/code_of_conduct.md), you can [find the latest version here](https://www.contributor-covenant.org/).

You can add this badge too, if you're proud of it ![Contributor Covenant](https://img.shields.io/badge/Contributor%20Covenant-2.1-4baaaa.svg)

```markdown
[![Contributor Covenant](https://img.shields.io/badge/Contributor%20Covenant-2.1-4baaaa.svg)](CODE_OF_CONDUCT.md)
```

<hr class="sr">

## SECURITY.md

You should give a way for users to report any security-related issues. You may also write in this file, 

* which versions of your software will have security updates, 
* or for how much time you're planning to provide security updates, for each version

Sometimes, even if you moved to another major version (like from v1 to v2), you will still provide security updates for the previous versions. We usually call these versions "Long-Term Support" (LTS). For instance, Java LTS versions are released every 5 years, we got Java11 and soon Java17.

If you're tenacious and motivated, you might read [about security practices here](https://github.com/coreinfrastructure/best-practices-badge/blob/main/doc/security.md). I haven't read enough to make you a summary.

<hr class="sl">

## Templates

I'm including two things into "templates".

* **Repository templates**

Maybe someone already configured a repository for you. On GitHub, you can find "template" repositories that are expressly made to be used as a template. 

* [git-repository-template](https://github.com/misitebao/template-git-repository),
* [opensource-template](https://github.com/EmbarkStudios/opensource-template)

Note that you may find node-project templates too, etc.

* **Issues and pull requests templates**

I don't know if you can do that everywhere, but on GitHub, you can define templates for your issues and your pull requests. Everything is explained in the Git course.

<hr class="sr">

## Workflows

Usually, developers are configuring automatic testing or actions that are executed each time they're making a commit/pull request. An action could

* check that the code is compiling on some OS
* check that the code is covered by the tests
* check that you didn't have introduced a security breach
* ...

On GitHub, the concept of workflow is associated with the [notion of actions](https://fr.github.com/features/actions). You got a lot of tools/some help in the section about advanced concepts in the Git course.

<hr class="sl">

## Versioning

It seems that a lot of persons are using

* The [Semantic Versioning 2.0.0](https://semver.org/)
  * FORMAT: **MAJOR.MINOR.PATCH**
    * MAJOR: breaking change (of the API)
    * MINOR: non-breaking change, backward compatible
    * PATCH: internal change
  * **0.y.z**: in development
  * **1.y.z**: stable
  * you may add a tag like **1.0.0-alpha**
* You may also check [Calver](https://calver.org/)

<hr class="sr">

## ROADMAP.md

Sometimes, we are adding a ROADMAP, to help others get a hand of what we made, why, what are we doing now, and what are we planning to do in the future.

* welcome contributors
  * give a good first impression
  * project summary
  * how can we get involved?
* timeline
  * what you did?
  * what are you doing?
  * what are you planning to do?
  * You should talk about Short/Medium/Long terms

<hr class="sl">

## Bunch of notes

In an open-source project,

* make every discussion public
* check the license of the libraries you're using
* try to answer any issues/pull requests within 48 hours, give feedback and gratitude to your contributors
* **CODEOWNERS**: at least on GitHub, you can create a file called [CODEOWNERS](https://docs.github.com/en/github/creating-cloning-and-archiving-repositories/creating-a-repository-on-github/about-code-owners). You can use regex to tell GitHub who wrote these files. When someone is submitting a pull request/issue changing the file assigned to an author, GitHub will automatically ask for their review.
* You may add [CITATION.cff](https://docs.github.com/en/github/creating-cloning-and-archiving-repositories/creating-a-repository-on-github/about-citation-files) to tell others how to cite your project.

<hr class="sr">

## Sources

* [opensource.guide](https://opensource.guide/)
* [best practices CII/FLOSS](https://bestpractices.coreinfrastructure.org/fr)
* [best practices CII/FLOSS - GitHub](https://github.com/coreinfrastructure/best-practices-badge)
* [Government best practices](https://government.github.io/best-practices/)
* [Working Open Workshop](https://mozillascience.github.io/working-open-workshop/)