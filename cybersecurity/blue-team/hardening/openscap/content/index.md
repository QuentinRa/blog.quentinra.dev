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
docker$ cd content
docker$ ./build_product debian11 -j $(nproc)
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

A **control file** <small>(`content/controls/`)</small> 📝 correspond to a compliance guide. It contains some of the compliance metadata along with the list of controls that the guide contains.

A **rule** <small>(`content/products/`)</small> 🔑 correspond to a reusable task in a control. For instance, `partition_for_tmp` that checks if `/tmp` is on a separate partition. A rule contains metadata and link to a template.

A **product** <small>(`content/products/`)</small> 🧸 is a target of a compliance guide. It's mostly an operating system such as `fedora` <small>(=all versions)</small> or `debian11`. It links to a list of profiles.
</div><div>

A **profile** <small>(`content/products/<product>/profiles/`)</small> 🔎 is a list of rules. It may import rules from a control file.

A **template** <small>(`content/controls/`)</small> xxx.

An **applicability** check <small>(`content/controls/`)</small> xxx.

Jinja
</div></div>

<hr class="sep-both">

## 👻 To-do 👻

Stuff that I found, but never read/used yet.

<div class="row row-cols-md-2"><div>

* [_old](_old.md)
* remediation
</div><div>
</div></div>