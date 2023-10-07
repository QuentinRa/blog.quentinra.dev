# Rule check

<div class="row row-cols-md-2"><div>

#### Template

Some rules are using a [template](templates.md) to check if a rule was applied or not on the target, **but that's not the only way**.

You can pass arguments to your template using `vars`.

```yaml!
template:
    name: your_template_name
    vars:
        arg1: value1
        arg1@product_name: value2
```

➡️ The syntax `@product_name`, means that for a specific product, the argument will have a different value.
</div><div>

#### Local OVAL check

An alternative to templates is to use a local OVAL check. It's the same as a template, aside from the fact that it's only usable with one rule.

Given a rule `<rule_id>`, the check will be called `shared.xml`, and stored in `<rule_id>/oval/shared.xml`.

The definition ID is now the **Rule ID**.

```diff
-<definition class="compliance" id="{{{ _RULE_ID }}}" version="3">
+<definition class="compliance" id="rule_id" version="3">
```
</div></div>

<hr class="sep-both">

## OVAL templates

[Go back](../index.md)

<div class="row row-cols-md-2"><div>

A test is written in [OVAL](https://ovalproject.github.io/getting-started/tutorial/), which is XML-based. Some tests are referred to as templates, if they were designed to be reused in multiple rules, but with different arguments passed to them.

In most files: `rule.yml`, `some_oval.xml`... You can use [jinja](https://complianceascode.readthedocs.io/en/latest/jinja_macros/01-general.html) <small>([official doc](https://jinja.palletsprojects.com/en/3.0.x/))</small> macros to inject some code within a file <small>(ex: branching, loops, args...)</small>.

Here are some notes about [OVAL](_files/oval.md), which is used in `templates`, `checks`, and `applicability` files. Here are some notes about [jinja](_files/jinja.md) too.

There are many [existing templates](https://complianceascode.readthedocs.io/en/latest/templates/template_reference.html) which you can use in your rules. They are located in `shared/templates`, see each `oval.template` file.

A template is written in [OVAL](oval.md), so refer to it for the syntax. The only specific part are:

* `class="compliance"`: specific to tests for compliance

* `id="..."`: each compliance check is associated with **one rule**. We are using `{{{ _RULE_ID }}}` so that it's replaced with the ID of the rule using this template.
</div><div>

```xml
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
</div></div>

<hr class="sep-both">

## Arguments

<div class="row row-cols-md-2"><div>

[Rules](rules.md) can pass arguments to a template.

```yaml!
template:
    name: a_template_name
    vars:
        some_arg: xxx
```

The argument is available in a [jinja variable](jinja.md#variables) called `SOME_ARG`.

There is always **at least one argument**, because **each ID must be unique** <small>(definition, test, object, state...)</small>.
</div><div>

❌ We can't use:

```xml!
<ind:textfilecontent54_test id="test_xxx" ...>
    ...
</ind:textfilecontent54_test>
```

✅ We can generate an ID as follows:

```xml!
<ind:textfilecontent54_test id="test_{{{ SOME_ARG }}}" ...>
    ...
</ind:textfilecontent54_test>
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