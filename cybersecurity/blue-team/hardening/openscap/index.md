# OpenSCAP

<div class="row row-cols-md-2"><div>

[OpenSCAP](https://www.open-scap.org/) (1.2k ⭐) is a tool that can automatically scan if a hardening guide was applied and even automatically apply the guide.

* [Documentation](https://static.open-scap.org/)
* [GitHub](https://github.com/OpenSCAP/openscap)
</div><div>

To install OpenSCAP on Debian 10:

```shell!
$ sudo apt-get update && sudo apt-get install libopenscap8
```

To check if openscap is installed:

```ps
$ oscap -V | head -n 1
OpenSCAP command line tool (oscap) X.Y.Z
```
</div></div>

<hr class="sep-both">

## Basic Usage

<div class="row row-cols-md-2"><div>

#### Select A Guide

Each XML file is targeting a platform, such as `debian11`. Each XML is then divided in **profiles** which usually correspond to a guide adapted for a kind of target <small>(ex: CIS Guide for Workstations)</small>.

```shell!
$ oscap info some_compliance_guide.xml
[...]
Profiles:
    Title: Standard System Security Profile for Parrot Linux
    Id: xccdf_org.ssgproject.content_profile_standard
```
</div><div>

#### Compliance scan

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