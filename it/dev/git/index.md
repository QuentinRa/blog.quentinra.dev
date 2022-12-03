# Version-control using Git

<div class="row row-cols-md-2"><div>

When working on a project, here are a few problems

* **code sharing** 📬: the need to allow other developers/contributors to read, or even edit the code
* **a need for time travel** 🗃️: the developer removed some old long time ago, and now needs to access it again. There could also be a case in which there is a need to go back to a previous version
* **duplicates** 🎭: a copy of a project to test something
* **computer dies** 😵: if your computer dies, and you don't have backups, then you lost your project for good
</div><div>

Version-control is helpful to solve these, and Git is the most well-known one. To use Git, there are two actors involved

* **clients** 👲: these are computers that will download project, work on them, upload their changes...
  * The command `git` / [git-scm](https://git-scm.com/) (Windows) 
  * [GitHub Desktop](https://desktop.github.com/)
  * [Git extension (VSCode)](https://code.visualstudio.com/docs/sourcecontrol/overview) (👻)
  * [GitKraken](https://www.gitkraken.com/) (👻)
  * JetBrains integrated Git client <br><span>&nbsp;</span>

* **servers** 🖥️: they will host the code, and make it available to those allowed, or public if you're working open-source.
  * [GitHub](https://github.com/) (Microsoft, my favorite)
  * [GitLab](https://about.gitlab.com/) (Well-known alternative to GitHub)
  * [Gogs](https://gogs.io/) (open-source, self-hosted)
  * [Gitea](https://gitea.com/) (👻)
  * [Bitbucket](https://bitbucket.org/) (👻)
</div></div>

<hr class="sep-both">

## 🐍 Git workflow 🐍

<div class="row row-cols-md-2 mt-4"><div>

Git allows us to create **commits** which are snapshots (`sauvegardes`) of your project. These commits are stored in **branches** 🪵, which are basically like different directories on your computer.

```bash
# install
$ sudo apt install git
# check
$ git --version
# required config
# warning: visible by others, used to sign/attribute commits
$ git config --global user.name "Example Example"
$ git config --global user.email "example@example.com"
```

* ➡️ Create a project on your GIT server

  * [Documentation on GitHub](https://docs.github.com/en/repositories/creating-and-managing-repositories/creating-a-new-repository)
  * The process is quite similar for others

</div><div>

* ➡ Download the project locally

```bash
$ git clone "URL"
```

* ➡ When working on your project

```bash
# get the latest version on the server
$ git pull
# ... work a lot ...
# check what changed
$ git status
# add files to the backup
$ git add toto tata
# snapshot named "I worked a lot" 
$ git commit -m "I worked a lot"
# send the snapshot to the server
$ git push
```
</div></div>

<hr class="sep-both">

## 🔑 SSH/GPG Keys 🔑

<div class="row row-cols-md-2"><div>

Setting up SSH keys is a must in most projects. Without SSH keys, you have to log in everytime you want to pull/push to the server.

```bash
$ ssh-keygen -t ed25519 -C "email"
# press ENTER every time.
# You should add a passphrase to protect your key. If someone want to
# use your key, the will be prompted to enter the passphrase.
$ cat ~/.ssh/id_rsa.pub
$ Copy the key in Settings > SSH Keys on GitHub/...
```

> [GitHub tutorial](https://docs.github.com/en/authentication/connecting-to-github-with-ssh/generating-a-new-ssh-key-and-adding-it-to-the-ssh-agent).<br>
> Before, we were using `ssh-keygen -t rsa -b 4096 -C "email"`.
</div><div>

GPG keys are a bit different. They are used to sign your commits, and prove that you were the one that committed. It's possible for someone that has your email to usurp your identify after all.

* [GitHub tutorial](https://docs.github.com/en/github/authenticating-to-github/managing-commit-signature-verification/generating-a-new-gpg-key)

<details class="details-e">
<summary>Increase the delay between passphrase prompts</summary>

You will need to **write a passphrase almost every time you are committing**, unless you provided your passphrase in the last **10 minutes**. You can increase the time your passphrase is cached

```bash
# note the location of the file
# this is usually ~/.gnupg/gpg-agent.conf
$ gpg-agent --gpgconf-list | head -n1
# create the file, or edit it
# cached 8 hours
$ echo "max-cache-ttl 28800" >> ~/.gnupg/gpg-agent.conf
$ echo "default-cache-ttl 28800" >> ~/.gnupg/gpg-agent.conf
# reload
$ gpg-connect-agent reloadagent /bye
```
</details>

On GitHub, verified commits are tagged with a tag "verified" next to them: ![Verified commit](_images/gpg.png)
</div></div>

<hr class="sep-both">

## 👻 To-do 👻

Stuff that I found, but never read/used yet.

<div class="row row-cols-md-2"><div>

* [git-scm/doc](https://git-scm.com/doc)
</div><div>
</div></div>