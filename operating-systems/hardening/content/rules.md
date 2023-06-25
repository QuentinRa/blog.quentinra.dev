# Rules

[Go back](../index.md)

<div class="row row-cols-md-2"><div>

A rule link every information related to the hardening rule. It's described in a `rule.yml`. It defines stuff like:

* 🌱 Description <small>(ex: explain what's this rule about)</small>
* 🔎 Rule check <small>(ex: test if the rule was applied)</small>
* 🧯 Remediation utility <small>(ex: bash script, note...)</small>
* 🌍 Applicability check <small>(ex: package is not present ️→ rule not applicable)</small>
* 🔒 Product check <small>(ex: can this rule be used with this product?)</small>
* ...

A rule is stored in a folder. The folder name is the **rule id**.

Below is the rule `file_groupowner_etc_passwd`.

```
./linux_os/guide/system/permissions/files/permissions_important_account_files/file_groupowner_etc_passwd/
```

Rules are stored in groups, e.g. its parent folders, which all have a `group.yml`. You can place a rule in whatever folder you see fit.

➡️ Refer to the section about [rule format](https://complianceascode.readthedocs.io/en/latest/manual/developer/06_contributing_with_content.html#rules).
</div><div>

💡 Don't forget that you can use [jinja](jinja.md) in any file.

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
</div></div>

<hr class="sep-both">

## Description

<div class="row row-cols-md-2"><div>

You can use `description`, and `rationale` to provide information. They support HTML tags such as:

* `<br />`: new line
* `<tt>xxx</tt>`: equivalent of `<code>`
* `<pre>xxx</pre>`: a line of code
* ...

☠️ If there is a problem with the documentation <small>(ex: `<br>` which is a missing auto-closing slash)</small>, build will fail at step 9.
</div><div>

As a reminder, you can create multi-lines texts using `|-`

```yaml!
description: |-
    XXX xxx <br />
    YYY yyy
```
</div></div>

<hr class="sep-both">

## prodtype and platform

<div class="row row-cols-md-2"><div>

#### prodtype

If there is a `prodtype` attribute, then this rule can **only** be used by products that were added in `prodtype`. You can add your product to each rule `prodtype` manually 🤚, or use a script 🤖.

➡️ See [mod_prodtype.py](https://complianceascode.readthedocs.io/en/latest/manual/developer/05_tools_and_utilities.html#utils-mod-prodtype-py-programmatically-modify-prodtype-in-rule-yml) or [autoprodtyper.py](https://complianceascode.readthedocs.io/en/latest/manual/developer/05_tools_and_utilities.html#utils-autoprodtyper-py-automatically-add-product-to-prodtype). To be able to execute scripts, you need [to execute some commands](compilation.md#scripts) first.

⚠️ When using `autoprodtyper` with controls, it **won't** work.

☠️ If the `prodtype` attribute is present, you'll get an error during build <small>(unselects all groups...)</small>.
</div><div>

#### platform

By default, if a product uses a rule, the rule is considered to be applicable on it. But that's not always the case. We may require a package to be installed, a specific environment...

```yml!
platform: machine and package[ntp]
```

This rule is only applied if `./shared/applicability/machine.yml` and `./shared/applicability/package.yml` are true.

➡️ Refer to the [applicability](https://complianceascode.readthedocs.io/en/latest/manual/developer/06_contributing_with_content.html#applicability-by-cpe) section.
</div></div>

<hr class="sep-both">

## 👻 To-do 👻

Stuff that I found, but never read/used yet.

<div class="row row-cols-md-2"><div>

```yaml!
template:
    name: your_template_name
    vars:
        xxx: yyy
        xxx@zzz: yyy
```
</div><div>
</div></div>