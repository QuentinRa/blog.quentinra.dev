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

Note that the project is *somewhat* complex. ⚠️

<div class="row row-cols-md-2"><div>

A **control** 🔎 is a recommendation of an hardening guide, such as [Ensure /tmp is a separate partition](https://www.tenable.com/audits/items/CIS_Red_Hat_EL9_v1.0.0_L1_Server.audit:cd31711d0572f143d773d53f0c976db1). One control may contain multiple tasks to perform.

A **control file** <small>(`content/controls/`)</small> 📝 correspond to a compliance guide. It contains some of the compliance metadata along with the list of controls that the guide contains.

A **rule** <small>(`linux_os/guide/`)</small> 🔑 correspond to a reusable task in a control. For instance, `partition_for_tmp` that checks if `/tmp` is on a separate partition. A rule contains metadata and link to a template.

A **product** <small>(`content/products/<product>/`)</small> 🧸 is a target of a compliance guide. It's mostly an operating system such as `fedora` <small>(=all versions)</small> or `debian11`. It links to a list of profiles.
</div><div>

A **profile** <small>(`content/products/<product>/profiles/`)</small> ✅ is a list of rules. It may reference some specific rules in a control file <small>(ex: all from level 1)</small>.

A **template** <small>(`shared/templates/`)</small> 🗃️ is a reusable OVAL check.

An **OVAL check** <small>(`oval.template`, `shared.xml`...)</small> 🎯 describes how we can check if a rule was applied.

An **applicability** check <small>(`shared/applicability/`)</small> is used to check if a rule is applicable given the state of the product <small>(package not installed)</small>.
</div></div>

<hr class="sep-both">

## 👻 To-do 👻

Stuff that I found, but never read/used yet.

<div class="row row-cols-md-2"><div>

* [_old](_old.md)
* remediation
</div><div>
</div></div>