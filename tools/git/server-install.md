## Introduction : server side

[Go back](index.md)

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
```