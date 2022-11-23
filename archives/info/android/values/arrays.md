# Arrays

[Go back](../index.md#resources)

<div class="row row-cols-md-2"><div>

Arrays resource file may be used if you have a list of strings, for instance countries names, or a list of integers. Much like strings, they can be localized, although you should refer to [strings.xml](strings.md) for that.

* In your resource manager, use the "...", and open "arrays"
* click on "+", and create a new file for your arrays (ex: `arrays.xml`)

Then, inside the newly create file, simply add a tag `string-array`, or a tag `integer-array`, with some tags `item` inside. Actually, you can more than one array per file.

In the code, you can use these to get back your list of values

```kotlin
// .toList() is optional, you may use arrays "as if"
val stringArray = resources.getStringArray(R.array.str_array).toList()
val intArray = resources.getIntArray(R.array.int_array).toList()
```
</div><div>

```xml
<?xml version="1.0" encoding="utf-8"?>
<resources>
    <string-array name="str_array">
        <item>Toto</item>
    </string-array>
    <integer-array name="int_array">
        <item>5</item>
    </integer-array>
</resources>
```
</div></div>