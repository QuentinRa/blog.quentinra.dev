# ComplianceAsCode/content

<div class="row row-cols-md-2"><div>
</div><div>

A test is written in [OVAL](https://ovalproject.github.io/getting-started/tutorial/), which is XML-based. Some tests are referred to as templates, if they were designed to be reused in multiple rules, but with different arguments passed to them.

In most files: `rule.yml`, `some_oval.xml`... You can use [jinja](https://complianceascode.readthedocs.io/en/latest/jinja_macros/01-general.html) <small>([official doc](https://jinja.palletsprojects.com/en/3.0.x/))</small> macros to inject some code within a file <small>(ex: branching, loops, args...)</small>.

* [Loading rules in a profile](_files/profiles.md)
* [Adding new rules](_files/rules.md)
* [Adding/Editing templates](_files/templates.md)
* [Building a product](_files/compilation.md)

Here are some notes about [OVAL](_files/oval.md), which is used in `templates`, `checks`, and `applicability` files. Here are some notes about [jinja](_files/jinja.md) too.

</div></div>