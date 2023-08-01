# Yocto for embedded systems

<div class="row row-cols-md-2"><div>

Embedded systems have more limitations than usual workstations such as limited disk space or memory.

Because of that, there is a need to create small operating systems with as few packages as possible and properly configured for them to work within an environment with fewer resources.

[...]
</div><div>

To [get started](https://docs.yoctoproject.org/brief-yoctoprojectqs/index.html), install Poky. See also: [crops/poky](https://github.com/crops/poky-container).

```shell!
$ sudo apt install gawk wget git diffstat unzip texinfo gcc build-essential chrpath socat cpio python3 python3-pip python3-pexpect xz-utils debianutils iputils-ping python3-git python3-jinja2 libegl1-mesa libsdl1.2-dev python3-subunit mesa-common-dev zstd liblz4-tool file locales
$ git clone -b <poky_version> git://git.yoctoproject.org/poky.git
$ source poky/oe-init-build-env # load
```

[Petalinux](petalinux.md) is a build-system built on Yocto, and leveraging yocto components and tools for Xilinx platforms.
</div></div>

<hr class="sep-both">

## Random notes

<div class="row row-cols-md-2"><div>

#### Configuration files

```shell!
$ nano conf/local.conf
...
```

#### Bitbake

Bitbake is a multi-purpose command. 

```shell!
$ bitbake core-image-minimal
```

* `<build_folder>/tmp/deploy/images`: store the generated image files
</div><div>

...
</div></div>

<hr class="sep-both">

## 👻 To-do 👻

Stuff that I found, but never read/used yet.

<div class="row row-cols-md-2"><div>

* [_old](_old.md)
* OpenEmbedded-Core
* BitBake (Recipes)
* Poky
</div><div>

...
</div></div>