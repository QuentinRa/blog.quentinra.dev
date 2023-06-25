# jinja

[Go back](../index.md)

<div class="row row-cols-md-2"><div>

The [jinja](https://jinja.palletsprojects.com/en/3.0.x/templates/) documentation will most likely have more useful information. Note that unlike in `jinja` templates, we use one more level of accolades, so `{% %}` is now `{{% %}}` <small>(ansible-related reason)</small>.
</div><div>

#### Variables

You can declare variables using `set`:

```text!
{{%- set xxx = "Hello, " + "World!" -%}}
```

You can apply transformations on a variable using `|`:

```text!
{{{ xxx|upper }}}
```
</div></div>

<hr class="sep-both">

## Branching

<div class="row row-cols-md-2"><div>

You can use `if/elif/else/endif`. Common conditions are

* `"ubuntu" in product`: true if product contains `ubuntu`
* `"ubuntu" not in product`: false if product contains `ubuntu`
* `product in ["debian10", "debian11"]`: true if product in array

Another example: `{{% if negate %}}negate="true" {{% endif %}}` which optionally show an OVAL attribute based on a user-defined variable called `negate`.
</div><div>

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
</div></div>

<hr class="sep-both">

## Macros

<div class="row row-cols-md-2"><div>

OVAL Macros can be declared in `shared/macros/10-oval.jinja`, or directly inside any OVAL file.

```text!
{{%- macro some_name(arg, arg2=none) -%}}
    SOME_OVAL
{{%- endmacro -%}}
```

</div><div>

Assuming the macro is within scope <small>(in the general macro file or in the same file)</small>, you can call it with:

```text!
{{{ some_name(arg='xxx') }}}
```
</div></div>

<hr class="sep-both">

## 👻 To-do 👻

Stuff that I found, but never read/used yet.

<div class="row row-cols-md-2"><div>

* Test if a variable exists; arguments
</div><div>


</div></div>