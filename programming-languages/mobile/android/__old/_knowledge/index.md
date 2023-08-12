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

## Navigate/open another activity

<div class="row row-cols-md-2"><div>

An [**intent**](https://developer.android.com/guide/components/intents-filters) is an object representing some action to be performed, such as navigating to another activity. There are two kinds of intent


* **Explicit**: ask specifically for something <small>(ex: start the Activity XXX)</small>
* **Implicit**: request another application/the system <small>(ex: open link)</small>

```kotlin
// create an intent
val intent = Intent(SOME_PARAMETERS)
// optional, you can pass parameters
intent.putExtra("param", "a value")
// start
startActivity(intent)
```

If you passed parameters, in the new Activity, use

```kotlin
val param = intent?.extras?.getString("param")
```
</div><div>

#### Explicit intent

Ex: to navigate to "MainActivity"

```kotlin
// this = a context
val intent = Intent(this, MainActivity::class.java)
```

#### Implicit intent

[There are a lot of them here](https://developer.android.com/reference/android/content/Intent).

<details class="details-e">
<summary>Open a link/mail/phone</summary>

Open a URL (`https:`), a mail (`mailto:`), or a telephone (`tel:`). For instance, given a URL, it will try to open it in a browser...

```kotlin
val intent = Intent(Intent.ACTION_VIEW, Uri.parse("???"))
```
</details>

<details class="details-e">
<summary>Share something</summary>

```kotlin
val intent = ShareCompat.IntentBuilder.from(this)
        .setText("...")
        .setType("text/plain")
        .intent
```
</details>

<details class="details-e">
<summary>Send an email</summary>

```kotlin
val intent = Intent(Intent.ACTION_SEND)
    .setType("text/plain")
    .putExtra(Intent.EXTRA_SUBJECT, "xxx")
    .putExtra(Intent.EXTRA_TEXT, "yyy")
    .putExtra(Intent.EXTRA_EMAIL, "a@b.c")
```
</details>

<details class="details-e">
<summary>⚠️ How to properly run an implicit intent ⚠️</summary>

What if you try to open a link in a browser, but the user uninstalled every browser? It will fail. You have to handle errors!

* Option 1: check if the startActivity fails

```kotlin
try {
    startActivity(intent)
} catch (ex: ActivityNotFoundException) {
    // use a toast / ...
}
```

* Option 2: check before starting the intent

```kotlin
if (packageManager.resolveActivity(intent, 0) != null) {
    startActivity(intent)
}
```
</details>
</div></div>

<hr class="sep-both">

## Application back stack

<div class="row row-cols-md-2"><div>

Android activities are pilled up in something called the "back stack". In older devices, users can use the "back arrow" to go back to a previous activity. The current intent is popped out, and the previous activity is started again. If there are none, then the app is terminated.

![img.png](_images/android_back_stack.png)
</div><div>

It's always the activity at the top that is shown to the user.

At the end of the example, we got two instances of "MainActivity". It's important to consider if this behavior is acceptable or not. If not, you should pass flags to your Intent using [Intent#addFlags](https://developer.android.com/reference/android/content/Intent.html#flags).

👉 For instance, if the user logs out, he should not be able to press "back", and go back to the "connected area".

* Manual "back" <small>(pop out current)</small>

```javascript
intent.addFlags(Intent.FLAG_ACTIVITY_CLEAR_TOP)
```
</div></div>

<hr class="sep-both">

## Fragments

<div class="row row-cols-md-2"><div>

* 👉 The navigation is done with a [Navigation Component](../views/index.md#-navigation-component-)

```diff
- val param = intent?.extras?.getString("param")
+ val param = requireActivity().intent?.extras?.getString("param")
+ val param = activity?.intent?.extras?.getString("param")
```

* Use `requireContext()` to get a Context
* Use `context` to get a Context <small>(@Nullable)</small>

```diff
- val intent = Intent(this, MainActivity::class.java)
+ val intent = Intent(requireContext(), MainActivity::class.java)
+ val intent = Intent(context!!, MainActivity::class.java)
```
</div><div>

* Use `viewLifecycleOwner` to get a LifecycleOwner

```diff
- myLiveData.observe(this) {}
+ myLiveData.observe(viewLifecycleOwner) {}
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