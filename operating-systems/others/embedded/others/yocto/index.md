# Yocto for embedded systems

<div class="row row-cols-lg-2"><div>

Embedded systems have more limitations than usual workstations such as limited disk space or memory.

Because of that, there is a need to create a minimal operating systems with as few packages as possible and properly configure them to work within an environment with fewer resources.

[Yocto](https://www.yoctoproject.org/) is a collaborative project to create Linux-based systems designed for embedded products.
</div><div>

To [get started](https://docs.yoctoproject.org/brief-yoctoprojectqs/index.html), install Poky. See also: [crops/poky](https://github.com/crops/poky-container).

```shell!
$ sudo apt install gawk wget git diffstat unzip texinfo gcc build-essential chrpath socat cpio python3 python3-pip python3-pexpect xz-utils debianutils iputils-ping python3-git python3-jinja2 libegl1-mesa libsdl1.2-dev python3-subunit mesa-common-dev zstd liblz4-tool file locales
$ git clone -b <poky_version> git://git.yoctoproject.org/poky.git
$ source poky/oe-init-build-env # load
```
</div></div>

<hr class="sep-both">

## Random notes

<div class="row row-cols-lg-2"><div>

#### Configuration files

Configuration files are in the `conf` folder.

```ps
$ nano conf/local.conf
# add or remove packages from the image
IMAGE_INSTALL_append = " xxx"
IMAGE_INSTALL_remove = " xxx"
# Enable GUI/...
DISTRO_FEATURES_append = " feature-name" 
```

#### Bitbake

Bitbake is a multipurpose build engine. 

```shell!
$ bitbake core-image-minimal   # build an image
$ bitbake -c <some_task> [...] # run a specific task
```

When building images, it stores the generated image files in `<build_folder>/tmp/deploy/images`.
</div><div>

#### Image recipe

You create multiple image recipes.



```shell!
$ cat recipes-core/images/custom-image.bb
```
```bash!
DESCRIPTION = "Custom Image"
LICENSE = "CLOSED"
PR = "r0"

inherit core-image

# see https://layers.openembedded.org/layerindex/branch/master/recipes/
# if there are from openembedded-core everything is fine
# otherwise, edit: conf/bblayers.conf
IMAGE_INSTALL_append = " vim"
```
```shell!
$ cat conf/local.conf
...
IMAGE_INSTALL_append = " custom-image"
$ bitbake custom-image
```
</div></div>

<hr class="sep-both">

## Petalinux

<div class="row row-cols-lg-2"><div>

Petalinux is a build-system built on Yocto, and leveraging yocto components and tools for Xilinx platforms.

```shell!
$ # assuming PETALINUX was download from Xilinx website
$ source <PETALINUX_DIR>/settings.sh
$ petalinux-util --version      # OK
```
</div><div>

```shell!
$ petalinux-create [...]
$ petalinux-config [...]
$ petalinux-build
```

➡️ `images/linux` for the output.
</div></div>

<hr class="sep-both">

## 👻 To-do 👻

Stuff that I found, but never read/used yet.

<div class="row row-cols-lg-2"><div>

* Layers (priority/...)
* Recipes
* Devtool
* Steps: download (fetch), compile, generate packages, generate image (sdk? rootfs?)
</div><div>

* IPK/OPKG files
  * swupdate, entware
* SSTATE
* Yocto native recipes generate tools for our host that will be used to compile the target recipes
* `bitbake -c xxx -x yyy`

Set the password of "root" to "root"

```text!
# local.conf
INHERIT += "extrausers"
EXTRA_USERS_PARAMS = "usermod -P root root;"
```
</div></div>