# Support a new package manager

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