# Threads

<div class="row row-cols-lg-2"><div>

A thread is a sequence of instructions. Most Android applications run on **one single main thread** called **UI Thread**. This thread will:

* 🖼️ Render the View
* 🧑 Handle user interactions
* 🎉 Process events
* ...

It's responsible for Android Lifecycle, so it's the one executing methods such as `onCreate`, `onResume` and so on.
</div><div>

As this main thread is responsible for many things, we can't execute some code that takes too long, otherwise it will result in an **ANR = Android Not Responding** which basically means the app crashed.

So, when we need to run code that takes a long time, we either:

* **Thread** 🎪: we create a new thread for our task
* **Coroutine** 💎: we run the code in a coroutine
* **WorkManager** ⏳: we use the [work manager](/programming-languages/mobile/android/others/utils/work.md)
</div></div>

<hr class="sep-both">

## Asynchronous functions

<div class="row row-cols-lg-2"><div>

A synchronous function is a (normal) function that returns the result when the function call is done. For instance:

```kotlin
fun addNumbers(a: Int, b: Int): Int {
    return a + b
}
val result = addNumbers(5, 3)
```

But, it's not always possible. For instance, when requesting a resource from an API, it might take a few seconds for us to get a result.

There are two "solutions" that can be found:

* 🐪 using what we call "callbacks"
* 🐫 using asynchronous functions
</div><div>

#### suspend

Kotlin uses the keyword `suspend` to declare asynchronous functions.

```kotlin!
private suspend fun waitFiveSeconds() {
    // delay 5000 = wait 5s
    // delay is also a suspend fun
    delay(5000)
}
```

⚠️ You can only call a `suspend` function from another `suspend` function.
</div></div>

<hr class="sep-both">

## Coroutines 💎

<div class="row row-cols-lg-2"><div>

A coroutine can be used to run **suspend** functions.

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
</div><div>

#### Lifecycle-aware coroutines

[See Lifecycle-aware coroutines](https://developer.android.com/topic/libraries/architecture/coroutines)

Ex: automatically started/restarted when the application is STARTED.

```
lifecycleScope.launch {
    repeatOnLifecycle(Lifecycle.State.STARTED) {
        // ...
    }
}
```

#### Repeat a task every XXX seconds

See also the lifecycle-aware coroutines.

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

<div class="row row-cols-lg-2"><div>

* [Android coroutines](https://developer.android.com/courses/pathways/android-coroutines)
</div><div>
</div></div>