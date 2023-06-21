# OVAL checks

[Go back](../index.md)

<div class="row row-cols-md-2"><div>

There are many [existing templates](https://complianceascode.readthedocs.io/en/latest/templates/template_reference.html) which you can use in your rules. They are located in `shared/templates`, see each `oval.template` file.

You will also write a check only for one rule. In some rule folder, create a file `shared.xml` giving us: `<rule_folder>/oval/shared.xml`.

🔥 There are some differences if the check is a template or not.
</div><div>

```xml
<def-group>
  {{{ oval_metadata("XXX") }}}
  <definition class="compliance" id="{{{ _RULE_ID }}}" version="3">
      <criteria>
          <!-- ... -->
      </criteria>
  </definition>
</def-group>
```
</div></div>