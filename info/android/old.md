## Good practices

<div class="row row-cols-md-2 mt-4"><div>

<details class="details-e">
<summary>No HardCoded Text</summary>

If you create a TextField, or something having some text shown to the user, then it's a good practice to put the text inside a file "strings.txt". You can click on the "warning", then expand "Hardcoded text", and click on fix.
</details>
</div><div>
</div></div>

<hr class="sl">

## Resources Manager

Every folder in `res` may have multiples "copies" for different devices/languages. For instance, if there is a view for large screen devices, it will be used instead of the view made of "every" device.

<details class="details-e">
<summary>Localization</summary>

Locales are made of a

* a key
* a translation

```xml
<string name="some_key">Hello World!</string>
```

Every "strings.xml" shares the sames keys, but different translations. In the code, or in the view, you will only use the "key", and the appropriate value will be shown according to the user language.
</details>

<details class="details-e">
<summary>Localization: add another language</summary>

* Create a new "Android resources directory"
* Click on "Locale" then ">>"
* Select a locale, and optionally a region
* Switch to project view
* Copy, and paste "strings.xml" inside the new folder
* Switch back to android view
* Go in "String" inside the Resources manager
* Click on Open Translations Editor

You can edit locales here!
</details>

<details class="details-e">
<summary>Localization: variables in strings</summary>

If your string has variables, more commonly refered as **parameters**, you can use `%index$` in your text

```xml
<string name="some_key">Hello %1$</string>
```

And, later in the code

```kotlin
getResources().getString(R.string.myStringID, value_for_index1, ...)
```
</details>

<hr class="sr">

## Activities

<details class="details-e">
<summary>Get/set a text from the code</summary>

You can get a text from the code using

```kotlin
var myString = getResources().getString(R.string.myStringID)
// for strings with parameters
var myString = getResources().getString(R.string.myStringID, param1, param2)
```

For some functions such as `#setText`, you can pass the ID

```kotlin
aTextView.text = myString
aTextView.setText(R.string.myStringID)
```
</details>
