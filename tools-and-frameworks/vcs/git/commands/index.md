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
</div></div>

<hr class="sep-both">

## 👻 To-do 👻

Stuff that I found, but never read/used yet.

<div class="row row-cols-md-2"><div>

xxx
</div><div>


</div></div>