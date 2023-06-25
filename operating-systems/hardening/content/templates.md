# OVAL templates

[Go back](../index.md)

<div class="row row-cols-md-2"><div>

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