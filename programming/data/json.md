# JSON

<div class="row row-cols-md-2"><div>

JSON is a simple yet very useful way of storing data. It's a plain-text file with some structured data inside.

You got 6 types in JSON: **number** (integer/float), **object**, **array**, **boolean**, **null**, and **string**.

* **Object** ✨. An object is wrapped inside `{}`. It's a structure with **keys** that are associated with a **value**.

```json
{
  "key": 1,
  "key2": "string",
  "key3": false,
  "key4": { "key1": "string" },
  "key5": [],
  "key6": null
}
```
</div><div>

* **Array** 🤓: simply an array of values

```json
[
    42,
    "string", 
    true,
    null,
    { "key1": "value" },
    []
]
```

* **Example** 🎁: a list <small>(array)</small> of users <small>(objects)</small>

```json
[
    { "username": "toto", "password": "toto" },
    { "username": "tata", "password": "tata" },
    { "username": "titi", "password": "titi" }
]
```
</div></div>

<hr class="sep-both">

## Extensions

<div class="row row-cols-md-2"><div>

#### JSON5

Some are not satisfied with the limited syntax of JSON. Here some limitations

* ✏️ You can't use comments (`// comment`) in JSON
* 🎡  There are no multilines strings, so it's not easy to read/write long strings in JSON. A good editor would have a feature to wrap the JSON, to avoid very long lines
* ...

So, they created [JSON5](https://json5.org/). It's not quite used widely.
</div><div>

...
</div></div>