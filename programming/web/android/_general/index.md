# Android development

<div class="row row-cols-md-2"><div>

You can develop Android apps with many frameworks such as React Native or Electron which uses JavaScript/HTML. This course is about **Android development in Kotlin** while Java could also be used.

> Kotlin is recommended over Java by Google since 2019.

**References**

* [Android Courses](https://developer.android.com/courses/) + [CodeLabs](https://codelabs.developers.google.com/?cat=Android) (official, free)
* [Android Docs](https://developer.android.com/docs)
* [Android Teach](https://developer.android.com/teach) (see the slides at the bottom)
* [Android Guides](https://developer.android.com/guide) and [Android UI](https://developer.android.com/develop/ui)

</div><div>

Android Studio <small>(Google)</small> is the IDE you will use. It's based on IntelliJ Community <small>(JetBrains)</small> 😎❤️. It's quite complex with a lot of Windows.

* <kbd>CTRL+P</kbd>: in `method(<here>)`, show the arguments of a method
* <kbd>CTRL+SPACE</kbd>: manually trigger autocompletion (then use <kbd>TAB</kbd>)
* <kbd>SHIFT+SHIFT</kbd>: search for a method/class/...
* <kbd>ALT+ENTER</kbd>/**hover** something highlight in red, yellow, grey... to see quick fixes/details.

<details class="details-e">
<summary>Configuration in-editor documentation</summary>

To see the documentation of a method, use <kbd>CTRL+Q</kbd> or hover a method. By default, you won't see anything interesting.

* Navigate to the source of any Android class. As a remainder, you can use <kbd>CTRL+(MOUSE LEFT)</kbd>.
* Click on "Download sources"
* Done
</details>
</div></div>

<hr class="sep-both">

## 📱 Android Studio 📱

<div class="row row-cols-md-2"><div>

#### Gradle

In the Project tab, at the bottom, you got a section "Gradle Scripts". You will have to edit the second `build.gradle` (Module: XXX).

<div class="text-center">

![gradle](_images/gradle.png)
</div>

This is inside the `dependencies {}` that you will add new libraries. You need to click on "sync" each time you add a new dependency.
</div><div>

#### Device Emulator

The device emulator allow you to create a virtual device or connect yours. You may (or most likely will) use

<div class="row mx-0"><div class="col-9">

* **Device File Explorer**: device's file system
* **Layout Inspector**: running app layout
* **App inspection**: to see workers/tasks/...
* **Logcat**: to see logged messages

**Note**: you may have to refresh the virtual file system manually if you don't see recent changes.

**Note (2)**: on virtual devices, use "..." to manually change settings (location...).
</div><div class="col-3">

![device_manager](_images/device_manager.png)
</div></div>

</div></div>

<hr class="sep-both">

## ✏️Key elements  📝

<div class="row row-cols-md-2"><div>

##### app/manifests/AndroidManifest.xml

This is a file that describes

* What is the main activity <small>(~=screen)</small>?
* What activities <small>(~=screens)</small> you defined? 
* What are the permissions that your application needs?
* If your application defining services <small>(~=tasks)</small>?
* ...

##### app/java/com.xxx.yyy

This is where your classes will be store.
</div><div>

##### app/res

This is where the resources of your application will be stored.

* Drawables <small>(images, icons...)</small>
* Layouts <small>(the layout of each screen)</small>
* Menu
* Values <small>(translations, colors/themes...)</small>
* XML <small>(preferences...)</small>
</div></div>

<hr class="sep-both">

## 👻 To-do 👻

Stuff that I found, but never read/used yet.

<div class="row row-cols-md-2"><div>

* Android ProGuard
* Datastore
* File system
* Themes
* Android bottom navigation
* Services
* [Nested navigation graphs](https://developer.android.com/guide/navigation/navigation-nested-graphs)
* Room
* backups (see [autobackups](https://developer.android.com/guide/topics/data/autobackup))
* Modern Android Development (MAD)
* Android Tests + Advanced testing
* Deep Link
* Talkback
* Tint/Dark mode
* Advanced Data Binding, Recommanded App architecture

**Links**

* [Android compose](https://developer.android.com/courses/android-basics-compose/course)
* [Android Basics: Room](https://developer.android.com/courses/android-basics-kotlin/unit-5)
* [Android Basics: Adaptive Layouts](https://developer.android.com/codelabs/basic-android-kotlin-training-adaptive-layouts), [twopane](https://developer.android.com/develop/ui/views/layout/twopane), [cardview](https://developer.android.com/develop/ui/views/layout/cardview)
* [Android coroutines](https://developer.android.com/courses/pathways/android-coroutines)
* [Jetpack Compose](https://developer.android.com/courses/jetpack-compose/course)
* [Android architecture](https://developer.android.com/courses/pathways/android-architecture)
</div><div>

```kotlin
ViewModelProvider(this)[XXXViewModel::class.java]
recyclerView.apply {
    layoutManager = GridLayoutManager(requireContext(), 2)
}

val preferences: SharedPreferences = PreferenceManager.getDefaultSharedPreferences(this)
if (preferences.getBoolean("key", false)) {}

intent.addFlags(Intent.FLAG_ACTIVITY_CLEAR_TOP)
```

> See also: **[Old notes](_old.md)**
</div></div>