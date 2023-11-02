# Packages

[![linuxfundamentalspart3](../../../../cybersecurity/_badges/thm/linuxfundamentalspart3.svg)](https://tryhackme.com/room/linuxfundamentalspart3)

<div class="row row-cols-lg-2"><div>

On Linux distributions, packages are archives used to share:

* 📚 Libraries <small>(.a and .so files)</small>
* ✍️ Documentation <small>(packagename-doc)</small>
* 📄 Headers <small>(packagename-dev)</small>
* 🕹️ Applications <small>(binaries)</small>
* ...

Each operating system has a package management system to install and remove packages. We usually don't directly interact with it, and we use a package management tool instead. They allow us to download packages from package repositories and update them too.
</div><div>

In a nutshell, we often see these combinations:

| Package System 🖥️ | Package Tool 🛠️     | Package format 🗝️ |
|--------------------|----------------------|--------------------|
| `dpkg`             | `apt` or `aptitude ` | .deb               |
| `rpm`              | `dnf` or `yum` ☠️    | .rpm               |
| `pacman`           | `pacman`             |                    |

* `dpkg` is mainly used by Debian-like distributions.
* `rpm` is mainly used by Fedora and Red Hat.
* `pacman` is mainly used by Arch Linux.
</div></div>

<hr class="sep-both">

## Package Systems And Tools

++++++
[**apt** - package manager]

<div class="row row-cols-lg-2"><div>

**Usage** 🐚: `apt` is the default package manager on well-known Linux distros such as Debian/Ubuntu.

**Example** 🔥:

Install, Update, Remove a package

```shell!
$ sudo apt install aptitude
$ sudo apt update aptitude
$ sudo apt upgrade aptitude
$ sudo apt remove aptitude
```

Download updates for/upgrade all packages

```shell!
$ sudo apt update
$ sudo apt upgrade
```

**Update the OS** 🧪

```shell!
$ sudo apt dist-upgrade
```
</div><div>

Remove unused dependencies

```shell!
$ sudo apt autoremove
$ sudo apt auto-remove
```

When installing packages, you are prompted `Do you want to continue? [Y/n]` <small>(you need to enter `Y`)</small>. You can skip this, using `-y`.

```shell!
$ sudo apt install -y aptitude
```

Configuration files are stored in `/etc/apt/`:

```shell!
$ cat /etc/apt/sources.list # repositories
$ ls /etc/apt/apt.conf.d/   # proxy conf etc.
```
</div></div>

[**aptitude** - package manager]

<div class="row row-cols-lg-2"><div>

**Usage** 🐚: `aptitude` <small>(which has to be installed)</small> is the same as `apt`, but there is a graphical interface.

**Example** 🔥:

```shell!
$ sudo aptitude # press 'q' to quit
```
</div><div>

Or, you can use it like `apt`:

```shell!
$ sudo aptitude install nano
```
</div></div>

[**dpkg** - package manager]

<div class="row row-cols-lg-2"><div>

**Usage** 🐚: `apt` uses the lower-level package manager `dpkg` to install packages. Some developers may directly interact with it.

**Example** 🔥:

```shell!
$ sudo dpkg -i xxx.deb
```
</div></div>

[**snap** - package manager]

<div class="row row-cols-lg-2"><div>

**Usage** 🐚: snap packages are a modern way to share applications. They contain all dependencies, and support automatic updates. Some cons are their larger size and sometimes there are performance issues.

👉 Find [Snap packages here](https://snapcraft.io/).
</div><div>

**Example** 🔥:

```shell!
$ sudo apt update
$ sudo apt install snapd
$ sudo snap install core
$ sudo snap refresh core
$ sudo snap install --classic xxx
```
</div></div>

[**update-alternatives** - 🛻]

<div class="row row-cols-lg-2"><div>

**Usage** 🐚: available on Debian-based distributions. Allow us to switch between multiple versions of the same program.

🛻 c++, cc, nc, php, java...

**Example** 🔥:

```shell!
$ sudo update-alternatives --config php
```
</div></div>
++++++

<hr class="sep-both">

## Mirrors

<div class="row row-cols-lg-2"><div>

To reduce the time it takes to download packages, multiple mirrors of package repositories are set up, and users should use the nearest ones. A mirror is basically a copy of a package repository.

It could be hosted locally.

#### apt-mirror

Apt-mirror is a tool used on Linux to create a mirror.

```shell!
$ sudo apt-get install apt-mirror
$ sudo cat /etc/apt/mirror.list
set base_path    /path/to/mirror
set run_postmirror 0

deb http://deb.nodesource.com/node_10.x/ buster main
clean http://deb.nodesource.com/node_10.x
$ sudo apt-mirror /etc/apt/mirror.list
```

It will create a folder `mirror` inside `/path/to/mirror` with:

* `dists/<codename>/<repository>`: contains the metadata
* `pool/<repository>`: contains the downloaded packages
</div><div>

#### Aptly

Aptly is a powerful tool created to simplify the process of creating and maintaining package repositories. It can be used to create mirrors.

```shell!
$ apt-key adv --keyserver keyserver.ubuntu.com --recv-keys A0546A43624A8331
$ sudo apt-get install aptly
$ sudo cat ~/.aptly.conf     # aptly config show
{
    "rootDir": "/path/to/mirror",
    "downloadConcurrency": 20,
    "architectures": ["amd64"]
}
$ [handle gpg problems]
$ aptly mirror create node20 https://apt.nodesource.com/node_20.x nodistro main
$ aptly mirror update node20
```
</div></div>

<hr class="sep-both">

## 👻 To-do 👻

Stuff that I found, but never read/used yet.

<div class="row row-cols-lg-2"><div>

* [flatpak](https://www.flatpak.org/)

```shell!
$ apt-file
$ apt-file update
$ apt autoclean
$ wget -qO - xxx.gpg | apt-key add -
```
</div><div>
</div></div>