# Install OpenSCAP

[Go back](../index.md)

<div class="row row-cols-md-2"><div>

On debian 10, you can use:

```shell!
$ sudo apt-get update && sudo apt-get install libopenscap8
```

To check if openscap is installed:

```ps
$ oscap -V | head -n 1
OpenSCAP command line tool (oscap) X.Y.Z
```
</div><div>

Guides are XML files, such as `ssg-debian11-ds.xml`. They were created with [ComplianceAsCode/content](../index.md#complianceascodecontent) project, and you can [download all of them here](https://github.com/ComplianceAsCode/content/releases/). You may put them in ` /usr/share/xml/scap/ssg/content/`.
</div></div>