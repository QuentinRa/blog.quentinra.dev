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

## Product Configuration

<div class="row row-cols-md-2"><div>

#### Creating a new product

After generating a new product using `init.sh`, you will have:

* A standard profile `standard.profile`
* A basic `product.yml` that describe your product
* A basic oval check `installed_OS_is_xxx.xml` testing if the tested product is matching the expected product <small>(ex: are we on debian11?)</small>

It automates the process from the [documentation](https://complianceascode.readthedocs.io/en/latest/manual/developer/03_creating_content.html#creating-a-new-product).

⚠️ If most/all tests are marked as `notapplicable`, it means that the tested OS do not pass the check in `installed_OS_is_xxx.xml`.
</div><div>
</div></div>

<hr class="sep-both">

## Controls and Profiles

<div class="row row-cols-md-2"><div>

#### Controls file

[Controls](https://complianceascode.readthedocs.io/en/latest/manual/developer/03_creating_content.html#controls) are YAML files representing hardening guides. They are stored in `./controls`. Each control may execute multiple rules.

```yaml!
# ./controls/anssi.yml
  - id: R40
    title: User authentication running sudo
    levels:
    - minimal
    [...]
    rules:
    # load a rule by ID
    - sudo_remove_nopasswd
    - sudo_remove_no_authenticate
```
</div><div>

#### Profiles

Each product has a folder `./products/<product_name>/profiles` with available profiles. They are YAML files with the extension `.profile`.

```yaml!
documentation_complete: true

title: '...'

description: |-
    ...

selections:
    # load a rule by ID
    - sudo_remove_nopasswd
    - ...
    # load rules from a control file
    - anssi:R40         # one specific rule
    - anssi:all         # all rules
    - anssi:all:minimal # only keep if minimal in levels
```
</div></div>

<hr class="sep-both">

## Support a new package manager

<div class="row row-cols-md-2"><div>

We differentiate package managers <small>(yum, dnf, apt_get, ...)</small> from the package system <small>(rpm, dpkg)</small>. Each is mapped to the other.

For instance, let's say we want to add `pacman`. On Arch Linux, `pacman` is both a package management and system tool.

We need to edit `shared` files that are always compiled. You're supposed to write the OVAL code according to your package system.

<details class="details-n">
<summary>./shared/applicability/oval/installed_env_has_grub2_package.xml</summary>

```xml!
[...]
{{% elif pkg_system == "dpkg" %}}
[...]
{{% elif pkg_system == "pacman" %}}
  <ind:textfilecontent54_test comment="Do nothing" id="obj_env_has_grub2_installed" version="1">
  </ind:textfilecontent54_test>
{{% endif %}}
[...]
```
</details>

<details class="details-n">
<summary>./shared/applicability/oval/installed_env_has_login_defs.xml</summary>

```xml!
[...]
{{% elif pkg_system == "dpkg" %}}
[...]
{{% elif pkg_system == "pacman" %}}
<ind:textfilecontent54_test comment="Do nothing" id="obj_env_has_login_defs_installed" version="1">
</ind:textfilecontent54_test>
{{% endif %}}
[...]
```
</details>

<details class="details-n">
<summary>./shared/applicability/oval/krb5_server_older_than_1_17_18.xml</summary>

```xml!
[...]
{{% elif pkg_system == "dpkg" %}}
[...]
{{% elif pkg_system == "pacman" %}}
<ind:textfilecontent54_test comment="Do nothing" id="test_krb5_server_version_1_17_18" version="1">
</ind:textfilecontent54_test>
{{% endif %}}
[...]
```
</details>

<details class="details-n">
<summary>./shared/applicability/oval/krb5_workstation_older_than_1_17_18.xml</summary>

```xml!
[...]
{{% elif pkg_system == "dpkg" %}}
[...]
{{% elif pkg_system == "pacman" %}}
<ind:textfilecontent54_test comment="Do nothing" id="test_krb5_workstation_version_1_17_18" version="1">
</ind:textfilecontent54_test>
{{% endif %}}
[...]
```
</details>
</div><div>


<details class="details-n">
<summary>./shared/checks/oval/installed_env_has_zipl_package.xml</summary>

```xml!
[...]
{{% elif pkg_system == "dpkg" %}}
[...]
{{% elif pkg_system == "pacman" %}}
<ind:textfilecontent54_test comment="Do nothing" id="test_env_has_zipl_installed" version="1">
</ind:textfilecontent54_test>
{{% endif %}}
[...]
```
</details>

<details class="details-n">
<summary>./shared/checks/oval/sshd_version_higher_than_74.xml</summary>

```xml!
[...]
{{% elif pkg_system == "dpkg" %}}
[...]
{{% elif pkg_system == "pacman" %}}
<ind:textfilecontent54_test comment="Do nothing" id="test_openssh-server_version" version="1">
</ind:textfilecontent54_test>

{{% endif %}}
[...]
```
</details>

Then, you have to fix macros:

<details class="details-n">
<summary>./shared/macros/10-bash.jinja</summary>

```xml!
[...]
{{%- macro bash_pkg_conditional(package, op=None, ver=None) -%}}
[...]
    {{%- elif pkg_system == "pacman" -%}}
        false
[...]
```
</details>

<details class="details-n">
<summary>./shared/macros/10-ocil.jinja</summary>

```xml!
[...]
{{% macro ocil_package(package) -%}}
[...]
    {{%- elif pkg_system == "pacman" -%}}
        Nothing.
    {{%- else -%}}
[...]
{{% macro complete_ocil_entry_package(package) -%}}
[...]
    {{%- elif pkg_system == "pacman" %}}
        Nothing.
    {{%- else -%}}
[...]
```
</details>

<details class="details-n">
<summary>./shared/macros/10-oval.jinja</summary>

```xml!
[...]
{{%- macro oval_test_package_removed(package='', test_id='') -%}}
[...]
{{% elif pkg_system == "pacman" %}}
<ind:textfilecontent54_test comment="Do nothing" id="{{{ test_id }}}" version="1">
</ind:textfilecontent54_test>
{{% endif %}}
[...]
{{%- macro oval_test_package_installed(package='', evr='', evr_op='greater than or equal', test_id='') -%}}
[...]
{{% elif pkg_system == "pacman" %}}
<ind:textfilecontent54_test comment="Do nothing" id="{{{ test_id }}}" version="1">
</ind:textfilecontent54_test>
{{% endif %}}
[...]
```
</details>

It should compile now, but you may have to adapt some rules or templates <small>(package managers may be used in applicability or in templates)</small>.

⚠️ You will most likely have to edit more project files to completely integrate your package manager/system <small>(remediation...)</small>.

💡 You can look for occurrences of other package managers/systems to find which files to edit.
</div></div>

<hr class="sep-both">

## 👻 To-do 👻

Stuff that I found, but never read/used yet.

<div class="row row-cols-md-2"><div>

* [_old](_old.md)
* remediation
</div><div>
</div></div>