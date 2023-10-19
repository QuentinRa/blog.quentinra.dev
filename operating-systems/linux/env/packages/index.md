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

#### APT mirror

xxx

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
</div></div>

<hr class="sep-both">

## 👻 To-do 👻

Stuff that I found, but never read/used yet.

<div class="row row-cols-md-2"><div>

xxx
</div><div>


</div></div>