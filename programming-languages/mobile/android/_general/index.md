# Android

<div class="row row-cols-md-2"><div>

Android is an operating system developed by Google. [Native android applications](../../_general/index.md) are developed in [Kotlin](/programming-languages/high-level/kotlin/index.md) mostly using [Android Studio](../tools/and/index.md).

* [Android Courses](https://developer.android.com/courses/) + [CodeLabs](https://codelabs.developers.google.com/?cat=Android) (official, free)
* [Android Docs](https://developer.android.com/docs)
* [Android Teach](https://developer.android.com/teach#lecture-slides-and-code-samples) (slides...)
* [Android Guides](https://developer.android.com/guide) and [Android UI](https://developer.android.com/develop/ui)
* [Material Design](https://mui.com/material-ui/) (Google UI Guidelines)

➡️ Google recommends using Kotlin over Java since 2019.
</div><div>

Android projects are managed by [Gradle](/tools-and-frameworks/others/build/gradle/index.md). It's used to:

* 🌍 manage dependencies <small>(import a library...)</small>
* ⚒️ compile the code
* 🗃️ generate the APK <small>(Android Package)</small> installed on devices
</div></div>

<hr class="sep-both">

## Android Framework

<div class="row row-cols-md-2"><div>

#### Activities and fragments

Android apps are made of **activities**. An activity typically corresponds to a specific task or user interaction such as displaying a login screen.

Activities can have one unique view or they can have multiple views through **fragments**. A fragment is a modular reusable UI component.

**Example** 🔥: an activity for a checkout process could swap between a shipping information and a payment method fragment. Otherwise, you could have one activity for shipping and one for payment.
</div><div>

#### View and ViewGroups

A **view** is a visual element such as a Button. They are grouped in containers called **ViewGroups** to apply styles on multiple views or create responsive screens <small>(i.g., adapting to the size of the screen)</small>.

#### AndroidManifest.xml

The Android Manifest define things like:

* 🏠 the first activity executed when starting the application
* 🔐 the permissions required by the application
* 🗃️ the activities, services, and other components...
* ...
</div></div>

<hr class="sep-both">

## Activities

<div class="row row-cols-md-2"><div>

Every activity is associated with **one** [view](../views/index.md). If this view uses a fragment view, then we can change the fragment displayed in it, effectively allowing us to display multiple views in one activity.

* 👉 Activities must be declared in AndroidManifest.xml
* 👉 The first screen is usually called "MainActivity"
* 👉 Activities are associated with a View <small>(ex: R.layout.activity_main)</small>

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
        // Load the associated View
        // See View to configure the view (listeners...)
        setContentView(R.layout.activity_main)
    }
}
```
</div></div>

<hr class="sep-both">

## 👻 To-do 👻

Stuff that I found, but never read/used yet.

<div class="row row-cols-md-2"><div>

* [_general](../__old/_knowledge/index.md)
* [_activities](../__old/activities/index.md)
* [_views](../__old/views/index.md)
* [_viewmodel](../__old/viewmodel/index.md)
* [_core](../__old/core/index.md)
* [_internet](../__old/internet/index.md)
</div><div>

* views and viewgroups (a visual element and containers)
* services (independent processes)
* intents (communication between components)
* content providers (manage app data, enable data sharing)
* context (app env info, access to resources)
* broadcast receivers (listen for events)
* AndroidManifest.xml (metadata, perms, components)
* src directory
* resources directory
</div></div>