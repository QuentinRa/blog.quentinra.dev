# Make IT project

This is not a course explaining you "how to make an it project", since even I don't fully understand that. This course is a gathering of

* explanations about the most used files in GIT
* explanations about courses that you might want to look at
* a lot of tips about IT projects (versioning, ...)

You may note right now this: This course is mixing things that open-source users will do, and if your project won't be open-source, some advices here might not apply.

<hr class="sl">

## About other courses

If you are planning to make a project, of course you should consider a version-control tool. The most-used one is **GIT**.

If you are planning to make a project with a team, you should also look at **AGILE-SCRUM** methodology (or Agile methodologies), to replace this old V-Model.

If you are planning to make something clean, and well-made, then you should look at 

* **Design patterns**: typical implementations of some concepts
* **Methodologies**: some methodologies you might want to try
* **Code guidelines**: make your code consistent (how parameters are declared? language? indents? ...)
* **Tests**: automated tests to test that your software is working as intended, even after some updates
* **HMI**: carefully think about your interface

And finally, you should look for the **project management course**, as it explain thinks like "how to write specifications".

<hr class="sr">

## README.md/README.rst

This is a file you must already know. We are putting a README.md in **Markdown** (or README.rst, if you enjoy ReStructuredText) to explain

* What's the project's **name**
* What's the project's **goal**/ **description** of the project
* How we can **install the project**? run?
* Where is the **documentation**? (you got one right? right? 🧐)
  * You can make **some sample of code**
  * Generate the code's documentation
  * Write runtimes usages (global variables, session usage for a website, ...)
* Some **badges** (see fancy notes in the GitHub courses)
* You may add **pictures/a gif** showing an **example** of what's the project doing
* A link to a demo (usually in the browser for a web app)?
* Credits/Authors and core maintainers

You may also

* Add the contributors (some are doing it)
* Add a link to other files (such as the LICENSE)

<hr class="sl">

## LICENSE/LICENSE.txt

You **must** add a LICENSE, the most used ones being

* MIT
* Apache2.0

Pick the one that is corresponding to what you want [on choosealicense.com](https://choosealicense.com/).

<hr class="sr">

## CONTRIBUTING.md

Tell others, how they can contribute to your project

* How issues are handled?
* How pull requests are handled?
* What guidelines are you following?

<hr class="sl">

## CHANGELOG.md

This is useful to help the developers know what you did, or everything major that happened. The [keep a changelog website](https://keepachangelog.com/en/1.0.0/#how) is giving you a lot of advices.

* latest to oldest
* for each version
  * give the release date (YYYY-mm-dd)
  * tell us what you added/changed
  * tell us what you deprecated/removed/fixed
  * you may link issues, pull requests, and commits

On GitHub, the **releases** could be an alternatives of the CHANGELOG.md, or you can use both.

You got tools that may help you generating a Changelog, but I didn't test them

* [github-changelog-generator](https://github.com/github-changelog-generator/github-changelog-generator)
* [conventional-changelog](https://github.com/conventional-changelog)

<hr class="sr">

## CODE_OF_CONDUCT.md

What behavior is tolerated? What's behavior isn't tolerated? You should explain this in the Code Of Conduct.

The most used template is the [Contributor Covenant (Markdown - 2.1)](https://www.contributor-covenant.org/version/2/1/code_of_conduct/code_of_conduct.md), you can [find the latest version here](https://www.contributor-covenant.org/).

You can add this badge too, if you're proud of it ![Contributor Covenant](https://img.shields.io/badge/Contributor%20Covenant-2.1-4baaaa.svg)

```markdown
[![Contributor Covenant](https://img.shields.io/badge/Contributor%20Covenant-2.1-4baaaa.svg)](CODE_OF_CONDUCT.md)
```

<hr class="sl">

## SECURITY.md

You should give a way for users to report you any security-related issues. You may also write in this file, 

* which versions of your software will have security updates, 
* or for how many time you're planning to provide security updates, for each version

Sometimes, even if you moved to another major version (like from v1 to v2), you will still provides security updates for the previous versions. We usually call these versions "Long Term Support" (LTS). For instance, Java LTS version are released every 5 years, we got Java11 and soon Java17.

If you're tenacious and motivated, you might read [about security pratices here](https://github.com/coreinfrastructure/best-practices-badge/blob/main/doc/security.md). I didn't last long enough to make a summary.

<hr class="sr">

## Templates

I calling two things "templates".

* **Repository templates**

Maybe someone already configured a repository for you. On Github, you can find "template" repositories which are expressly made to be used as a template. 

* [git-repository-template](https://github.com/misitebao/template-git-repository),
* [opensource-template](https://github.com/EmbarkStudios/opensource-template)

Note that you may find node-project templates too, etc.

* **Issues and pull requests templates**

I don't know if you can do that everywhere, but on GitHub, you can define templates for your issues and your pull requests. Everything is explained in the Git course.

<hr class="sl">

## Workflows

Usually, developers are configuring automatic testing or actions that are executed each time they're making a commit/pull request. An action could

* check that the code is compiling on some OS
* check that the code is covered by the tests
* check that you didn't introduced a security breach
* ...

On GitHub, the workflow are associated with the [notion of actions](https://fr.github.com/features/actions). You got a lot of fancy tools/actions introduced in the fancy notes in the Git course.

<hr class="sr">

## Versioning

It seems that a lof of persons are using

* The [Semantic Versioning 2.0.0](https://semver.org/)
  * FORMAT: **MAJOR.MINOR.PATCH**
    * MAJOR: breaking change (of the API)
    * MINOR: non-breaking change, backward compatible
    * PATCH: internal change
  * **0.y.z**: in development
  * **1.y.z**: stable
  * you may add a tag like **1.0.0-alpha**
* You may also check [Calver](https://calver.org/)

<hr class="sl">

## Bunch of notes

In an open-source project,

* make every discussion public
* check the license of the libraries you're using
* give your roadmap (what you're planning to do, what you did, ...)
* try to answer any issues/pull requests within 48 hours, give feedback and gratitude to your contributors
* **CODEOWNERS**: at least on GitHub, you can create a file called [CODEOWNERS](https://docs.github.com/en/github/creating-cloning-and-archiving-repositories/creating-a-repository-on-github/about-code-owners). You can use regex to tell GitHub who wrote this files. When someone is submitting a pull request/issue changing the file assigned to an author, GitHub will automatically ask for their review.

<hr class="sr">

## Sources

* [opensource.guide](https://opensource.guide/)
* [best practices CII/FLOSS](https://bestpractices.coreinfrastructure.org/fr)
* [best practices CII/FLOSS - GitHub](https://github.com/coreinfrastructure/best-practices-badge)
* [Government best practices](https://government.github.io/best-practices/)