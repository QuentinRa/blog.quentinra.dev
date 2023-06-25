# Hardening

[![linuxsystemhardening](../../cybersecurity/_badges/thmp/linuxsystemhardening.svg)](https://tryhackme.com/room/linuxsystemhardening)

<div class="row row-cols-md-2"><div>

Hardening refers to increasing the security <small>(confidentiality, integrity, availability)</small> of:

* 🖥️ Workstations
* 🛰️ Servers
* 🌍 Network devices
* 📂 Apps, tools and services
* ...
</div><div>

Tasks to do are defined in guides provided by organization such as [CIS](https://www.cisecurity.org/cis-benchmarks) or [ANSII](https://www.ssi.gouv.fr/uploads/2019/03/linux_configuration-en-v1.2.pdf), while organizations can have their own guide.

👉 See also: [awesome-security-hardening](https://github.com/decalage2/awesome-security-hardening) (4.4k ⭐)

➡️ CIS provide [Build Kits](https://learn.cisecurity.org/build-kits) <small>(GPOs or shell scripts)</small>, and [Hardened Images](https://www.cisecurity.org/cis-hardened-images)...

➡️ On [Tenable](https://www.tenable.com/audits) or others, you can find CIS guides as a checklist.
</div></div>

<hr class="sep-both">

## OpenSCAP

<div class="row row-cols-md-2"><div>

[OpenSCAP](https://github.com/OpenSCAP/openscap) (1.1k ⭐) is a tool to test if a device is hardened given a guide, and may be able to apply remediation automatically.

* [OpenSCAP website](https://www.open-scap.org/)
* [User manual, API, and HTML Guides](https://static.open-scap.org/)

```shell!
$ # debian 10
$ sudo apt-get update && sudo apt-get install libopenscap8
```

```ps
$ oscap -V | head -n 1
OpenSCAP command line tool (oscap) X.Y.Z
```

Guides are XML files, such as `ssg-debian11-ds.xml`. They were created with [ComplianceAsCode/content](#complianceascodecontent) project, and you can [download all of them here](https://github.com/ComplianceAsCode/content/releases/). You may put them in ` /usr/share/xml/scap/ssg/content/`.
</div><div>

Each guide have **profile**, for instance, some guides have a **workstation** profile testing hardening checks for workstations.

```shell!
$ oscap info some_xml.xml
[...]
Profiles:
    Title: Standard System Security Profile for Parrot Linux
    Id: xccdf_org.ssgproject.content_profile_standard
```

To check if a system is hardened given a profile, and a guide:

```shell!
$ oscap xccdf eval --profile xccdf_org.ssgproject.content_profile_standard some_xml.xml
```

To generate a HTML report:

```shell!
$ oscap xccdf eval [...] --report report.html some_xml.xml
```
</div></div>

<hr class="sep-both">

## ComplianceAsCode/content

<div class="row row-cols-md-2"><div>

[ComplianceAsCode/content](https://github.com/ComplianceAsCode/content) <small>(1.8k ⭐)</small> is a tool to create a platform-specific XML used by **OpenSCAP** 🔎. It allows you to select which rules will be applied, and tune them to fit your target platform 🚀.

* [Documentation](https://complianceascode.readthedocs.io/en/latest/manual/developer/01_introduction.html) <small>(mostly obsolete, or relatively empty)</small>
* [Fedora docker setup](content/install.md)
* Note that the project is *somewhat* complex

In a nutshell, a **product** is an operating system <small>(or an app actually)</small> in a specific version, such as `debian11`. It has **profiles**, such as `workstation.profile`, which lists what **rules** we will use.

A **rule**, such as `partition_for_tmp` <small>(checks if there is a separate partition for /tmp)</small>, contains a way to test if the system pass the check, along other stuff such as remediation notes/scripts...
</div><div>

A **check** is written in [OVAL](https://ovalproject.github.io/getting-started/tutorial/), which is XML-based. Some are referred to as **templates**, if they were designed to be reused in multiple rules, but with different arguments passed to them. 

In most files: `rule.yml`, `some_oval.xml`... You can use [jinja](https://complianceascode.readthedocs.io/en/latest/jinja_macros/01-general.html) <small>([official doc](https://jinja.palletsprojects.com/en/3.0.x/))</small> macros to inject some code within a file <small>(ex: branching, loops...)</small>.

* [Add a new product](content/product.md)
* [Loading rules in a profile]()
* [Adding new rules](content/rules.md)
* [Adding/Editing templates](content/templates.md)
* [Building a product]()

Here are some notes about [OVAL](content/oval.md), which is used in `templates`, `checks`, and `applicability` files. Here are some notes about [jinja](content/jinja.md) too.

</div></div>

<hr class="sep-both">

## 👻 To-do 👻

Stuff that I found, but never read/used yet.

<div class="row row-cols-md-2"><div>

* CIS (cyber-defense, hardening kits - build kit content)
* XCCDF (Extensible Configuration Checklist Description Format)
* OpenSCAP

```
scap-workbench ssg-xxx-ds.xml
oscap ds sds-validate ssg-xxx-ds.xml
oscap info ssg-xxx-ds.xml
oscap-ssh xxx@IP 22 \
  xccdf eval \
  --profile xccdf_org.ssgproject.content_profile_xxx \
  --results-arf results.xml --report report.html \
  ssg-xxx-ds.xml
```
</div><div>

ComplianceAsCode

```bash
./build_product xxx

cd /content
source .pyenv.sh
./utils/rule_dir_json.py
cat build/rule_dirs.json | json_pp | grep "service_rsh_disabled"
   "service_rsh_disabled" : {
      "dir" : "/content/linux_os/guide/services/obsolete/r_services/service_rsh_disabled",
      "id" : "service_rsh_disabled",
./utils/autoprodtyper.py xxx yyy
```

* Can change some values in the generated XML
* Test `error`
* Error during build: try the command yourself, you may see additional information
* `find linux_os -name *ftp* -type d 2> /dev/null`
* [control file](https://complianceascode.readthedocs.io/en/latest/manual/developer/03_creating_content.html#controls)
</div></div>