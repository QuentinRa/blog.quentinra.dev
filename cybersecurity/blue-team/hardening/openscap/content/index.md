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

## Jinja2

<div class="row row-cols-md-2"><div>

The project uses [jinja2](/programming-languages/web/others/templating/jinja2/index.md) allowing us to use macros and variables inside many of the project. 

Note that unlike usual `jinja` templates, we use one more level of accolades, so `{% %}` is now `{{% %}}` <small>(ansible-related reason)</small>.

Some examples of conditions you might use:

* `"ubuntu" in product`: true if product contains `ubuntu`
* `"ubuntu" not in product`: false if product contains `ubuntu`
* `product in ["debian10", "debian11"]`: true if product in array

Another example: `{% if negate %}negate="true" {% endif %}` which optionally show an OVAL attribute based on a variable `negate`.
</div><div>

OVAL Macros can be declared in `shared/macros/10-oval.jinja`, or directly inside any OVAL file.

```text!
{%- macro some_name(arg, arg2=none) -%}
    SOME_OVAL
{%- endmacro -%}
```

Assuming the macro is within scope <small>(in the general macro file or in the same file)</small>, you can call it with:

```text!
{{ some_name(arg='xxx') }}
```
</div></div>

<hr class="sep-both">

## Rule 🔑

<div class="row row-cols-md-2"><div>

A rule links every information related to a task of a hardening control. It's described in a `rule.yml`. It defines stuff like:

