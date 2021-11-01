# Data definition languages

A gathering of notes about easy to learn, and easy to master, data definition languages, such as JSON (and JSON5), or YAML.

<hr class="sl">

## JSON

You got 6 types in JSON: **number** (integer/float), **object**, **array**, **boolean**, **null**, and **string**.

* **Object** ✨: `{}`, take a key and a value for each key

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

> **JSON5** is usually what most people use, but you may try [JSON5](https://json5.org/) at your own "risks" 😎🚀.<br>
> **Note**: There are no comments in JSON, but you can use comments in **JSON5**<br>
> **Note**: There is no multiline string, so you must bear with it, unless you are using **JSON5**.

<hr class="sr">

## YAML

YAML is way more complex than JSON. In fact, JSON syntax is included in YAML. YAML is quite human-readable 🚀, so in some cases, it may be better to use YAML rather than JSON.

* **List**

```yaml
- a
- b
- c

# same as
[a, b, c]
['a', 'b', 'c']
```

* **Keys**

```yaml
key1: value
key2: 5
key3: {}
key4: true
key5: ['a', 'b', 'c']
key6:
  - a
  - b
  - c
```

* **Long texts**

```yaml
short: This is a short text
long_text: This is a really really really
  long long text. 
  And this is still part of the text 🚀.
```

> You got way more things you can do, this is only a short preview 😱.

<hr class="sl">

## INI

INI is a language that was previously only used on Windows for initialization/**configuration files**. This is a plain text file with **key -> value**. You can add sections if you want.

```ini
; a comment
key=value

[section1]
key2=value
key3=value

[section2]
key2=value
```

> You may use `_`, spaces, uppercase letters in the names. At least, if your parser is allowing them.