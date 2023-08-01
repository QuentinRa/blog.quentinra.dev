# Yocto for embedded systems

<div class="row row-cols-md-2"><div>

Embedded systems have more limitations than usual workstations such as limited disk space or memory.

Because of that, there is a need to create small operating systems with as few packages as possible and properly configured for them to work within an environment with fewer resources.

[...]
</div><div>

To get started, install Poky. See also: [crops/poky](https://github.com/crops/poky-container).

```shell!
$ # assuming you got all deps installed
$ git clone -b <poky_version> git://git.yoctoproject.org/poky.git
$ source poky/oe-init-build-env # load
```

[Petalinux](petalinux.md) is a build-system built on Yocto, and leveraging yocto components and tools for Xilinx platforms.
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