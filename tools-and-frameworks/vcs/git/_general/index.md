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
</div><div>

#### Remote Git Server 🖥

There are multiple remote Git servers that you can use for free while you may also self-host your Git server.

* [GitHub](https://github.com/) ✅: popular Git server by Microsoft
* [GitLab](https://about.gitlab.com/) ✅: popular alternative to GitHub
* [Gogs](https://gogs.io/) 🤔: self-hosted Git server
* [Gitea](https://gitea.com/) 👻: self-hosted Git server
* [Bitbucket](https://bitbucket.org/) 👻: atlassian Git server
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

👉 All commands with their arguments are [explained here](../commands/index.md#basic-git-commands).
</div></div>

<hr class="sep-both">

## 🪵 Branches 🪵

<div class="row row-cols-md-2"><div>

When working on a project, it's common to create a copy of our project and work on it, for instance, to test implementing a feature. By doing that, we ensure we still have a working project <small>("just in case" 😅)</small>.

A **branch** 🪵 is a copy of your project. Git provides features to manage them, including support to **merge** them.

The default branch, which is the one you work on by default, is usually called `main` <small>(new term, more neutral)</small> or `master` <small>(previous traditional term)</small>.
</div><div>

To manage branches, use `git branch`.

To navigate between branches and commits, use `git checkout`.

To merge branches, use `git merge`.
</div></div>

<hr class="sep-both">

## 👻 To-do 👻

Stuff that I found, but never read/used yet.

<div class="row row-cols-md-2"><div>

* [_commands](_commands.md)
* [_files](_files.md)
* [_server-side](server-side.md)
* [git-scm](https://git-scm.com/)
* origin, `origin/myBranch`
* git pull merge branch
* pull vs fetch
* merge fast-forward vs rebase
</div><div>


</div></div>