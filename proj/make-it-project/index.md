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

...

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

<hr class="sr">

## Templates

...

<hr class="sl">

## Workflows

...

<hr class="sr">

## Versioning

...

<hr class="sl">

## Bunch of notes

In an open-source project,

* make every discussion public
* check the license of the libraries you're using
* give your roadmap (what you're planning to do, what you did, ...)
* try to answer any issues/pull requests within 48 hours, give feedback and gratitude to your contributors

<hr class="sr">

## Sources

* [opensource.guide](https://opensource.guide/)
* [best practices CII/FLOSS](https://bestpractices.coreinfrastructure.org/fr)
* [best practices CII/FLOSS - GitHub](https://github.com/coreinfrastructure/best-practices-badge)
* [Government best practices](https://government.github.io/best-practices/)