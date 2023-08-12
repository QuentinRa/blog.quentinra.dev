# 🔤 Localization 🔤

<div class="row row-cols-md-2 mt-3"><div>

Android automatically detects the language of the operating system and loads the appropriate language if available, otherwise fallback to the default language.

The default language is defined inside **res/values/strings.xml**.

#### Add a new language

* Open the Resource Manager
* Click on "String"
* Click on "+" and "New resource file"
  * Give the FileName "strings"
  * Select "Locale" in "Available qualifiers"
  * Click on ">>"
  * Select the language you want. You may select a region too.
* This will open an empty file
* Copy-paste inside the default language file.

Now, you can set translations for the new locale.

To add translations, you should use the **Translations Editor** <small>(see the "open edit" at the top of any language file)</small>.

<br>

#### Edit strings.xml

This is a dictionary: a **key** is associated with a **value**.

```xml
<string name="key">value</string>
```

Inside another XML, you can reference a string with `@string`

```xml
<TextView
    android:text="@string/key" />
```

Or, in the code

```kotlin
var value = getString(R.string.key)
// same (from resources)
var value = resources.getString(R.string.key)
// same (from a view)
var value = view.context.getString(R.string.key)
```
</div><div>

#### Parameters

Android use **String.format** to parse the value, so you can pass parameters, as you would to printf in C.

```xml
<string name="price">The price is %s</string>
```

Inside the code

```kotlin
var value = getString(R.string.price, "$3")
```

#### Plurals

You can provide variants according to the number of elements.

```xml
<plurals name="count">
    <item quantity="zero">0</item>
    <item quantity="one">1</item>
    <item quantity="two">2</item>
    <item quantity="few">few</item>
    <item quantity="many">many</item>
    <item quantity="other">unknown</item>
</plurals>
```

Then, you need to pass a quantity. ⚠️ **NOTE** that the quantity is used along the locale to determine which "item" will be used. For instance, in English, only **one**, and **other** will be used.

```kotlin
resources.getQuantityString(R.plurals.count, 0)
```

#### Utilities

##### Currency

You can return the appropriate currency from an int/a double with

```kotlin
val amount = NumberFormat.getCurrencyInstance().format(1300.74)
// USA/CA: "$1,300.74"
// UK: "£1,300.74"
// FR: "1 300,74€"
```

##### Dates

See [SimpleDateFormat](https://developer.android.com/reference/java/text/SimpleDateFormat#date-and-time-patterns).

```kotlin
// ex: "ss" = show seconds on two digits
val formatter = SimpleDateFormat("ss", Locale.getDefault())
val calendar = Calendar.getInstance()
val xxx = formatter.format(calendar.time)
```
</div></div>

<hr class="sep-both">

## 🧸 Other notes about resources 🧸

<div class="row row-cols-md-2 mt-3"><div>

#### Arrays

Arrays are lists of hard-coded values such as a list of countries. Go to Resources Manager > Arrays, and create a new one.

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

In the code

```kotlin
// ✨ .toList() is optional, you can use arrays "as if"
val stringArray = resources.getStringArray(R.array.str_array).toList()
val intArray = resources.getIntArray(R.array.int_array).toList()
```
</div><div>

#### Dimensions

Every folder in `res` may have multiples "copies" for different devices. For instance, if there is a view for large-screen devices, it will be used instead of the view made of "every" device.

It's also a better practice to avoid hard-coded padding/margins/..., and instead, add them inside a `dimens.xml`, then use `@dimens/key`.

<br>

#### Resources Annotations

Add `@StringRes`, `@DrawableRes`, or `@LayoutRes` before a variable, a parameter, or an attribute.

```kotlin
fun loadIcon(@DrawableRes drawableId: Int) {
    val drawable = AppCompatResources.getDrawable(this, drawableId)
}
```
</div></div>