# Android development

<hr class="sep-both">

## 🐛 Debugging 🐛 

<div class="row row-cols-md-2 mt-4"><div>

Use the Logger instead of print/println to keep track of what your application is doing (=logs).

You must give a tag to your log. You will be able to filter messages by tag in the Logcat tab.

```kotlin
// ❌ improper, but faster
Log.v("SOME_TAG_NAME", "message")
```

There are 5 levels of logs. You can increase/decrease the level of logs inside Logcat or by editing the log settings.

* `Log.v`: verbose
* `Log.d`: debug
* `Log.i`: info
* `Log.w`: warn
* `Log.e`: error

If the level of log is **debug**, then all below are included, meaning that only verbose logs won't be shown/logged.

</div><div>

```kotlin
// ✅ proper logging
class XXX : YYY() {
    companion object {
        private const val TAG = "SOME_TAG_NAME"
    }
    
    fun xxx() {
        Log.v(TAG, "verbose message")
    }
}
```

OR, with the TAG outside, and not inside a companion object

```kotlin
// ✅ proper logging
private const val TAG = "SOME_TAG_NAME"

class XXX : YYY() {    
    ...
}
```

</div></div>

<hr class="sep-both">

## ️🚀 Threads and Coroutines ☄️

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

## 👻 To-do 👻

Stuff that I found, but never read/used yet.

<div class="row row-cols-md-2"><div>

* Action on Save: Optimize imports
* Android ProGuard
* Datastore
* File system
* Android bottom navigation
* Services
* [Nested navigation graphs](https://developer.android.com/guide/navigation/navigation-nested-graphs)
* Room
* backups (see [autobackups](https://developer.android.com/guide/topics/data/autobackup))
* Modern Android Development (MAD)
* Android Tests + Advanced testing
* Advanced Data Binding, Recommended App architecture
* NFC
* Deep Link
* Talkback
* Tint/Dark mode

<details class="details-e">
<summary>Theming?</summary>

[Theming](https://material.io/design/introduction#theming) and [Colors](https://material.io/design/material-theming/implementing-your-theme.html#color) and [ColorTools](https://m2.material.io/resources/color/#!/?view.left=0&view.right=0&primary.color=00E5FF). [Dark Theme](https://developer.android.com/codelabs/basic-android-kotlin-training-change-app-theme)

```
style="?attr/materialButtonOutlinedStyle"
android:textAppearance="?attr/textAppearanceHeadline6"
name="Theme.XXX"

<item name="textInputStyle">@style/Widget.MaterialComponents.TextInputLayout.OutlinedBox</item>
<item name="radioButtonStyle">@style/Widget.TipTime.CompoundButton.RadioButton</item>
<item name="switchStyle">@style/Widget.TipTime.CompoundButton.Switch</item>
```

By convention, each style should have a parent, and be named as the parent, while replacing the "MaterialComponents" with "YOUR_APP_NAME".

```xml
<examples>
  <style name="Widget.YOUR_APP_NAME.TextView" parent="Widget.MaterialComponents.TextView">
  </style>
  <style name="Widget.xxx.CompoundButton.RadioButton" parent="Widget.MaterialComponents.CompoundButton.RadioButton">
    <item name="android:paddingStart">8dp</item>
    <item name="android:textAppearance">?attr/textAppearanceBody1</item>
  </style>
  <style name="Widget.xxx.CompoundButton.Switch" parent="Widget.MaterialComponents.CompoundButton.Switch">
    <item name="android:minHeight">48dp</item>
    <item name="android:gravity">center_vertical</item>
    <item name="android:textAppearance">?attr/textAppearanceBody1</item>
  </style>
  <style name="Widget.xxxx.TextView" parent="Widget.MaterialComponents.TextView">
    <item name="android:minHeight">48dp</item>
    <item name="android:gravity">center_vertical</item>
    <item name="android:textAppearance">?attr/textAppearanceBody1</item>
  </style>
</examples>
```
</details>

<details class="details-e">
<summary>Icons</summary>

Different manufacturers may show app icons in different shapes than
the circular icon shape: square shape, rounded square, or squircle (between a square and circle)...

<https://developer.android.com/training/multiscreen/screendensities#TaskProvideAltBmp>

Adaptive icons since v26
=> background
=> foreground
=> + new image asset
=> new assets should be moved to the same folder v26

<https://developer.android.com/codelabs/basic-android-kotlin-training-display-list-cards> (3 => easy way to import icon).
</details>

Links

* [Android compose](https://developer.android.com/courses/android-basics-compose/course)
* [Android Basics: Room](https://developer.android.com/courses/android-basics-kotlin/unit-5)
* [Android Basics: Adaptive Layouts](https://developer.android.com/codelabs/basic-android-kotlin-training-adaptive-layouts), [twopane](https://developer.android.com/develop/ui/views/layout/twopane), [cardview](https://developer.android.com/develop/ui/views/layout/cardview)
* [Android coroutines](https://developer.android.com/courses/pathways/android-coroutines)
* [Jetpack Compose](https://developer.android.com/courses/jetpack-compose/course)
* [Android architecture](https://developer.android.com/courses/pathways/android-architecture)
* [KTX](https://developer.android.com/kotlin/ktx)
* uses-feature leanback/touchscreen

```
android:textAlignment="textStart"
android:textAlignment="center"
android:textSize="16sp"
android:textStyle="bold"
Vertical alignment
android:gravity="center"
android:gravity="bottom"
???
LinearLayout => android:baselineAligned="false"
Tint black icon to white
android:tint="@color/white"
android:background="#B95EB17C"

TableLayout TableRow
```

External

* Internet
* Views
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