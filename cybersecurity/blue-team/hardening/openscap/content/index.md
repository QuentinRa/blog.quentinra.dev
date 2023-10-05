# ComplianceAsCode

<div class="row row-cols-md-2"><div>

[ComplianceAsCode/content](https://github.com/ComplianceAsCode/content) <small>(1.9k ⭐)</small> is a tool to create a product-specific XML <small>(ssg-debian11-ds.xml)</small> used by **OpenSCAP** 🔎.

There are multiple reasons to get involved with the Compliance As Code project. Most of the time, we may want to add support for a new product or for a new guide. Assuming that what you want to do, the [Compliance As Code Docker](https://github.com/ComplianceNinjas/compliance-as-code-docker) project might help.

To get started with it ✨:

```ps
$ git clone --recursive "https://github.com/ComplianceNinjas/compliance-as-code-docker.git" cac_docker
$ cd cac_docker
$ docker compose up -d
$ docker attach $(docker compose ps -q)
docker$ cd content && ./build_product debian11 -j $(nproc)
```
</div><div>

Once you did successfully build an existing product, you might generate your own product using the template.

```ps
$ cd loader/.template
$ ./init.sh
$ cd .. 
$ nano config.json # product information
$ python3 merge.py # merge files in "content/"
docker$ source .pyenv.sh
docker$ ./utils/after_merge.sh
docker$ ./build_product <your_product_name> -j $(nproc)
$ ./clean.sh       # undo merge in "content/"
```

We merge your files in `loader/` into `content/`, then generate/update rules, and finally build our product. Inside `loader`, we don't have any of the rules automatically edited by scripts with `./utils/after_merge.sh`.
</div></div>

<hr class="sep-both">

## Project Overview

<div class="row row-cols-md-2"><div>

Note that the project is *somewhat* complex. ⚠️

A **control** <small>(`content/controls/`)</small> xxx.

A **rule** <small>(`content/products/`)</small> xxx. A rule, such as "partition_for_tmp" <small>(it checks if there is a separate partition for /tmp)</small>, contains a way to test the compliance of a system to something, along with other stuff such as remediation notes/scripts...

A **product** <small>(`content/products/`)</small> xxx. In a nutshell, a product is an operating system or an app on which we run a compliance test, such as "debian11". 

A **profile** <small>(`content/products/<product>/profiles/`)</small> xxx. It has profiles, such as "workstation.profile", which lists what "rules" we will use.

A **template** <small>(`content/controls/`)</small> xxx.
</div><div>

An **applicability** check <small>(`content/controls/`)</small> xxx.

Jinja
</div></div>

<hr class="sep-both">

## 👻 To-do 👻

Stuff that I found, but never read/used yet.

<div class="row row-cols-md-2"><div>

* [_old](_old.md)
</div><div>
</div></div>