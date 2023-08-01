# Yocto

<div class="row row-cols-md-2"><div>

...
</div><div>

...
</div></div>

<hr class="sep-both">

## 👻 To-do 👻

Stuff that I found, but never read/used yet.

<div class="row row-cols-md-2"><div>

* Can choose the embedded CPU
* Work with any hardware (x86, arm...)
* Reusable components (meta-kde, meta-xxx)
  * meta-custom: your recipes

* Poky: the build system
* BitBake: executor and scheduler
* Metadata: definitions
  * .conf = variables, computer flags, paths...
  * .bbclass = build logic (ex: build a kernel, root fs...)
  * .bb = logic unit (ex: a library, packages)
* Steps during poky build
  * Download sources
  * Compile a list of what we need
  * Generate packages
  * Generate image (the base OS) + SDK (what you need for one application)
</div><div>

* Multiple meta folders = layers, they have a priority, can override settings from layers below

```bb
# xxx_version.bb
X = "value"
V = "${PV}" # version
DEPENDS += "yyy"

inherit autotools
inherit autotools xxx # gettext (localization)

yyy_[prepend|append|none]() {
  # ...
}
```

* Default is root with no password
* Source file (oe-init-build-env)
* `conf/` to edit local conf, and bbconf
* https://layers.openembedded.org/layerindex/branch/master/recipes/
* https://www.youtube.com/watch?v=r8hFRJ9vMWM

[Yocto](https://www.yoctoproject.org/) <small>(The Yocto Project)</small> is a referred to as a **meta-distribution**. It's a distribution creating tailored Linux distributions for specific [IoT](../_knowledge/index.md) needs.

It's an universal starting point for defining a custom Linux.

* Templates
* Methods
* Tools
</div></div>