* 🌱 Description <small>(ex: explain what's this rule about)</small>
* 🔎 Rule check <small>(ex: to test if the rule was applied)</small>
* 🧯 Remediation utility <small>(ex: bash script, note...)</small>
* 🌍 Applicability check <small>(ex: package is not present ️→ rule not applicable)</small>
* 🔒 Product check <small>(ex: can this rule be used with this product?)</small>
* ...

A rule is stored in a folder. The folder name is the **rule id**. Rules are stored in groups, e.g. its parent folders, which all have a `group.yml`. You can place a rule in whatever folder you see fit.

<details class="details-n">
<summary>Common rule template</summary>

```yaml!
documentation_complete: true

prodtype: xxx,yyy,...

title: 'XXX'

description: XXX
rationale: XXX
severity: medium

platform: machine

references:
    xxx: xxx

template:
  name: xxx
  vars:
    - ...
```
</details>

➡️ Refer to the section about [rule format](https://complianceascode.readthedocs.io/en/latest/manual/developer/06_contributing_with_content.html#rules).

<br>

#### Rule Description

You can use `description`, and `rationale` to provide information. They support HTML tags such as:

* `<br />`: new line
* `<tt>xxx</tt>`: equivalent of `<code>`
* `<pre>xxx</pre>`: a line of code
* ...

☠️ If there is a problem with the documentation <small>(ex: `<br>` which is a missing auto-closing slash)</small>, build will fail at step 9.
</div><div>

#### prodtype

By default, all rules are compiled for all products. It's problematic as some rules may not be applicable to our product, leading to compilation problems.

Inside each rule, there may be a `prodtype`. If there is one,  then this rule can **only** be used by products that were added to it.

You can add your product to each rule `prodtype` manually 🤚 <small>(for the rules you need that have a prodtype)</small>, or use a script 🤖.

➡️ See [mod_prodtype.py](https://complianceascode.readthedocs.io/en/latest/manual/developer/05_tools_and_utilities.html#utils-mod-prodtype-py-programmatically-modify-prodtype-in-rule-yml) or [autoprodtyper.py](https://complianceascode.readthedocs.io/en/latest/manual/developer/05_tools_and_utilities.html#utils-autoprodtyper-py-automatically-add-product-to-prodtype).

⚠️ When using `autoprodtyper` with a control file, it **won't** work.

☠️ If the `prodtype` attribute is present, you'll get an error during build <small>(unselects all groups...)</small>.

<br>

#### Find rules

To find rules, you can look at other profiles or controls files, or you can use `find linux_os -name *ftp* -type d 2> /dev/null` <small>(ex: for ftp rules)</small>.

<br>

#### platform

By default, if a product uses a rule, the rule is considered to be applicable on it. But that's not always the case. We may require a package to be installed, a specific environment...

```yml!
platform: machine and package[ntp]
```

This rule is only applied if `./shared/applicability/machine.yml` and `./shared/applicability/package.yml` are true.

➡️ Refer to the [applicability](https://complianceascode.readthedocs.io/en/latest/manual/developer/06_contributing_with_content.html#applicability-by-cpe) section.
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

## OVAL Files

<div class="row row-cols-md-2"><div>

[OVAL](https://ovalproject.github.io/getting-started/tutorial/) is XML-based format used by many files of the project.
Basic concepts are [explained here](https://ovalproject.github.io/getting-started/tutorial/).

```xml!
<def-group>
  <!-- ... -->
  <definition class="..." id="..." version="...">
      <criteria>
          <criterion test_ref="..." />
      </criteria>
  </definition>
  <!-- body -->
</def-group>
```

The `class`, `id`, `version`, and `test_ref` values are specific to what kind of file you're creating. Others elements are explained here.

`criteria` define what to do to **pass the check**. You can ask for all checks to be true <small>(AND)</small>, or only at least one <small>(OR)</small>.

```xml!
<criteria operator="AND" [...] >
<criteria operator="OR" [...] >
```
</div><div>

A criteria may have children of type `criteria`, or `criterion`. For the later, they are referencing the test that will be done.

```xml!
<criterion test_ref="..." />
<criterion test_ref="..." negate="true" />
```

💡 Criterion might not be the only tag that support `negate`.

Tests are tags ending with `_test`. The usually have one or two children of type `_object`, and `_state` respectfully.

```xml!
<xxx:yyy_test id="test_xxx" check="all" comment="">
    <xxx:object object_ref="obj_xxx" />
</xxx:yyy_test>

<xxx:yyy_object id="obj_xxx">
    <!-- ... -->
</xxx:yyy_object>
```

⚠️ Absence of the `comment` attribute on a `_test` will make the build crash as they are displayed in the HTML report.
</div></div>

<hr class="sep-both">

## OVAL Checks

<div class="row row-cols-md-2"><div>

#### Link to a rule

A rule may either use a **template**:

```yaml!
template:
    name: your_template_name
    vars:
        arg1: value1
        arg1@product_name: value2
```

Or, you may add a `oval/shared.xml` file inside your rule folder.

➡️ The syntax `@product_name`, means that for a specific product, the argument will have a different value.

<br>

#### Template File

There are many [existing templates](https://complianceascode.readthedocs.io/en/latest/templates/template_reference.html) which you can use in your rules. They are located in `shared/templates`, see each `oval.template` file.

```xml!
<def-group>
  {{{ oval_metadata("XXX") }}}
  <definition class="compliance" id="{{{ _RULE_ID }}}" version="3">
      <criteria>
          <!-- ... -->
      </criteria>
  </definition>
  <!-- ... -->
</def-group>
```

👉 Use `{{{ ARG1 }}}` to access an argument `arg1` passed from a rule.
</div><div>

...
</div></div>

<hr class="sep-both">

## 👻 To-do 👻

Stuff that I found, but never read/used yet.

<div class="row row-cols-md-2"><div>

* [_old](_old.md)
* references are used to sort rules in HTML pages
* remediation 
* Can change some values in the generated XML
* A useful script to learn the [coverage of a profile](https://complianceascode.readthedocs.io/en/latest/manual/developer/05_tools_and_utilities.html#profile-statistics-and-utilities):

```shell!
$ ./build-scripts/profile_tool.py stats --profile xccdf_org.ssgproject.content_profile_standard --benchmark build/ssg-xxx-xccdf.xml
```
</div><div>

```xml!
<extend_definition comment="xxx" definition_ref="yyy" />
<external_variable datatype="int" id="var_xxx" />
```
</div></div>