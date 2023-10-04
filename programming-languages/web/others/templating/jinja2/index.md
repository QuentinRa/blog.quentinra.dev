# Jinja2

<div class="row row-cols-md-2"><div>

[Jinja](https://jinja.palletsprojects.com/en/) is a template engine. We will use Jinja syntax in static files such as [HTML](/programming-languages/web/html/index.md) or [XML](/programming-languages/others/data/xml.md) files. We then use Jinja to process our templates and generate the resulting file.

<br>

#### Print a variable

You can use `{{ a_variable }}` almost anywhere to echo a variable:

```xml!
<some_tag>{{ xxx }}</some_tag>
<some_tag xxx="{{ xxx }}">...</some_tag>
```
</div><div>

#### Variables

You can declare variables using `set`:

```text!
{%- set xxx = "Hello, " + "World!" -%}
```

You can apply transformations on a variable using `|`:

```text!
{{ xxx|upper }}
```
</div></div>


<hr class="sep-both">

## Branching

<div class="row row-cols-md-2"><div>

You can use `if/elif/else/endif`. Common conditions are

* `xxx`: true if a variable `xxx` exists, or is `true`
* `"xxx" in variable`: true if `variable` contains `xxx`
* `"xxx" not in variable`: false if `variable` contains `xxx`
* `variable in ["xxx", "yyy"]`: true if product in array

Another example: `{% if variable %}xxx {% endif %}` which optionally show `xxx` based on a variable.
</div><div>

```text!
{% if "xxx" in variable %}
        Hello, from XXX.
{% elif "yyy" not in variable %}
        Hello, not from YYY.
{% else %}
        Hello.
{% endif %}
```
</div></div>