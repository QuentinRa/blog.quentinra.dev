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

* [Android coroutines](https://developer.android.com/courses/pathways/android-coroutines)
</div><div>

```kotlin
view.context.getString(...)

activity?.contentResolver
_deviceId = Settings.Secure.getString(contentResolver, Settings.Secure.ANDROID_ID)
```
</div></div>