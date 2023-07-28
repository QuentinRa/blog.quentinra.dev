# Products

[Go back](../index.md)

<div class="row row-cols-md-2"><div>

This section is inspired from the [documentation](https://complianceascode.readthedocs.io/en/latest/manual/developer/03_creating_content.html#creating-a-new-product). We will add a new product called `parrot` for `Parrot Linux`.

* Product name: `parrot` <small>(ex: debian11)</small>
* Platform name: `parrot` <small>(ex: debian)</small>

<br>

**First, link your product to the project files**

<details class="details-n">
<summary>./CMakeLists.txt</summary>

```text!
[...]
option(SSG_PRODUCT_PARROT "If enabled, the openSUSE SCAP content will be built" ${SSG_PRODUCT_DEFAULT})
[...]
message(STATUS "Parrot Linux: ${SSG_PRODUCT_PARROT}")
[...]
if(SSG_PRODUCT_PARROT)
    add_subdirectory("products/parrot" "parrot")
endif()
```
</details>

<details class="details-n">
<summary>./ssg/constants.py</summary>

```python
product_directories = [
    ...
    'parrot',
    ...
]

# Left = Human name, Right = product name
FULL_NAME_TO_PRODUCT_MAPPING = {
    ...
    "Parrot Linux": "parrot",
    ...
}

# Product name without the version
MULTI_PLATFORM_LIST = [..., "parrot"]

# Left = "multi_platform_..." followed by the platform above
# Right = products on this platform
MULTI_PLATFORM_MAPPING = {
    ...
    "multi_platform_parrot": ["parrot"],
    ...
}

# Left = platform name, Right = Human Readable
MAKEFILE_ID_TO_PRODUCT_MAP = {
    ...
    'parrot': 'Parrot Linux',
    ...
}
```
</details>

<details class="details-n">
<summary>./build_product.sh</summary>

```bash!
...
all_cmake_products=(
  ...
  PARROT
  ...
)
...
```
</details>

<details class="details-n">
<summary>./shared/checks/oval/sysctl_kernel_ipv6_disable.xml</summary>

```diff
...
	<platform>multi_platform_parrot</platform>
...
```
</details>
</div><div>

**Then create your product files**

<details class="details-n">
<summary>./products/parrot/product.yml</summary>

```yaml!
product: parrot
full_name: Parrot Linux
type: platform

benchmark_id: PARROT
benchmark_root: "../../linux_os/guide"

profiles_root: "./profiles"

# see others for values
pkg_manager: "apt_get"
init_system: "systemd"

cpes_root: "../../shared/applicability"
cpes:
  # one for each version supported by this product
  - parrot5.3:
      name: "cpe:/o:parrot:5.3"
      title: "Parrot Linux 5.3"
      check_id: installed_OS_is_parrot
```
</details>

<details class="details-n">
<summary>./products/parrot/CMakeLists.txt</summary>

```text!
# Sometimes our users will try to do: "cd parrot; cmake ." That needs to error in a nice way.
if("${CMAKE_SOURCE_DIR}" STREQUAL "${CMAKE_CURRENT_SOURCE_DIR}")
message(FATAL_ERROR "cmake has to be used on the root CMakeLists.txt, see the Building ComplianceAsCode section in the Developer Guide!")
endif()

ssg_build_product("parrot")
```
</details>

<details class="details-n">
<summary>./products/parrot/transforms/constants.xslt</summary>

```xml!
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">

<xsl:include href="../../../shared/transforms/shared_constants.xslt"/>

<xsl:variable name="product_long_name">Parrot Linux</xsl:variable>
<xsl:variable name="product_short_name">Parrot Linux</xsl:variable>
<xsl:variable name="product_stig_id_name">empty</xsl:variable>
<xsl:variable name="prod_type">parrot</xsl:variable>

<xsl:variable name="cisuri">empty</xsl:variable>

</xsl:stylesheet>
```
</details>

<details class="details-n">
<summary>./products/parrot/profiles/standard.profile</summary>

```yaml!
documentation_complete: true

title: 'Standard System Security Profile for Parrot Linux'

description: |-
    This profile contains rules to ensure standard security baseline
    of an Parrot Linux system. Regardless of your system's workload
    all of these checks should pass.

selections:
    - file_owner_etc_passwd
    - file_groupowner_etc_passwd
    - file_permissions_etc_passwd
```
</details>

In `product.yml`, we used `installed_OS_is_parrot`. This a check we will define that will mark test as `notapplicable` if we are using Parrot XML on an OS not running Parrot.

To check if the target is running Parrot Linux, we will check if `/etc/debian_version` contains `parrot`.

<details class="details-n">
<summary>./shared/checks/oval/installed_OS_is_parrot.xml</summary>

```xml!
<def-group>
  <definition class="inventory" id="installed_OS_is_parrot" version="3">
    <metadata>
      <title>Installed operating system is Parrot Linux</title>
      <affected family="unix">
        <platform>multi_platform_all</platform>
      </affected>
      <reference ref_id="cpe:/o:parrot:5.3" source="CPE" />
      <description>The operating system installed on the system is Parrot Linux</description>
    </metadata>
    <criteria operator="AND">
      <extend_definition comment="Installed OS is part of the Unix family" definition_ref="installed_OS_is_part_of_Unix_family" />
      <criterion comment="Parrot Linux is installed" test_ref="test_os_is_parrot" />
    </criteria>
  </definition>

  <ind:textfilecontent54_test check="all" comment="Parrot Linux is installed" id="test_os_is_parrot" version="1">
    <ind:object object_ref="object_os_is_parrot" />
  </ind:textfilecontent54_test>
  <ind:textfilecontent54_object id="object_os_is_parrot" version="1">
    <ind:filepath>/etc/debian_version</ind:filepath>
    <ind:pattern operation="pattern match">^parrot$</ind:pattern>
    <ind:instance datatype="int" operation="equals">1</ind:instance>
  </ind:textfilecontent54_object>
</def-group>
```
</details>
</div></div>

<hr class="sep-both">

## Support a new package manager

<div class="row row-cols-md-2"><div>

We differentiate **package managers** (yum, dnf, apt_get, ...) from the **package system** (rpm, dpkg). Each package manager is associated with one package system.

For instance, let's say we want to add `pacman`. On Arch Linux, `pacman` is both a package management and system tool.

<details class="details-n">
<summary>./ssg/constants.py</summary>

```diff
PKG_MANAGER_TO_SYSTEM = {
    "yum": "rpm",
    "zypper": "rpm",
    "dnf": "rpm",
    "apt_get": "dpkg",
+    "pacman": "pacman",
}
```
</details>

We need to edit `shared` files that are always compiled. You're supposed to write the [OVAL](oval.md) code according to your package system. 

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

⚠️ You will most likely have to edit more project files to completely  <small>(remediation...)</small> integrate your package manager/system. 

💡 You can look for occurrences of other package managers/systems to find which files to edit.
</div></div>