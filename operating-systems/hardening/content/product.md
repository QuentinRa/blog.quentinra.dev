# Products

[Go back](../index.md)

<div class="row row-cols-md-2"><div>

This section is inspired from the [documentation](https://complianceascode.readthedocs.io/en/latest/manual/developer/03_creating_content.html#creating-a-new-product). We will add a new product called `parrot` for `Parrot Linux`.

* Product name: `parrot` <small>(ex: debian11)</small>
* Platform name: `parrot` <small>(ex: debian)</small>

First, link your product to the project files

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
</div><div>

Then create your product files

<details class="details-n">
<summary>./products/parrot/product.yml</summary>

```yaml
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
</div></div>