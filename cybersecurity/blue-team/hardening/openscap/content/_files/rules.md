# Rules

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

## Rule check

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