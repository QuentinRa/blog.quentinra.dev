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

https://github.com/thiagodp/commitment/blob/master/rules-en.md

<hr class="sl">

## Templates

I'm including two things into "templates".

* **Repository templates**

Maybe someone already configured a repository for you. On GitHub, you can find "template" repositories that are expressly made to be used as a template. 

* [git-repository-template](https://github.com/misitebao/template-git-repository),
* [opensource-template](https://github.com/EmbarkStudios/opensource-template)

Note that you may find node-project templates too, etc.

<hr class="sr">

## Workflows

Usually, developers are configuring automatic testing or actions that are executed each time they're making a commit/pull request. An action could

* check that the code is compiling on some OS
* check that the code is covered by the tests
* check that you didn't have introduced a security breach
* ...

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