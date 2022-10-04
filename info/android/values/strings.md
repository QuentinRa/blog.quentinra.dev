# strings.xml

[Go back](../index.md#resources)

<div class="row row-cols-md-2 mx-0"><div>

This file is used to store every text of the application. Usually programmers write text directly in the attribute `text`, but that's a bad practice generating a warning "Hardcoded Text". The file in question looks like this

```xml
<resources>
    <string name="app_name">Name of your app</string>
</resources>
```

Each row is made of

* a **name**, commonly referred as a key
* a **text**, which is actually the "default translation"

<hr>

In the code you can use that get the text for "app_name"

```kotlin
var appName = getString(R.string.app_name)
```
</div><div>

**Parameters**

You can add parameters/variables that will be later replace in the code. This is a string that will be evaluated with `String.format`, so you can basically do everything you could with functions such as `printf` in C.

```xml
<resources>
    <string name="price">Price: %s</string>
</resources>
```

<hr>

In the code you can use that get the text for "price"

```kotlin
var myText = getString(R.string.price, "$3")
```
</div></div>

<hr class="sl">

## Localization

<div class="row row-cols-md-2 mx-0"><div>

**Edit translations**

* Open Resources Manager
* Go to "String"
* Click on Open Translations Editor

</div><div>

**Add another language**

1. Create a new "Android resources directory"
2. Click on "Locale" then ">>"
3. Select a locale, and optionally a region
4. Switch to project view
5. Copy, and paste "strings.xml" inside the new folder
6. Switch back to android view
</div></div>

<hr class="sr">

## Currency

<div class="row row-cols-md-2 mx-0"><div>

Given an amount (int), you can generate a string for a currency with

```kotlin
val amount = NumberFormat.getCurrencyInstance().format(1300.74)
```
</div><div>

* `$1,300.74` (USA, CA...)
* `£1,300.74` (UK)
* `1 300,74€` (FR)
* ...
</div></div>
