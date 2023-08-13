# ️🚀 Threads and Coroutines ☄️

<div class="row row-cols-md-2 mt-3"><div>

Most android applications run on one "main" thread usually called **UI Thread**, which is the one handling rendering the view, processing events, and so on.

To avoid blocking the Main thread for too long, resulting in an **ANR = Android Not Responding = Crash**.

You can use a [Thread](https://developer.android.com/reference/java/lang/Thread) to a run a background task

```kotlin
Thread {
    // the code here will be run
    // in another thread
}.start()
```

[Coroutines](https://developer.android.com/kotlin/coroutines) are doing a job, that can be halted/resumed. They will run inside a thread, and one thread will be used to run multiple coroutines.

A coroutine can be used to run **suspend** (async) functions.

```
// suspend fun = async
private suspend fun waitFiveSeconds() {
    // delay 5000 = wait 5s
    // delay is also a suspend fun
    delay(5000)
}
```

#### Life-cycle aware coroutines

[See Life-cycle aware coroutines](https://developer.android.com/topic/libraries/architecture/coroutines)

Ex: automatically started/restarted when the application is STARTED.

```
lifecycleScope.launch {
    repeatOnLifecycle(Lifecycle.State.STARTED) {
        // ...
    }
}
```

</div><div>

Each coroutine is created from a scope. 

* **GlobalScope**: as long as the app is running
* **CoroutineScope**: custom scope
* **lifecycleScope**: inside an Activity/Fragment
* **viewModelScope**: only available inside a ViewModel

And, on each, you can run one of these functions

* **launch {}**: simply run a coroutine
* **runBlocking {}**: block the running thread
* **async {}**: generate a Deferred that we can "await"

You can add a scope, for instance, **launch(SCOPE) {}**.

* **Dispatchers.Main**: use the Main Thread
* **Dispatchers.IO**: use the IO thread
* **Dispatchers.Default**: default for intensive tasks
* **Dispatchers.Unconfined**

<details class="details-e">
<summary>Ex: Inside a ViewModel</summary>

```kotlin
class XXXViewModel : ViewModel() {
    init {
        viewModelScope.launch {
            waitFiveSeconds()
        }
    }
}
```
</details>

<details class="details-e">
<summary>Ex: Inside an Activity/Fragment</summary>

```kotlin
class MainActivity : AppCompatActivity() {
    override fun onCreate(savedInstanceState: Bundle?) {
        lifecycleScope.launch {
            waitFiveSeconds()
        }
    }
}
```
</details>

<details class="details-e">
<summary>Ex: Using CoroutineScope</summary>

```kotlin
CoroutineScope(Job()).launch {
    // ...
}
```
</details>

#### Repeat a task every XXX seconds

See also life-cycle aware coroutines.

```kotlin
while (true) {
    // your task here
    // wait, and loop again in 60 seconds
    delay(60000)
}
```

</div></div>

<hr class="sep-both">

## Random notes about activities

<div class="row row-cols-md-2"><div>

* Set the Activity's title from the code. The title is shown is the task list, and in the default menu bar.

```kotlin
class MainActivity : AppCompatActivity() {
    override fun onCreate(savedInstanceState: Bundle?) {
        ...
        title = "Some title"
    }
}
```
</div><div>

...
</div></div>

<hr class="sep-both">

## 👻 To-do 👻

Stuff that I found, but never read/used yet.

<div class="row row-cols-md-2"><div>

Links

* [Android compose](https://developer.android.com/courses/android-basics-compose/course)
* [Android coroutines](https://developer.android.com/courses/pathways/android-coroutines)
* [Jetpack Compose](https://developer.android.com/courses/jetpack-compose/course)
* [Android architecture](https://developer.android.com/courses/pathways/android-architecture)
* [KTX](https://developer.android.com/kotlin/ktx)
</div><div>

Random

A [flow](https://developer.android.com/kotlin/flow) is canceled when the app goes to the background/rotating the screen (see [here a patch](https://developer.android.com/topic/libraries/architecture/coroutines#lifecycle-aware)). We could also patch that by giving a timeout to "asLiveData", but by doing that, the flow will continue to be run while the app is in the background, until the timeout that is.

```kotlin
// implementation "androidx.lifecycle:lifecycle-livedata-ktx:2.5.1"
val myLiveData : LiveData<Int> = flow {
    while (true) {
        val data : Int = 0 /* fetch from the api some data */
        emit(data) // send
        delay(60000) // wait 60 seconds
    }
}.asLiveData()
```

```kotlin
val preferences: SharedPreferences = PreferenceManager.getDefaultSharedPreferences(this)
if (preferences.getBoolean("key", false)) {}
```

```gradle
implementation 'androidx.leanback:leanback:1.0.0'
```

```gradle
@Serializable
@SerialName("id")

val xxx =  registerForActivityResult(ActivityResultContracts.StartActivityForResult()) { result ->
    val yyy = result.data?.getSerializableExtra("yyy") as YYY
}
xxx.launch(intent)
```

```kotlin
public val tasksStateFlow = MutableStateFlow<List<Task>>(emptyList())
```

```kotlin
binding.recyclerView.itemAnimator = null
binding.recyclerView.scrollToPosition(0)

view.context.getString(...)

activity?.contentResolver
_deviceId = Settings.Secure.getString(contentResolver, Settings.Secure.ANDROID_ID)

val input = EditText(requireContext())

.setView(input)

input.text.toString().toFloatOrNull()
```
</div></div>

<hr class="sep-both">

## 📦 Resources 📦

<div class="row row-cols-md-2"><div>

Resources includes **strings** (texts), **colors**, **dimensions**, **drawables** (images), **mipmap** (icons), and many other things.

You can manage them from the **Resources Manager**

* From the Left side, right under "project"
* with View > Tools Windows > Resources Manager

![Resources Manager Android Studio](_images/resources_manager_as.png)
</div><div>

##### Add a local image

Go to drawables, and click on "+" > Import.

<br>

##### Add an icon

Go to drawables, and click on "+" > Vector Asset. Then, click on the <i class="bi bi-android"></i> <small>(android icon)</small> next to "clip art".

On Android 20, or older, you need to add this in build.gradle > Android > defaultConfig: `vectorDrawables.useSupportLibrary = true`.
</div></div>

<hr class="sep-both">

## 🔤 Localization 🔤

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