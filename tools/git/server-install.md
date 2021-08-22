# Server-side setup

[Go back](index.md#introduction)

A repository is a project (literally, this is a directory) where you will store your code. You usually put a ``README.md`` file in it, written in ``Markdown`` to describe your project.

We will strongly refer to ``GitHub`` but these things are the same everywhere. Here is their official tutorial to [create a repository](https://docs.github.com/en/github/getting-started-with-github/quickstart/create-a-repo).

Then, before we continue, you have 2 choices

* each time you make a commit, you need to **log in**
* each time you make a commit, you don't need to **log in**: set up ssh keys

<hr class="sl">

## SSH keys

So if you don't want to log in at each commit, set what we call ``ssh`` keys. Here is the official GitHub tutorial [generating-a-new-ssh-key](https://docs.github.com/en/github/authenticating-to-github/connecting-to-github-with-ssh/generating-a-new-ssh-key-and-adding-it-to-the-ssh-agent), or you can do that

* ``ssh-keygen -t rsa -b 4096 -C "email"``
* ``cat ~/.ssh/id_rsa.pub``
* copy the text
* on GitHub/Gogs/..., go to ``settings`` then `SSH keys`
* add the key