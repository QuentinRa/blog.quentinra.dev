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