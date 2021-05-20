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
  
So first of all, you need to install git

* on Windows [git-scm](https://git-scm.com/) do it for you
* on Linux ``sudo apt-get install git``

Then you need to set things up and you are
ready

```bash
git config --global user.name "name used on commits"
git config --global user.email "email used on commits"
```

## Introduction : server side

Here we will take ``Github`` for example but things
are the same everywhere

A repository is basically a project where you will
store your code. You usually put a ``README.md`` file
in it, written in ``Markdown`` to describe your project.

Here is the official tutorial
to 
[create a repository](https://docs.github.com/en/github/getting-started-with-github/quickstart/create-a-repo)
.

Then, before we continue, you have 2 choices
* each time you make a commit, you need to ``login``
* each time you make a commit, you don't need to ``login``

So if you don't want to login at each commit, set
what we call ``ssh`` keys.

Here the official github tutorial
[generating-a-new-ssh-key](https://docs.github.com/en/github/authenticating-to-github/connecting-to-github-with-ssh/generating-a-new-ssh-key-and-adding-it-to-the-ssh-agent)
or you can do that

* ``ssh-keygen -t rsa -b 4096 -C "email"``
* ``cat ~/.ssh/id_rsa.pub``
* copy the text
* on your website, go to ``settings`` then `SSH keys`
* add the key
* END

## Sources

* Anonymous
* Quentin RAMSAMY–AGEORGES (ENSIIE student)

References

* [changing remote](https://docs.github.com/en/github/using-git/changing-a-remotes-url)
* [add ssh key](https://docs.github.com/en/free-pro-team@latest/github/authenticating-to-github/generating-a-new-ssh-key-and-adding-it-to-the-ssh-agent)
* [good practices](http://adopteungit.fr/methodologie/2017/04/26/commits-atomiques-la-bonne-approche.html)
* [git tutorial](https://dubrayn.github.io/IPS-DEV/git.html#1)