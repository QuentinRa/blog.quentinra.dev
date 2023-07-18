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
* [Install instructions](openscap/install.md)

<br>

#### XML info

Each guide has **profiles**. For instance, some guides have a **workstation** profile testing the hardening compliance of workstations.

```shell!
$ oscap info some_compliance_guide.xml
[...]
Profiles:
    Title: Standard System Security Profile for Parrot Linux
    Id: xccdf_org.ssgproject.content_profile_standard
```
</div><div>

#### Compliance test

To check if a system is hardened given a profile, and a guide:

```shell!
$ oscap xccdf eval \
    --profile xccdf_org.ssgproject.content_profile_standard \
    some_compliance_guide.xml
```

You can add more options right before the XML.

* To generate an HTML report, add `--report report.html`.
* To add verbosity, add `--verbose INFO`

💡 You can test a remote system using `oscap-ssh`, as long as the target has openscap installed. Refer to the manual.

🚀 You can use a GUI called [scap-workbench](https://github.com/OpenSCAP/scap-workbench) (0.2k ⭐).
</div></div>

<hr class="sep-both">

## ComplianceAsCode/content

<div class="row row-cols-md-2"><div>

[ComplianceAsCode/content](https://github.com/ComplianceAsCode/content) <small>(1.8k ⭐)</small> is a tool to create a platform-specific XML used by **OpenSCAP** 🔎. It allows you to select which rules will be applied, and tune them to fit your target platform 🚀.

* [Documentation](https://complianceascode.readthedocs.io/en/latest/manual/developer/01_introduction.html)
* [Fedora docker setup](content/install.md)
* Note that the project is *somewhat* complex

In a nutshell, a product is an operating system or an app on which we run a compliance test, such as `debian11`. It has profiles, such as `workstation.profile`, which lists what "rules" we will use.

A rule, such as `partition_for_tmp` <small>(checks if there is a separate partition for /tmp)</small>, contains a way to test the compliance of a system, along other stuff such as remediation notes/scripts...
</div><div>

A test is written in [OVAL](https://ovalproject.github.io/getting-started/tutorial/), which is XML-based. Some tests are referred to as templates, if they were designed to be reused in multiple rules, but with different arguments passed to them. 

In most files: `rule.yml`, `some_oval.xml`... You can use [jinja](https://complianceascode.readthedocs.io/en/latest/jinja_macros/01-general.html) <small>([official doc](https://jinja.palletsprojects.com/en/3.0.x/))</small> macros to inject some code within a file <small>(ex: branching, loops, args...)</small>.

* [Add a new product](content/product.md)
* [Loading rules in a profile](content/profiles.md)
* [Adding new rules](content/rules.md)
* [Adding/Editing templates](content/templates.md)
* [Building a product](content/compilation.md)

Here are some notes about [OVAL](content/oval.md), which is used in `templates`, `checks`, and `applicability` files. Here are some notes about [jinja](content/jinja.md) too.

</div></div>

<hr class="sep-both">

## 👻 To-do 👻

Stuff that I found, but never read/used yet.

<div class="row row-cols-md-2"><div>

* [Protection_ring](https://en.wikipedia.org/wiki/Protection_ring)
</div><div>
</div></div>