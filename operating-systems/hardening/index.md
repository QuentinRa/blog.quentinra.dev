# Hardening

<div class="row row-cols-md-2"><div>

...
</div><div>

...
</div></div>

<hr class="sep-both">

## ComplianceAsCode/content

<div class="row row-cols-md-2"><div>

[ComplianceAsCode/content](https://github.com/ComplianceAsCode/content) <small>(1.8k ⭐)</small> is a tool to create a platform-specific XML used by **OpenSCAP** 🔎. It allows you to select which rules will be applied, and tune them to fit your target platform 🚀.

* [Documentation](https://complianceascode.readthedocs.io/en/latest/manual/developer/01_introduction.html) <small>(mostly obsolete, or relatively empty)</small>
* Note that the project is *somewhat* complex

In a nutshell, a **product** is an operating system <small>(or an app actually)</small> in a specific version, such as `debian11`. It has **profiles**, such as `workstation.profile`, which lists what **rules** we will use.

A **rule**, such as `partition_for_tmp` <small>(checks if there is a separate partition for /tmp)</small>, contains a way to test if the system pass the check, along other stuff such as remediation notes/scripts...
</div><div>

A **check** is written in OCIL, which is XML-based. They are referred to as **templates**, as they are designed to be reused in multiple rules, but with different arguments passed to them. 

In most files: `rule.yml`, `some_ocil.xml`... You can use [jinja](https://complianceascode.readthedocs.io/en/latest/jinja_macros/01-general.html) <small>([official doc](https://jinja.palletsprojects.com/en/3.0.x/))</small> macros to inject some code within a file <small>(ex: branching, loops...)</small>.

* [Add a new product]()
* [Loading rules in a profile]()
* [Adding new rules]()
* [Adding new templates]()
* [Building a product]()
</div></div>

<hr class="sep-both">

## 👻 To-do 👻

Stuff that I found, but never read/used yet.

<div class="row row-cols-md-2"><div>

* CIS (cyber-defense, hardening kits - build kit content)
* XCCDF (Extensible Configuration Checklist Description Format)
* OpenSCAP
</div><div>


</div></div>