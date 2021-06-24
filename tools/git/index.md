# About this course

* you will learn what's git
* the basic usage of git
* the main concepts
* good practices
* some advanced concepts

This course will strongly refer
to [Github](https://github.com/)
but that doesn't mean that it is the only one
to offer this service, please also check

* [GitLab](https://about.gitlab.com/), alternative to Github
* [Gogs](https://gogs.io/), open-source, self-hosted

<hr class="sr">

## Introduction

Git is a great tool that allows users to work on
one project together, by allowing things as

* **commits**: a save of your project
* **branch**: duplicate your project to continue
developing without breaking the ``main`` version
before **merging** all your changes into your
  ``main`` version.
  
So first of all, you need to

* [set things up locally](local-install.md)
* [set things up server-side](server-install.md)

<hr class="sl">

## Basic usage

Please take note that all ``commands`` start with
``git`` then one space.

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
# check what's changed
git status
# save your changes
git add .
git commit -m "I worked a lot"
# then send your changes to the server
# or not and repeat add/commit
git push
```

<hr class="sr">

## Main concepts

Here are commands that you will use on a project
so most likely all the time if you are not working
alone or for yourself.

* ``git branch name``: create a branch
* ``git checkout name``: move to a branch
* ``git merge``: merge the current branch with the main/master branch

So let's now explain what's a branch. By default, you are
coding on a branch called ``master`` (or sometimes `main`).

You may want to create a copy of your project, modify it
then merge your modification into your original code
or just drop it since that's was a mistake for example.

That's what we can do with ``branch`` and `merge`.
Simply create a branch, move on it, code, then ``merge``
it into ``master`` or just destroy it.

> As a side note, a lot of time they are conflicts
> with ``merging`` meaning someone modified master
> while you were working on it. Simply check
> all the conflicting files and choose what you
> want to keep. Some software provides you
> an interface to do that quite easily such
> as ``IntelliJ IDEA``.

<hr class="sl">

## Good practices

**Atomic commits**: one commit means one change, such
as adding one functionality. Do not make hundreds of changes
making it hard to find when to commit, then the change,
that ruined your project is.

**Short-Long description**: you can, and should make
a short and a long description of your commits
like that

```bash
git commit -m "a short inline description

A long description, where I describe
all of my changes
"
```

**README.md**: put a README in all of your projects, that
the start of a great adventure.

**LICENSE**: you may also put a LICENSE even if you don't
want to put restriction on your code, just in order
to protect yourself from complaints (MIT LICENSE
is good for that)

**.gitignore**: you may not want to commit some files
like high-churn ones or big files... Create a file
called is a good practice, you can generate one
here [toptal gitignore](https://www.toptal.com/developers/gitignore).

<hr class="sr">

## Advanced Github concepts

Here some functionalities that you may find
on other git-server.

* [Wikis](tools/wiki.md)
* [Actions](tools/actions.md)
* [PullRequests](tools/pull-requests.md)
* [Issues](tools/issues.md)
* [Organizations](tools/organizations.md)
* [Pages](tools/pages.md)

<hr class="sl">

## Fancy notes

Did you hear about badges? You can find them in the 
README.md in a lot of repositories nowadays.

![](https://img.shields.io/github/license/lgs-games/memorize)

They are loaded with the latest value like the real license
here so devs add them into a README to help others
to easily a lot about their repository.

* [shields.io](https://shields.io/) : a lot of badges,
  you can even create yours
* [badgen.net](https://badgen.net/) : follows the steps
and get some badges

You can check websites like these for reviews of your
code

* <https://www.codefactor.io/>
* <https://www.codetriage.com/>
* <https://about.codecov.io/>
* <https://weblate.org/fr/> (translation)

![](https://readme-jokes.vercel.app/api)

<hr class="sr">

## Sources

* [github git guide](https://github.com/git-guides/)
* [changing remote](https://docs.github.com/en/github/using-git/changing-a-remotes-url)
* [add ssh key](https://docs.github.com/en/free-pro-team@latest/github/authenticating-to-github/generating-a-new-ssh-key-and-adding-it-to-the-ssh-agent)
* [good practices](http://adopteungit.fr/methodologie/2017/04/26/commits-atomiques-la-bonne-approche.html)
* [git tutorial](https://dubrayn.github.io/IPS-DEV/git.html#1)