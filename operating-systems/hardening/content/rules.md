# Rules

<div class="row row-cols-md-2"><div>

XXX

* `<rule_name>/rule.yml`
* [format](https://complianceascode.readthedocs.io/en/latest/manual/developer/06_contributing_with_content.html#rules)
* `<br />`
* `<tt>xxx</tt>`
* `<pre>xxx</pre>`
</div><div>

**Warnings** ⚠️

* If you used a rule with a `prodtype`, and there isn't your `prodtype` inside, then the rule will be silently removed at build time

* If there is a problem with the documentation <small>(ex: `<br>` which is a missing auto-closing slash)</small>, build will fail at step 16 <small>(or ~7 sometimes)</small>.

...
</div></div>