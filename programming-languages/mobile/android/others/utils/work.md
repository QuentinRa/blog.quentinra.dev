# 🪜 WorkManager 🪜

<div class="row row-cols-lg-2"><div>

A WorkManager is used to run **long**, **periodic**, or **battery intensive tasks**. Unlike previous APIs, you are guaranteed that your job will be executed, even if the app is closed, or the phone restarted.

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

See also **PeriodicWorkRequest** below.

#### Run a WorkRequest

A work manager is taking a **WorKRequest** and running it.

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
val constraints = Constraints.Builder()
    .setRequiresCharging(true)
    .setRequiresBatteryNotLow(true)
    .setRequiresStorageNotLow(true)
    .setRequiresDeviceIdle(true)
    .setRequiredNetworkType(NetworkType.CONNECTED)
    .build()
```

Then, you can use `setConstraints` to pass constraints. For instance, for a **OneTimeWorkRequest**, you will have

```diff
val request = OneTimeWorkRequestBuilder<XXXWorker>()
+    .setConstraints(constraints)
    .build()
```
</details>

<details class="details-e">
<summary>Add a tag to a work request</summary>

This can be used to find work requests by tag.

```kotlin
// ✅ good practice (in a companion object...)
private const val TAG = "SOME_TAG"
```

```diff
val request = OneTimeWorkRequestBuilder<XXXWorker>()
+    .addTag(TAG)
    .build()
```

</details>

<details class="details-e">
<summary>Pass data to a worker, between workers, or return a result</summary>

The data passed is a dictionary.

```kotlin
// ✅ good practice (in a companion object...)
private const val KEY = "key"
private const val KEY2 = "key2"
// ➡️ Using Data.Builder
val someData = Data.Builder()
    .putString(KEY, "value")
    .putInt(KEY2, 5000)
    .build()
// ➡️ Using workDataOf
val someData = workDataOf(KEY to "value", KEY2 to 5000)
```

To pass data to the first task, use

```diff
val request = OneTimeWorkRequestBuilder<XXXWorker>()
+    .setInputData(someData)
    .build()
```

Inside a worker, to get data, use

```kotlin
inputData.getString(key)
...
```

To pass data to the following task if any, or to any observer

```kotlin
Result.success(someData)
```

</details>

<details class="details-e">
<summary>Observe a worker</summary>

```kotlin
private val _work : LiveData<List<WorkInfo>>

_work = workManager.getWorkInfosForUniqueWorkLiveData(WID)
_work = workManager.getWorkInfoByIdLiveData(uuid)
_work = workManager.getWorkInfosByTagLiveData(TAG)
```

The LiveData contains a list of WorkInfo, one per worker.

To make things easier, we use Transformations, and work will only be non-null when the first task (`it[0]`) is completed.

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
    // If you have passed data, you can use it.outputData
}
```
</details>

<details class="details-e">
<summary>Cancel work</summary>

```kotlin
workManager.cancelAllWork()
workManager.cancelUniqueWork(WID)
workManager.cancelWorkById(uuid)
workManager.cancelAllWorkByTag(TAG)
```

</details>

<details class="details-e">
<summary>Unique WorkRequests</summary>

If you want to ensure there is **up to one** WorkRequest running at a time, you can use **unique work chains**.

```kotlin
// ✅ good practice (in a companion object...)
private const val WID = "SOME_ID"
```

```diff
// process a request
-workManager.enqueue(request)
+workManager.enqueueUniqueWork(WID, policy, request)
// chain requests
-workManager.beginWith(request)
+workManager.beginUniqueWork(WID, policy, request)
    .then(request).then(request)/*...*/.build()
```

The policy is one of these

* **ExistingWorkPolicy.REPLACE**: cancel previous job then start
* **ExistingWorkPolicy.KEEP**: only start if there is no pending job
* **ExistingWorkPolicy.APPEND**: process after the previous unique work chain is finished
</details>

<details class="details-e">
<summary>PeriodicWorkRequest</summary>

You can use **PeriodicWorkRequest** for requests that should be executed every X minutes, X being greater than 15.

```kotlin
// every 15 hours
val request = PeriodicWorkRequestBuilder<XXXWorker>(15, TimeUnit.HOURS) .build()
// and you need to use
workManager.enqueueUniquePeriodicWork(WID, ExistingPeriodicWorkPolicy.REPLACE, request)
```
</details>
</div></div>