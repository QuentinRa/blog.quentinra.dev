# Android Core

This section is about the core classes/features/... that you might want to use.

<hr class="sep-both">

## 🍾 Toasts 🍾

<div class="row row-cols-md-2"><div>

A toast is an ephemeral popup-like message, usually shown at the bottom of the screen. It's mostly used to show an error message, or some feedback <small>(ex: connection lost)</small>.

<div class="text-center">

![Android Toast](_images/toast.png)
</div>
</div><div>

```kotlin
// short
Toast.makeText(this, "Some message", Toast.LENGTH_SHORT).show()
// long
Toast.makeText(this, "Some message", Toast.LENGTH_LONG).show()
```
</div></div>

<hr class="sep-both">

## 🎆 Notifications 🎆

<div class="row row-cols-md-2"><div>

First, add the permission in AndroidManifest.xml

```xml
<uses-permission android:name="android.permission.POST_NOTIFICATIONS" />
```

Then, since Android O, you need to create a **channel**. Developers should group their notifications by channels. For the user, they can do operations like disabling a notification channel.

* [Create a Channel](https://developer.android.com/develop/ui/views/notifications/channels#CreateChannel)
* I pasted the code in `XXX#onCreate` <small>(XXX extends Application)</small>

See also.

* [Create multi-lines notifications, or add images/...](https://developer.android.com/develop/ui/views/notifications/expanded)
* [Do something if the user click on the notification](https://developer.android.com/develop/ui/views/notifications/navigation)
</div><div>

You also have to provide an icon, a title, a message, and [a priority](https://developer.android.com/reference/androidx/core/app/NotificationCompat.Builder#setPriority(int)).

```kotlin
// priority is ignored on Android O (Channel importance is used instead)
val builder = NotificationCompat.Builder(applicationContext, channel_id)
    .setSmallIcon(R.drawable.some_icon)
    .setContentTitle("title")
    .setContentText("body")
    .setPriority(NotificationCompat.PRIORITY_DEFAULT)
    
with(NotificationManagerCompat.from(context)) {
    // the "notificationId" is used to edit/close/...
    // this notification later. Use any value >0.
    notify(notificationId, builder.build())
}
```
</div></div>

<hr class="sep-both">

## 🪜 WorkManager 🪜

<div class="row row-cols-md-2"><div>

A WorkManager is used to run **long**, **periodic**, or **battery intensive tasks**. Unlike previous APIs, you are guaranteed that you job will be executed, even if the app is closed, or the phone restart.

```gradle
implementation "androidx.work:work-runtime-ktx:2.7.1"
```

#### Access the WorkManager

```kotlin
val workManager = WorkManager.getInstance(this)
// or, use static methods
WorkManager.someStaticMethod()
```

#### Create a worker

```kotlin
class XXXWorker(c: Context, args: WorkerParameters) : Worker(c, args) {
    // use 'applicationContext' to get back the context
    override fun doWork(): Result {
        // use Result.failure()/Result.retry() on error
        return Result.success()
    }
}
```

To create an async worker, you can use a [CoroutineWorker](https://developer.android.com/guide/background/persistent/threading/coroutineworker).

```kotlin
class XXXWorker(c: Context, args: WorkerParameters) : CoroutineWorker(c, args) {
    override suspend fun doWork(): Result {
        delay(5000) // example of async call
        return Result.success()
    }
}
```

</div><div>

#### Create a WorkRequest

If you want a job to only be performed once, you can use a **OneTimeWorkRequest**.

```kotlin
val request = OneTimeWorkRequest.from(XXXWorker::class.java)
// using the builder
val request = OneTimeWorkRequestBuilder<XXXWorker>().build()
```

#### Run a WorkRequest

A work manager is taking a **WorKRequest** and run it.

```
// process a request
workManager.enqueue(request)
// chain requests
workManager.beginWith(request)
    .then(request).then(request)/*...*/.build()
```

#### Additional notes

<p></p>

<details class="details-e">
<summary>Add constraints on the WorkRequest</summary>

Here is an example of every constraint you can use

```kotlin
// here examples of every constraint you can use
val constraints = Constraints.Builder()
    .setRequiresCharging(true)
    .setRequiresBatteryNotLow(true)
    .setRequiresStorageNotLow(true)
    .setRequiresDeviceIdle(true)
    .setRequiredNetworkType(NetworkType.CONNECTED)
    .build()
```

Then, you can use `setConstraints` to pass contraints. For instance, for a **OneTimeWorkRequest**, you will have

```diff
val request = OneTimeWorkRequestBuilder<XXXWorker>()
+    .setConstraints(constraints)
    .build()
```
</details>

<details class="details-e">
<summary>Add a tag to a work request</summary>

This can be used to find work requests by tag.

```diff
val request = OneTimeWorkRequestBuilder<XXXWorker>()
+    .addTag(TAG)
    .build()
```

</details>

<details class="details-e">
<summary>Observe a worker</summary>

```kotlin
private val _work : LiveData<List<WorkInfo>>

_work = workManager.getWorkInfosForUniqueWorkLiveData(ID)
_work = workManager.getWorkInfoByIdLiveData(uuid)
_work = workManager.getWorkInfosByTagLiveData(tag)
```

The LiveData contains a list of WorkInfo, one per worker.

To make thing easier, we use Transformations, and work will only be non-null when the first task (`it[0]`) in completed.

```kotlin
// only one job, no need for a list to be public
val work: LiveData<WorkInfo>

// NOTE: this must be called after
// _work = ...
// as _work must have been initialized
work = Transformations.map(_work) {
    // not yet
    if (it.isNullOrEmpty()) {
        return@map null
    }
    // ensure that the job if finished
    return@map if (it[0].state.isFinished) it[0] else null
}
```

Then, do as usual

```kotlin
viewModel.work.observe(viewLifecycleOwner) {
    // do something when the job has finished.
    // If you passed data, you can use it.outputData
}
```
</details>

<details class="details-e">
<summary>Cancel work</summary>

```kotlin
workManager.cancelAllWork()
workManager.cancelUniqueWork(ID)
workManager.cancelWorkById(uuid)
workManager.cancelAllWorkByTag(TAG)
```

</details>
</div></div>