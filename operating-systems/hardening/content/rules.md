# Rules

[Go back](../index.md)

<div class="row row-cols-md-2"><div>

XXX

* `<rule_name>/rule.yml`
* [format](https://complianceascode.readthedocs.io/en/latest/manual/developer/06_contributing_with_content.html#rules)
* `<br />`
* `<tt>xxx</tt>`
* `<pre>xxx</pre>`

```yaml!
template:
    name: your_template_name
    vars:
        xxx: yyy
        xxx@zzz: yyy
```
</div><div>

**Warnings** ⚠️

* If you used a rule with a `prodtype`, and there isn't your `prodtype` inside, then the rule will be silently removed at build time

* If there is a problem with the documentation <small>(ex: `<br>` which is a missing auto-closing slash)</small>, build will fail at step 16 <small>(or ~7 sometimes)</small>.

...
</div></div>

<hr class="sep-both">

## 👻 To-do 👻

Stuff that I found, but never read/used yet.

<div class="row row-cols-md-2"><div>

By default, all rules that are loaded in a profile, are considered to be applicable on a product. But, if that's not the case, then each rule should specify the condition in the `platform:` attribute. [Documentation](https://complianceascode.readthedocs.io/en/latest/manual/developer/06_contributing_with_content.html#applicability-by-cpe).

* `/content/shared/applicability`
* New type, inventory
* `platform: your_check`
</div><div>


</div></div>