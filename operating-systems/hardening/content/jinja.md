# jinja

[Go back](../index.md)

<div class="row row-cols-md-2"><div>

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
</div><div>

...
</div></div>