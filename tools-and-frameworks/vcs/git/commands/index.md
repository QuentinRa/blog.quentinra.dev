# <samp>git</samp> commands

<div class="row row-cols-md-2"><div>

You can install [Git](../_general/index.md) CLI using:

```shell!
$ sudo apt install git
$ git --version
```
</div><div>

You'll have to configure GIT before you can use it. The name and the email are used to sign commits. Anyone that can access the commits knows who committed <small>(name+email)</small> and when.

```shell!
$ git config --global user.name "Example Example"
$ git config --global user.email "example@example.com"
```
</div></div>

<hr class="sep-both">

## Basic Git commands

<div class="row row-cols-md-2"><div>

#### git clone

Download a GIT repository from a Git server.

```ps
# basic clone
$ git clone URL
# clone and store the project in "folder"
$ git clone URL folder
# clone a branch (see branching)
$ git clone URL -b name
$ git clone URL --branch name
```

#### git add

Track and stage files.

```ps
# add files/folders manually
$ git add file
$ git add file1 file2 folder
# stage all files
$ git add .
$ git add *
# stage only specific lines
$ git add -p file
```

#### git status

List information such as untracked, modified, and staged files.

```ps
$ git status
```
</div><div>

#### git commit

Create a commit with all staged files. Every commit must have a message explaining what's in the commit.

```ps
# open "vim" to enter the message
$ git commit
# pass the message directly
# press SHIFT+ENTER for multi-lines messages
$ git commit -m "message"
$ git commit -am "xxx"    # automatically add modified files
$ git commit -m "xxx" --allow-empty  # allow an empty commit
```

#### git pull

Download and apply the latest changes, for the current branch, from the remote repository.

```ps
$ git pull
```

#### git push

Send the latest commits only present locally, for the current branch, to the remote repository.

```ps
$ git push
```
</div></div>

<hr class="sep-both">

## Git branching

<div class="row row-cols-md-2"><div>

#### git branch

You can list, create, and delete branches.

```ps
# list all branches
$ git branch -a
# create a branch
$ git branch "branch_name"
# delete a branch
$ git branch -d "branch_name"
```

#### git checkout

Navigate to the project corresponding to the given commit.

```ps
# navigate to commit xxx
$ git checkout xxx
# navigate to branch "branch_name"
$ git checkout branch_name
# create a branch from the current commit,
# then navigate to it
$ git checkout -b "branch_name"
```
</div><div>

#### git merge

Merge a target's history <small>(e.g., its commits)</small> in our history.

```ps
$ git merge xxx             # a commit
$ git merge "branch_name"   # a branch
```

If we both edited a file, it generates a **conflict**. ⚠️ Conflicts need to be handled for the merge to end.

**Option 1**: Use `git status` to list all problems and solve them. Each file will have conflicts marked like this:


```text!
<<<<<<< HEAD
This is the content from the current branch.
=======
This is the conflicting content from branch_name.
>>>>>>> branch_name
```

**Option 2**: Abort the merge

```ps
$ git merge --abort
```
</div></div>

<hr class="sep-both">

## 🪄 Git extras 🪄

<div class="row row-cols-md-2"><div>

#### 🪄 Git submodules

Git submodules are the appropriate way of having external Git repositories inside a Git repository.

```bash
# init submodules for a cloned project (v1)
$ git submodule init
$ git submodule update
# init submodules for a cloned project (v2)
$ git submodule update --init --recursive
# to clone a project and init submodules
$ git clone --recursive URL
$ git clone --recurse-submodules URL
# to add a Git repository as a submodule
$ git submodule add CLONE_URL
$ git submodule add CLONE_URL LOCAL_PATH
```

You can find your submodules in `.gitmodules`.
</div><div>

#### 🪄 Git Large File Storage

Git LFS should be used with caution. It offers a dedicated Git storage solution for large files; however, for free users utilizing SaaS Git servers like GitHub, it does have several limitations.

For example, on GitHub, it permits uploading files larger than 50 MB, yet there are impractical bandwidth quotas and storage constraints.

Some commands you might use:

```bash
$ git lfs init
$ git lfs update
$ git lfs ls-files
$ git lfs fetch --all origin
$ git lfs uninstall
```

See also: `.gitattributes`.
</div></div>

<hr class="sep-both">

## 👻 To-do 👻

Stuff that I found, but never read/used yet.

<div class="row row-cols-md-2"><div>

xxx
</div><div>


</div></div>