# Data definition languages

A gathering of notes about easy to learn, and easy to master, data definition languages, such as JSON (and JSON5), or YAML.

<hr class="sl">

## JSON

You got 6 types in JSON: **number** (integer/float), **objects**, **arrays**, **booleans**, **null**, and **strings**.

* **Object** ✨: `{}`, take key and a value for each key

```json
{
  "key": 1
  "key2": "an object"
  "key3": false
  "key4": {}
  "key5": { "key1": "another object" }
  "key6": []
}
```

* **Array** 🤓: simply an array of values

```json
[
  1, 2, "an array", true, false, null, { "key1": "another object" }, []
]
```