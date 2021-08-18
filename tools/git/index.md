# About this course

* you will learn what's git
* the basic usage of git
* the main concepts
* good practices
* some advanced concepts

This course will strongly refer to [GitHub](https://github.com/), but you may also check

* [GitLab](https://about.gitlab.com/), the most well-know alternative to GitHub
* [Gogs](https://gogs.io/), open-source, self-hosted

As a student, you may enjoy the benefits of the [GitHub student pack](https://education.github.com/pack).

<hr class="sr">

## Introduction

Git is a great tool that allows users to work on one project together, by allowing things as

* **commits**: a save of your project
* **branch**: duplicate your project to continue developing without breaking the ``main`` version before **merging** all your changes into your ``main`` version.

First, you need to

* [set things up locally](local-install.md)
* [set things up server-side](server-install.md)

As a side note before starting, you can create aliases for a command like ``git name`` with the command `git config --global alias.name 'a command'` where a command could be ``add .`` or `commit`...

<hr class="sl">

## Basic usage

Please take note that all ``commands`` start with ``git`` then one space.

* [Get your repository from server](commands/clone.md)
* [Update your local version](commands/pull.md)
* [Save your local changes](commands/commit.md)
* [Send your changes to the server](commands/push.md)
* [Check the git status](commands/status.md)

So to summarize, a basic usage would be

```bash
# 
# Only done once, download the repository locally 
#
git clone "https://github.com/lgs-games/memorize.git"

# Then inside the folder, you can do

# get the latest version on the server
git pull
# ... work a lot ...
# check what changed
git status
# notify git that these files should be added
# to the save
git add .
# create a save named "I worked a lot"
git commit -m "I worked a lot"
# then send your saves=commits to the server
# (or you can repeat work->add->commit)
git push
```

<hr class="sr">

## Main concepts

Here are commands that you will use on a project, if you are not working alone (you may also use it when working alone, if you're consistent).

* ``git branch name``: create a branch "name"
* ``git checkout name``: move to the branch "name"
* ``git checkout -b name``: create and move
* ``git merge name``: merge the current branch with the branch "name"
* ``git branch -d name``: delete a branch

By default, you are coding on a branch called ``master`` (or `main`). Let's explain what's a branch. If you're smart, you will want to always have a working version of your project ("main" here). In that case, if you want to add  a functionality (let's call it "f1"), 

* you will copy your project in "f1":  ``git branch f1``
* you will move to the copy: ``git checkout f1``
* [...] *work on the copy* (you can use add, commit, push, ...) [...]
* you can go back to "main": ``git checkout main``
  * delete the new copy ``git branch -d f1``
  * or accept your changes ``git merge f1``
    * if "main" didn't change, no problems, the copy replace "main"
    * but if "main" changed, then you may have to manually pick which parts of the two copies you want in the new "main" (=resolving conflicts).

> As a side note, when you have to resolve conflicts, the merge command's output will list what files need to be reviewed. In each file, you have the two different versions and need to delete the code you don't want to keep. Some software provides you an interface to do that quite easily such as [PHPStorm](https://www.jetbrains.com/help/phpstorm/resolving-conflicts.html#distributed-version-control-systems), or any software made by [JetBrains](../jetbrains/index.md).

<hr class="sl">

## Good practices

**Atomic commits**: one commit means one change, such as adding one functionality. Do not make hundreds of changes in one commit, making it hard to find what you did.

**Short-Long description**: you should make a short and a long description of your commits, like that

```bash
git commit -m "a short inline description

A long description, where I further describe
what I did
"
```

**README.md**: put a README in all of your projects, that the start of a great adventure.

**LICENSE**: you may also put a LICENSE even if you don't want to put restrictions on your code, to protect yourself from complaints (MIT LICENSE is good for that, or The Unlicense). You should [pick your license here](https://choosealicense.com/).

**.gitignore**: you may not want to commit some files like high-churn ones or big files... Create a file called "gitignore" is a good practice, you can

* [generate a gitignore here](https://www.toptal.com/developers/gitignore).
* [use a template here](https://github.com/github/gitignore)

<hr class="sr">

## Advanced GitHub concepts

Here are some functionalities that you can find on GitHub (but you may find them too somewhere else).

* [Wikis](github/wiki.md)
* [Actions](github/actions.md)
* [PullRequests](github/pull-requests.md)
* [Issues](github/issues.md)
* [Organizations](github/organizations.md)
* [Pages](github/pages.md)

<hr class="sl">

## Commits

You may have seen some commits with this label on some (if not all) commits

![gpg](gpg.png)

You can sign your commits and have this too using [GPG keys](https://docs.github.com/en/github/authenticating-to-github/managing-commit-signature-verification/generating-a-new-gpg-key) (GitHub tutorial). It means that you will need to write a passphrase each time you are committing, but you can reduce the number of times you're asked

* [help on Stack Overflow](https://stackoverflow.com/questions/38384957/prevent-git-from-asking-for-the-gnupg-password-during-signing-a-commit)
* [gpg-agent.conf](https://gist.github.com/tknv/43604e851a371949343b78261c48f190)

Also, someone can commit on the behalf of someone else (not related to GPG)

* [authored / committed](https://stackoverflow.com/questions/25327743/what-flow-causes-github-commits-that-are-authored-by-one-user-but-committed)

<hr class="sr">

## Heroku

[Heroku](https://www.heroku.com/home) is a sort of GitHub action for automatic deployment. Currently, there are not that many languages supported, but still you may want to check it out. They have a [student](https://www.heroku.com/students) offer if needed.

The short videos on their website like [this one for nodejs](https://www.heroku.com/nodejs) are showing exactly what Heroku is doing.

<hr class="sl">

## Fancy notes

Did you hear about badges? You can find them in the README.md in a lot of repositories.

![badge](https://img.shields.io/github/license/lgs-games/memorize)

They are loaded with the latest value like the real license here, so devs add them into a README to help others to easily a lot about their repository.

* [shields.io](https://shields.io/): a lot of badges, you can even create yours
* [badgen.net](https://badgen.net/): follows the steps and get some badges

You can check websites like these for reviews of your code

* <https://sonarcloud.io/> (the BEST, quite a lot of feedback)
* <https://www.codefactor.io/> (analysis, good)
* <https://www.codetriage.com/>
* <https://about.codecov.io/> (code coverage)
* <https://weblate.org/fr/>
* <https://snyk.io/> (vulnerabilities)
* <https://www.codacy.com/> (I didn't manage to install this one)
* <https://lgtm.com/> (basic feedback)
* <https://scrutinizer-ci.com/> (paid)

You may also check this to create a profile card

* <https://github.com/anuraghazra/github-readme-stats>

![profile](https://github-readme-stats.vercel.app/api?username=QuentinRa&show_icons=true&theme=radical)

You can also show an achievements badge

![trophies](https://github-profile-trophy.vercel.app/api?username=QuentinRa&theme=chalk&column=3&margin-w=10&margin-h=10)

And you can even find things like joke cards <https://readme-jokes.vercel.app/api>.

You can also **create a skyline** with your contributions using <https://skyline.github.com/>.

<hr class="sr">

## Cheatsheet

You may look at these cheat sheets

* [GitLab Cheatsheet](https://about.gitlab.com/images/press/git-cheat-sheet.pdf)
* [GitHub Cheatsheet](https://education.github.com/git-cheat-sheet-education.pdf)
* [GitHub Cheatsheet (2)](https://training.github.com/downloads/github-git-cheat-sheet.pdf)
* [cheat-sheets.org](http://www.cheat-sheets.org/saved-copy/git-cheat-sheet.pdf)
* [Atlassian Cheatsheet](https://www.atlassian.com/dam/jcr:e7e22f25-bba2-4ef1-a197-53f46b6df4a5/SWTM-2088_Atlassian-Git-Cheatsheet.pdf)

<hr class="sl">

## Sources

* [GitHub git guide](https://github.com/git-guides/)
* [changing remote](https://docs.github.com/en/github/using-git/changing-a-remotes-url)
* [add ssh key](https://docs.github.com/en/free-pro-team@latest/github/authenticating-to-github/generating-a-new-ssh-key-and-adding-it-to-the-ssh-agent)
* http://adopteungit.fr/methodologie/2017/04/26/commits-atomiques-la-bonne-approche.html (reported down as of 08-2021)
* [git tutorial](https://dubrayn.github.io/IPS-DEV/git.html#1)