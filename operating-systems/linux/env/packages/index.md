# Packages

<div class="row row-cols-md-2"><div>

...
</div><div>

...
</div></div>

<hr class="sep-both">

## Mirrors

<div class="row row-cols-md-2"><div>

XXX

#### apt-mirror

Apt-mirror is a tool used on Linux to create a local mirror.

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

Aptly is a more complex but powerful tool to create mirrors.

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

<div class="row row-cols-md-2"><div>

```text!
apt-file
apt-file update
apt autoremove

* `sudo apt update -y && sudo apt full-upgrade -y && sudo apt autoremove -y && sudo apt autoclean -y`

* rpm, yum, dnf, pacman

* packages ([![linuxfundamentalspart3](../../../cybersecurity/_badges/thm/linuxfundamentalspart3.svg)](https://tryhackme.com/room/linuxfundamentalspart3))
  * `dnf update/yum update` (Fedora, Redhat)
  * `cat /etc/apt/sources.list`
```
</div><div>
</div></div>

<hr class="sep-both">

++++++
[**apt** - package manager]

<div class="row row-cols-md-2"><div>

**Usage** 🐚: `apt` is the default package manager on well-known Linux distros such as Debian/Ubuntu.

**Example** 🔥:

Install, Update, Remove a package

```ps
$ sudo apt install aptitude
$ sudo apt update aptitude
$ sudo apt upgrade aptitude
$ sudo apt remove aptitude
```

Download updates for/upgrade all packages

```ps
$ sudo apt update
$ sudo apt upgrade
```
</div><div>

**Update the OS** 🧪

```ps
$ sudo apt dist-upgrade
```

Remove unused dependencies

```ps
$ sudo apt auto-remove
```

When installing packages, you are prompted `Do you want to continue? [Y/n]` <small>(you need to enter `Y`)</small>. You can skip this, using `-y`.

```ps
$ sudo apt install -y aptitude
```
</div></div>

[**aptitude** - package manager]

<div class="row row-cols-md-2"><div>

**Usage** 🐚: `aptitude` <small>(which has to be installed)</small> is the same as `apt`, but there is a graphical interface.

**Example** 🔥:

```bash!
$ sudo aptitude # press 'q' to quit
```
</div><div>

Or, you can use it like `apt`:

```bash!
$ sudo aptitude install nano
```
</div></div>

[**dpkg** - package manager]

<div class="row row-cols-md-2"><div>

**Usage** 🐚: `apt` uses the lower-level package manager `dpkg` to install packages. Some developers may directly interact with it.

**Example** 🔥:

```bash!
$ sudo dpkg -i xxx.deb
```
</div></div>

[**snap** - package manager]

<div class="row row-cols-md-2"><div>

**Usage** 🐚: snap packages are a modern way to share application. They contain all dependencies, and support automatic updates. Some cons are their larger size and sometimes there are performance issues.

👉 Find [Snap packages here](https://snapcraft.io/).
</div><div>

**Example** 🔥:

```ps
$ sudo apt update
$ sudo apt install snapd
$ sudo snap install core
$ sudo snap refresh core
$ sudo snap install --classic xxx
```
</div></div>

[**update-alternatives** - 🛻]

<div class="row row-cols-md-2"><div>

**Usage** 🐚: available on Debian-based distributions. Allow us to switch between multiple versions of a same program.

🛻 c++, cc, nc, php, java...

**Example** 🔥:

```ps
$ sudo update-alternatives --config php
```
</div></div>
++++++