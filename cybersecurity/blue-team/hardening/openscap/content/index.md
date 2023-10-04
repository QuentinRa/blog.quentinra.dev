# ComplianceAsCode

<div class="row row-cols-md-2"><div>

[ComplianceAsCode/content](https://github.com/ComplianceAsCode/content) <small>(1.9k ⭐)</small> is a tool to create a product-specific XML <small>(ssg-debian11-ds.xml)</small> used by **OpenSCAP** 🔎.

In a nutshell, a product is an operating system or an app on which we run a compliance test, such as "debian11". It has profiles, such as "workstation.profile", which lists what "rules" we will use.

A rule, such as "partition_for_tmp" <small>(it checks if there is a separate partition for /tmp)</small>, contains a way to test the compliance of a system to something, along with other stuff such as remediation notes/scripts...

Note that the project is *somewhat* complex. ⚠️
</div><div>

There are multiple reasons to get involved with the Compliance As Code project. Most of the time, we may want to add support for a new product or for a new guide. Assuming that what you want to do, the [Compliance As Code Docker](https://github.com/ComplianceNinjas/compliance-as-code-docker) project might help.

To get started ✨: 

```shell!
$ git clone --recursive https://github.com/ComplianceNinjas/compliance-as-code-docker.git
$ docker compose up -d
$ docker attach $(docker compose ps -q)
$ ./build_product debian11 -j $(nproc)
```
</div></div>

<hr class="sep-both">

## 👻 To-do 👻

Stuff that I found, but never read/used yet.

<div class="row row-cols-md-2"><div>

* [_old](_old.md)
</div><div>
</div></div>