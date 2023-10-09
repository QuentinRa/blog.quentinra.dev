# <samp>git</samp>

<div class="row row-cols-md-2"><div>

[Git](https://git-scm.com/) is a popular and widely used [version control system](../../_general/index.md) (DVCS). We create snapshots of our project called **commits** 🔐. They are stored in **branches** 🪵, which are quite similar to local copies of a project.

Git usually involves two sides:

* the **git clients** 👲: they work on the project...
* the **remote git server** 🖥: it's a hub to synchronize every client...
</div><div>

**Where to learn?**

* [Git-SCM](https://git-scm.com/doc) <small>(⛪)</small>
* [OH MY GIT!](https://ohmygit.org/) <small>(👻, a game to learn Git)</small>
* [learngitbranching](https://learngitbranching.js.org/) <small>(👻, a game to learn Git branching)</small>
</div></div>

<hr class="sep-both">

## Pick your software

<div class="row row-cols-md-2"><div>

#### Git clients 👲

You can use the [`git` command](../commands/index.md) directly or rely on plugins or software.

* [git-scm](https://git-scm.com/) ✅: `git` command for Windows
* [GitHub Desktop](https://desktop.github.com/) 🤔: GUI Git Client
* [VSCode Git Plugin](https://code.visualstudio.com/docs/sourcecontrol/overview) 🤔: GUI Git Client
* [GitKraken](https://www.gitkraken.com/) 👻: GUI Git Client 
* [JetBrains Git Plugin](https://www.jetbrains.com/help/idea/version-control-integration.html) ✅:  GUI Git Client
* [Sourcetree](https://www.sourcetreeapp.com/) 👻: GUI Git Client
* [gitg](https://wiki.gnome.org/Apps/Gitg) 👻: GNU GUI Git Client
* [meld](https://meldmerge.org/) 👻: GUI Git Client
</div><div>

#### Remote Git Server 🖥

There are multiple remote Git servers that you can use for free, while you may also self-host your Git server.

* [GitHub](https://github.com/) ✅: popular Git server by Microsoft
* [GitLab](https://about.gitlab.com/) ✅: popular alternative to GitHub
* [Gogs](https://gogs.io/) 🤔: self-hosted Git server
* [Gitea](https://gitea.com/) 👻: self-hosted Git server
* [Bitbucket](https://bitbucket.org/) 👻: atlassian Git server

To improve collaboration, they usually provide [many new features](server-side.md).
</div></div>

<hr class="sep-both">

## Authentication

<div class="row row-cols-md-2"><div>

When using Git with a remote server, we **need** to log in for some operations such as `git clone`, `git pull`, `git push`... You may use one of these to log in <small>(the default one being the less convenient)</small>:

* Login/Password authentication 🔑 — default
* SSH key authentication 🔐
* Personal access tokens 🎫

#### SSH key authentication

Using an SSH key, you don't need to enter a username/password. 

```shell!
$ ssh-keygen -t ed25519 -C "email"
Press ENTER every time.
You should add a passphrase to protect your key.
If you did, to use your key, you will have to enter the passphrase.
$ cat ~/.ssh/id_rsa.pub
<copy the content>
```

Read your Git Server documentation to find out where you can add an SSH key. It's commonly in <kbd>Settings > SSH Keys</kbd>.

Once added, you'll have to use a new URL to clone repositories. You may edit an existing repository [remote URL](#git-remotes) to use the SSH URL.

👉 It's the most common password-less method.
</div><div>

#### GPG commit signature

You can set up GPG keys to sign your commits. Anyone knowing your email can usurp your identity; however, signing commits increases the likelihood that you were the one who created the commit.

* [GitHub tutorial](https://docs.github.com/en/github/authenticating-to-github/managing-commit-signature-verification/generating-a-new-gpg-key)

<details class="details-n">
<summary>Tip: increase the delay between passphrase prompts</summary>

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

On GitHub, signed commits are tagged "verified" next to them:

<div class="text-center">

![Verified commit](_images/gpg.png)
</div>

#### Personal access tokens

A personal access token is a string that you can use in multiple commands (such as `git clone`) that acts like a login/password.

```shell!
$ git clone https://oauth2:ACCESS_TOKEN@example.com/xxx.git  # GitLab
$ git clone https://username:ACCESS_TOKEN@github.com/xxx.git # GitHub
$ cd xxx && git pull # no authentication
```

👉 Refer to your Git Server to create one. Commonly used in scripts.
</div></div>

<hr class="sep-both">

## Git workflow

<div class="row row-cols-md-2"><div>

Git creates a tree of **commits** which are the snapshots/saves of your project. All files in a Git project are either ([schema](https://git-scm.com/book/en/v2/Git-Basics-Recording-Changes-to-the-Repository)):

* **Untracked** 🚮: these files won't be saved
* **Staged** 📦: these changes will be in the next commit
* **Unmodified** ✅: there are no changes since the last commit
* **Modified** 🫧: a tracked file was modified but not staged

To track or stage a file, use `git add`.

To create a commit, use `git commit`.

To see the state of files within a project, use `git status`.
</div><div>

While you may use Git locally, we mostly use a remote Git server. To get started, you need to download the current version of the project.

To download a Git project, use `git clone`.

To update your local project with the remote one, use `git pull`.

To push to the remote server your commits, use `git push`.

👉 All commands and their arguments are [explained here](../commands/index.md#basic-git-commands).
</div></div>

<hr class="sep-both">

## 💴 Commits 💴

<div class="row row-cols-md-2"><div>

Each commit stores information about its changes relative to the previous commit. You can view commits like a timeline or a thread.

When we create a [branch](#-branches-), we actually initiate a divergence in the timeline, effectively creating one more timeline.

The result looks like a tree, hence the name "branch."

To navigate to a commit, use `git checkout`.

To edit a commit, use `git rebase`.

To edit the tree <small>(move commits/...)</small>, use `git rebase`.
</div><div>

**Each commit is identified by a unique SHA1 value.**

➡️ Example: `1ed803c298f6dbfdc95bba1db3322c0f0ed7b6a5`.

There are many aliases to make SHA1 easier to use:

* Last commit <small>(of our branch)</small>: `HEAD` or `@`
* Shortened SHA1: `1ed803c2`
* One commit before SHA1: `1ed803c2^`
* N commits before SHA1: `1ed803c2^N` or `1ed803c2~N`

You can also use predicates such as: `xxx@{two month ago}` or `xxx@{2021-05-05}` which will be replaced with the closest commit.
</div></div>

<hr class="sep-both">

## 🪵 Branches 🪵

<div class="row row-cols-md-2"><div>

When working on a project, it's common to create a copy of the project and work on it, for instance, to test implementing a feature. By doing that, we ensure we still have a working project <small>("just in case" 😅)</small>.

A **branch** 🪵 is like a <small>(shallow)</small> copy of your project. Git provides features to manage them, including support for **merging** them.

The default branch, which is the one you work on by default, is usually called `main` <small>(new term, more neutral)</small> or `master` <small>(previous traditional term)</small>.

➡️ Each branch's name, such as `main` or `feature-xxx`, is actually a named commit pointing to the last commit of their timeline <small>(=branch)</small>.
</div><div>

To manage branches, use `git branch`.

To navigate between branches, use `git checkout`.

To merge branches, use `git merge`.

To rebase before a merge <small>(cleaner history)</small>, use `git rebase`.

👉 Most commands and their arguments are [explained here](../commands/index.md#git-branching).
</div></div>

<hr class="sep-both">

## Git remotes

<div class="row row-cols-md-2"><div>

**Remotes** specify where and how the code is fetched and sent when using operations such as `git push`, `git pull`...

They are automatically set when closing a repository. For [remote git servers](#remote-git-server-), the remote is commonly called `origin`.

You can use `remote/myBranch` to use a branch from a specific remote, for instance, `origin/main`.
</div><div>

For manipulating remotes, use `git remote` ([usage](../commands/index.md#git-remote)).
</div></div>

<hr class="sep-both">

## Other topics

<div class="row row-cols-md-2"><div>

#### 📦 .gitignore

A "git ignore" is a really useful file to avoid tracking big or sensitive files. **Any file inside will be ignored by version control**. You can:

* Generate one: [gitignore.io](https://www.toptal.com/developers/gitignore).
* Find a template: [gitignore](https://github.com/github/gitignore)

The format is similar to [other ignore files](/programming-languages/others/data/ignore.md):

```ini!
*.zip     # ignore every zip
!toto.zip # don't ignore toto.zip
data/     # ignore every folder called 'data'
data/*    # ignore everything inside folders called 'data'
/data     # ignore only the folder data in the root directory
```

⚠️ It only applies to untracked files. A file that was staged once won't be ignored. You'll have to remove the file and commit first. The file will still be in the history, see `git filter-branch`.
</div><div>

#### 🌞 Good commits

Commits must be **atomic**, meaning you shouldn't do more than one implementation per commit <small>(ex: adding a small feature)</small>. The second concern is to properly name commits:

* 📃 Usually, we add a type before any message  <small>(build, docs, feat (=MINOR), fix (=PATCH), style, test, chore, ci, perf, refactor, revert, security, and deps)</small>, followed by `:` giving us: `feat:`/...
* ✍️Then, we add the commit message, with a short description
* 📦  We may then leave a blank line, and add a body further describing the commit, such as adding a list of changes, or labels such as `Co-authored-by`, `Reviewed-by`, `Refs`...

> See [Conventional Commits](https://www.conventionalcommits.org/en/), [
commitlint](https://commitlint.js.org/#/), and [7 rules](https://cbea.ms/git-commit/#seven-rules).<br>
> Example: [Atom - Git commit messages](https://github.com/atom/atom/blob/master/CONTRIBUTING.md#git-commit-messages) or [commitment](https://github.com/thiagodp/commitment/blob/master/rules-en.md).
</div></div>

<hr class="sep-both">

## 👻 To-do 👻

Stuff that I found, but never read/used yet.

<div class="row row-cols-md-2"><div>

* git pull merge branch
* merge fast-forward vs rebase
* GitGraph.js
* Git hooks (+[husky](https://github.com/typicode/husky)) - `git hook`
* Google repo tool
</div><div>
</div></div>