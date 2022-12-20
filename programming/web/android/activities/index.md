# Android Activities

<div class="row row-cols-md-2"><div>

From a user perspective, an activity is a view of your application.

* 👉 Activities must be declared in AndroidManifest.xml
* 👉 The first screen is usually called "MainActivity"
* 👉 Activities are associated with a [View](../views/index.md) <small>(ex: R.layout.activity_main)</small>

Using **Fragments**, a developer can use multiple views in one activity. Fragments are reusable views that can be loaded from any Activity.

```kotlin
class MainActivity : AppCompatActivity(R.layout.activity_main) {
}
```

</div><div>

Extended (and usual) version

```kotlin
import androidx.appcompat.app.AppCompatActivity
import android.os.Bundle

class MainActivity : AppCompatActivity() {
    override fun onCreate(savedInstanceState: Bundle?) {
        super.onCreate(savedInstanceState)
        // Associate the View
        setContentView(R.layout.activity_main)
    }
}
```
</div></div>

<hr class="sep-both">

## Android Application

<div class="row row-cols-md-2"><div>

When an Android application is started, the class `Application` is started, and load the main activity.

The implementation by default is enough, so you won't need to write this class. But here are some use case

* 👉 running code only once in `onCreate` <small>(in an Activity, the code will be run when we navigate between application, when we rotate the screen...)</small>

For instance, to run the code to create notification channels, if you want to send notifications.

* 👉 listening for changes on the Application level 

<details class="details-e">
<summary>Ex: app foreground/background</summary>

```diff
-class MainApplication : Application() {
+class MainApplication : Application(), DefaultLifecycleObserver {

    override fun onCreate() {
        super<Application>.onCreate()
+        ProcessLifecycleOwner.get().lifecycle.addObserver(this)
    }

+    override fun onStart(owner: LifecycleOwner) {
+        // App in foreground
+    }

+    override fun onStop(owner: LifecycleOwner) {
+        //App in background
+    }
}
```
</details>

</div><div>

```kotlin
class MainApplication : Application() {
    override fun onCreate() {
        super.onCreate()
    }
}
```

In you AndroidManifest.xml, look for the tag "application", and add an attribute "android:name" pointing to your newly create file.

```
<application
        ...
        android:name=".MainApplication"
        />
```
</div></div>

<hr class="sep-both">

## Application life-cycle

<div class="row row-cols-md-2 mt-4"><div>

![android_application_lifecycle](_images/android_application_lifecycle.png)

> Activities are started by the Application, which is the class that the user may implement, for instance, if there is a need to run code when the application starts/stop.

> The Android/Activity **back-stack** refer to the fact that each new activity in you application is put on top of a stack. The activity at the top is the one displayed. If you press "back", then you will pop this activity from the stack, and move to the new head of the stack. If the stack is empty, then you go back to the home.
</div><div>

Android life-cycle is a bit complex. When starting an app, you go from Initialized, to Created, then Started, then Resumed.

If the app is partially visible <small>(ex: click on share/...)</small>, then you go back to "Started".

If you press the home button, your app will go back to Created, until you start it again.

If Android need resources, then your app may be destroyed. If there are a lot of changes <small>(ex: language changed, rotation...)</small>, then android will most likely destroy, and re-create the app.

You can use `onCreate(Bundle?)`, `onRestoreInstanceState(Bundle)`, to load saved data, and `onSaveInstanceState(Bundle)` to save data. A "bundle" is a **small, in-memory** dictionary, in which you can save a bit of data, that will be reloaded when the app is created, or started again.

Code in `onPause()` must be lightweight, because it will delay the other application that is showing up in the front screen.

> **Note**: it should be highlighted, that rotating your devices will destroy, and create again your activity. In Android Studio, don't forget to enable device rotation to try it out.
</div></div>

<hr class="sep-both">

## 👻 To-do 👻

Stuff that I found, but never read/used yet.

<div class="row row-cols-md-2"><div>

...
</div><div>


</div></div>