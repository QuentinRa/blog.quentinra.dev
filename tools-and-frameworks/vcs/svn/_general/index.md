# Subversion (SVN)

<div class="row row-cols-lg-2"><div>

Subversion (SVN) is a centralized [version control system](../../_general/index.md). Developers `commit` their changes to a central repository that keeps track of every change. They `checkout` the repository to get a copy of the project.

* [TortoiseSVN](https://tortoisesvn.net/) is a commonly used GUI for SVN.
* [Version Control with Subversion](https://svnbook.red-bean.com/) is a popular book

By default, SVN do not use encryption and anonymous access as reader is allowed. Credentials may be stored in `~/.subversion/auth/` while they are often in an external vault. 
</div><div>

A simple usage:

```shell!
$ svn checkout URL dest_name        # Download
$ svn status                        # Current status
$ svn add some_files                # Track their changes
$ svn commit -m "some description"  # Push tracked changes
$ svn update                        # Get latest version
```
</div></div>

<hr class="sep-both">

## 👻 To-do 👻

Stuff that I found, but never read/used yet.

<div class="row row-cols-lg-2"><div>

* `svn copy`
* `svn merge`
* `<repo>/conf/passwd` on the SVN server for passwords
* `ps aux | grep svnserve`
</div><div>
</div></div>