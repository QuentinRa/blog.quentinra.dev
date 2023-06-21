# jinja

[Go back](../index.md)

<div class="row row-cols-md-2"><div>

The [jinja](https://jinja.palletsprojects.com/en/3.0.x/templates/) documentation will most likely have more useful information. Note that unlike in `jinja` templates, we use one more level of accolades, so `{% %}` is now `{{{% %}}` <small>(ansible-related reason)</small>.

<br>

#### Branching

You can use `if/elif/else/endif`. Common conditions are

* `"ubuntu" in product`: true if product contains `ubuntu`
* `product in ["debian10", "debian11"]`: true if product in array

```text!
description: |-
{{% if "ubuntu" in product %}}
        Hello, from Ubuntu.
{{% elif "debian11" not in product %}}
        Hello, not from Debian 11.
{{% else %}}
        Hello.
{{% endif %}}
```

Another example: `{{% if negate %}}negate="true" {{% endif %}}` which optionally show an OVAL attribute based on a user-defined variable called `negate`.
</div><div>

#### OVAL Macros

OVAL Macros can be declared in `shared/macros/10-oval.jinja`, or directly inside any OVAL file.

```text!
{{%- macro some_name(arg, arg2=none) -%}}
    SOME_OVAL
{{%- endmacro -%}}
```

Relatively to the scope of the macro, you can call it with:

```text!
{{{ some_name(arg='xxx') }}}
```
</div></div>