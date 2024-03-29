# Android

<div class="row row-cols-lg-2"><div>

Android is an operating system developed by Google. [Native android applications](../../_general/index.md) are developed in [Kotlin](/programming-languages/high-level/oo/kotlin/index.md) mostly using [Android Studio](../tools/and/index.md).

* [Android Courses](https://developer.android.com/courses/) + [CodeLabs](https://codelabs.developers.google.com/?cat=Android) (official, free)
* [Android Docs](https://developer.android.com/docs)
* [Android Guides](https://developer.android.com/guide)
* [Android Teach](https://developer.android.com/teach#lecture-slides-and-code-samples) <small>(slides...)</small>
* [Android UI](https://developer.android.com/develop/ui) and [Material Design](https://mui.com/material-ui/) <small>(Google UI Guidelines)</small>
* [Android Compose](https://developer.android.com/courses/android-basics-compose/course) and [Jetpack Compose](https://developer.android.com/courses/jetpack-compose/course) <small>(New Way To Build UI)</small>

➡️ Google recommends using Kotlin over Java since 2019.
</div><div>

Android projects are managed by [Gradle](/tools-and-frameworks/others/build/gradle/index.md). It's used to:

* 🌍 manage dependencies <small>(import a library...)</small>
* ⚒️ compile the code
* 🗃️ generate the APK <small>(Android Package)</small> installed on devices

You will have to edit the second `build.gradle (Module: XXX)`.

<div class="text-center">

![gradle](_images/gradle.png)
</div>
</div></div>

<hr class="sep-both">

## Android Framework

<div class="row row-cols-lg-2"><div>

#### Application

An Android application corresponds to an instance of the **Application** class. The default implementation is usually enough.

#### Activities and fragments

Applications are made of **activities**. An activity is most of the time a screen of an application <small>(ex: the login screen)</small>.

In practice, an activity typically corresponds to a specific task or user interaction <small>(ex: we may group the register and login screen in one activity)</small>.

Activities are associated with **one** "screen". When we choose to display multiple screens during one activity, we can use fragments.

A **fragment** is a modular reusable UI component <small>("screens", menubar...)</small>.

👉 You can create apps without any fragments. Using fragments is a choice based on stuff like data handling, code reuse, modularity...

➡️ See also: Single Activity Pattern.
</div><div>

#### Activity/Fragment lifecycle

Both activities and fragments have a lifecycle which we need to be familiar with in order to know where we will write our code.

For instance, code to handle an event, such as a click on a button, would be in `onCreate()` <small>(activity)</small> or `onViewCreated()` <small>(fragment)</small>.

#### View and ViewGroups

A **view** is a visual element such as a Button. They are grouped in containers called **ViewGroups** to apply styles on multiple views or create responsive screens <small>(i.g., adapting to the size of the screen)</small>.

#### AndroidManifest.xml

The Android Manifest defines things like:

* 🏠 the first activity executed when starting the application
* 🔐 the permissions required by the application
* 🗃️ the activities, services, and other components...
* ...
</div></div>

<hr class="sep-both">

## Model View ViewModel (MVVM)

<div class="row row-cols-lg-2"><div>

**Model View ViewModel**, or MVVM for short, is a popular architectural design pattern in which

* 📦 The **model** is the classes used to store Data
  * `data class XXX(...)`
  * They are usually stored in `.data`
  * Classes interacting with the API/Room/the FileSystem...

<br>

* 🖼️ The **view** is what is displayed to the user
  * Most XML displayed <small>(res/layout, res/menu...)</small>
  * They are usually stored in `.ui.viewname`
</div><div>

* 💍 The **ViewModel** (ViewModel + LiveData)
  * They are usually stored in `.ui.viewname` with their View
  * See also: DataBinding

The "main" component is the ViewModel. This is a component that will link the View with the model. When the model is updated, it will update the View. When the View is updated, it will update the model.

<br>

* ➕ Controllers (Activities, Fragments)

There are still controllers like in MVC. They are responsible for rendering the view, and listening to events.
</div></div>

<hr class="sep-both">

## Android Application

<div class="row row-cols-lg-2"><div>

When an Android application is started, it instantiates the `Application` class which loads the main activity. 

👉 The default implementation is enough most of the time.

#### Use case: run code only once

Code loaded in an Activity will be run when we navigate between activities, when we rotate the screen... The only way to run code once is inside `Application#onCreate`.

Ex: the code to create notification channels <small>(see notifications)</small>.

#### Use case: Listen for application-level changes

<p></p>

<details class="details-n">
<summary>Ex: app foreground/background</summary>

```diff
-class MainApplication : Application() {
+class MainApplication : Application(), DefaultLifecycleObserver {

    override fun onCreate() {
        super<Application>.onCreate()
+        ProcessLifecycleOwner.get().lifecycle.addObserver(this)
    }

+    override fun onStart(owner: LifecycleOwner) {
+        // App in the foreground
+    }

+    override fun onStop(owner: LifecycleOwner) {
+        //App in the background
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

In your AndroidManifest.xml, look for the tag "application", and add an attribute "android:name" pointing to your newly created file.

```
<application
        ...
        android:name=".MainApplication"
        />
```
</div></div>

<hr class="sep-both">

## Activities

<div class="row row-cols-lg-2"><div>

Activities are screens of an application, while in fact, one activity can serve multiple screens using fragments according to the app design.

* 👉 Activities must be declared in AndroidManifest.xml
* 👉 The first screen is usually called "MainActivity"
* 👉 An activity is associated with **one** [layout](../views/index.md) <small>(ex: R.layout.activity_main)</small>

A short version to declare an activity:

```kotlin
class MainActivity : AppCompatActivity(R.layout.activity_main) {
}
```
</div><div>

The extended and most commonly used version is:

```kotlin
import androidx.appcompat.app.AppCompatActivity
import android.os.Bundle

class MainActivity : AppCompatActivity() {
    override fun onCreate(savedInstanceState: Bundle?) {
        super.onCreate(savedInstanceState)
        // Load the associated layout
        setContentView(R.layout.activity_main)
    }
}
```
</div></div>

<hr class="sep-both">

## Activity lifecycle

<div class="row row-cols-lg-2"><div class="align-self-center">

Android activities' lifecycle is a bit complex. To summarize,

* 👉 **onCreate** is where you will configure the view
* 👉 Before presenting the activity, **onStart** is called. If the user press "home"/the activity isn't visible anymore, **onStop** is called.
* 👉 Before the user can interact with the activity, **onResume** is called. If the user isn't able to interact with the activity anymore, **onPause** is called. The activity is still visible.

As for **onDestroy**, it is called

* when the user closes the app
* when the system terminates the app <small>(to free up memory...)</small>
* when it's easier to kill and recreate the app
    * 🔤 the language changed
    * ⚠️ the rotation changed <small>(don't forget to enable rotation on the phone, especially on emulated devices, as it's disabled by default)</small>

➡️ When needed, you can override these methods.
</div><div>

![android_application_lifecycle](_images/android_application_lifecycle.png)

**Note**: **onPause** must be lightweight, otherwise it will delay the other application from showing up in the front screen <small>(ex: a call)</small>.

**Note** (2): A bundle is a **small, in-memory**, dictionary. It's passed to onCreate, if the app was recreated. See [onRestoreInstanceState](https://developer.android.com/reference/android/app/Activity#onRestoreInstanceState(android.os.Bundle)) and [onSaveInstanceState](https://developer.android.com/reference/android/app/Activity#onSaveInstanceState(android.os.Bundle)) too, if you want to use it to store/load data.
</div></div>

<hr class="sep-both">

## Fragments

<div class="row row-cols-lg-2"><div>

Fragments are in many ways similar to activities. They are loaded by an activity, but they have their own lifecycle.

* 👉 `Activity#onCreated` was split into 3 methods
* 👉 New methods and attributes are present to access some attributes/methods that were available in an activity
  * Use `requireActivity()` to get the parent Activity
  * Use `activity` to get the parent Activity <small>(@Nullable)</small>
  * ...

#### Create a fragment

* File > New > fragment > [select a template]

<details class="details-n">
<summary>BlankFragment template</summary>

```kotlin
class BlankFragment : Fragment() {

    override fun onCreateView(
        inflater: LayoutInflater, container: ViewGroup?,
        savedInstanceState: Bundle?
    ): View? {
        // Load the associated View
        return inflater.inflate(R.layout.fragment_blank, container, false)
    }

    override fun onViewCreated(view: View, savedInstanceState: Bundle?) {
        super.onViewCreated(view, savedInstanceState)
        // See View to configure the view (listeners...)
        // use "view.xxx()" instead of "xxx()"
        // ex: view.findViewById<XXX>(...)
    }
}
```
</details>

#### Load a fragment in an activity

➡️ See also: [Navigation Component](../nav/index.md#-navigation-component--).
</div><div>

The Fragment lifecycle is as follows.

![Fragment lifecycle](_images/android_fragment_lifecycle.png)
</div></div>

<hr class="sep-both">

## 🐛 Debugging 🐛

<div class="row row-cols-lg-2"><div>

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

If the level of logging is **debug**, then all below are included, meaning that only verbose logs won't be shown/logged.

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

## 👻 To-do 👻

Stuff that I found, but never read/used yet.

<div class="row row-cols-lg-2"><div>

* Android ProGuard
* [Modern Android Development (MAD)](https://developer.android.com/courses/pathways/android-architecture)
* [/e/OS](https://doc.e.foundation/devices)
* [LineageOS](https://lineageos.org/)
* Android Tests + Advanced testing
* Recommended App architecture

```kotlin
// Activity.title: set the title shown in task list
//  and inside the default menubar
title = "Some title"
```
</div><div>

Topics

* services (independent processes)
* content providers (manage app data, enable data sharing),contentResolver, `_deviceId = Settings.Secure.getString(contentResolver, Settings.Secure.ANDROID_ID)`
* context (app env info, access to resources)
* broadcast receivers (listen for events)
* AndroidManifest.xml (metadata, perms, components)
* src/resources directory

Features

* NFC
* Talkback
* leanback/touchscreen
</div></div>