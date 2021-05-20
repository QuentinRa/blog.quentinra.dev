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

## Introduction

Git is a great tools that allows users to work on
one project together, by allowing things as

* **commits** : a save of your project
* **branch** : duplicate your project to continue
developing without breaking the ``main`` version
before **merging** all your changes into your
  ``main`` version.
  
So first of all, you need to

* [set things up locally](local-install.md)
* [set things up server-side](server-install.md)

## Basic usage

Please take not that all ``commands`` start with
``git`` then a space.

* [Get your repository from server](commands/clone.md)
* [Update your local version](commands/pull.md)
* [Save your local changes](commands/commit.md)
* [Send your changes to the server](commands/push.md)
* [Check the git status](commands/status.md)

So to summarize, a basic usage would be

```bash
# 
# Ony done once, download the repository locally 
#
git clone "https://github.com/lgs-games/memorize.git"

#
# Then inside the folder, you can do
#
# get the latest version on the server
git pull
# ... work a lot ...
# save your changes
git status
git add .
git commit -m "I worked a lot"
# then send your changes to the server
git push
```

## Sources

* Anonymous
* Quentin RAMSAMY–AGEORGES (ENSIIE student)

References

* [github git guide](https://github.com/git-guides/)
* [changing remote](https://docs.github.com/en/github/using-git/changing-a-remotes-url)
* [add ssh key](https://docs.github.com/en/free-pro-team@latest/github/authenticating-to-github/generating-a-new-ssh-key-and-adding-it-to-the-ssh-agent)
* [good practices](http://adopteungit.fr/methodologie/2017/04/26/commits-atomiques-la-bonne-approche.html)
* [git tutorial](https://dubrayn.github.io/IPS-DEV/git.html#1)