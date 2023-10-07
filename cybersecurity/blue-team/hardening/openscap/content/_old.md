# Profiles

<div class="row row-cols-md-2"><div>

#### Selections

Selections is a list of rules IDs that are tested when selecting this profile. However, **it's not always enough to add a rule here**, you may have to edit the rule `prodtype` attribute too.

👉 See the [Rules#prodtype](rules.md#prodtype) attribute.

☠️ If the `prodtype` attribute is present, you'll either get an error during build <small>(unselects all groups)</small>, or the rule may be silently removed.

<br>

#### Find rules

To find rules, you can look at other profiles or controls files, or you can use `find linux_os -name *ftp* -type d 2> /dev/null` <small>(ex: for ftp rules)</small>.
</div><div>
</div></div>

<hr class="sep-both">

## prodtype and platform

<div class="row row-cols-md-2"><div>
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