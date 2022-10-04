# Android development

There are multiple ways to develop apps for Android devices. This course will focus on Android apps written in **Kotlin**, using **Android Studio**. Kotlin which is recommended by Google since 2018, replacing Java which was mainly used until then. Switching from Kotlin to Java, and from Java to Kotlin is quite easy, Android Studio can even do the conversion for you.

> Android Studio (Google) is based on IntelliJ Community (JetBrains) 😎❤️

<hr class="sl">

## Activities

<div class="row row-cols-md-2 mx-0"><div>

Each screen of your application is an **Activity**. The "main" screen is usually called "Main Activity". Each activity is made of two files

* **MainActivity.kt** for the code handling the view
* **activity_main.xml** for the view

</div><div>

<details class="details-e">
<summary>Base code for an Activity</summary>

```kotlin
import androidx.appcompat.app.AppCompatActivity
import android.os.Bundle

class MainActivity : AppCompatActivity() {
    override fun onCreate(savedInstanceState: Bundle?) {
        super.onCreate(savedInstanceState)
        // set the view: activity_main.xml
        setContentView(R.layout.activity_main)
        // add your code here
    }
}
```
</details>
</div></div>

<hr class="sr">

## Views

<div class="row row-cols-md-2 mx-0"><div>

Everything displayed on the screen is a **View**. `View` doesn't mean that this is only a something displayed, it be also be something clickable/editable...

* Display a text: `TextView`
* Display an image: `ImageView`
* Display a button: `Button`
* Display a input field: `EditText`
* Display a radio button: `RadioButton` + `RadioGroup`
* Display a toggle button: `Switch`
</div><div>

The layout is handled by a **ViewGroup**. Layouts are edited using the layout editor. They are located in `.../res/layout/xxx.xml`.

* [ConstraintLayout](layouts/ConstraintLayout.md): arrange elements in a flexible way

</div></div>

<details class="details-e">
<summary>Useful Attributes/Methods for well-known Views</summary><br>

<table class="table table-bordered table-striped border-dark">
<thead>
<tr><th>View</th><th>Useful attributes</th><th>Useful Methods</th></tr>
</thead>
<tbody>

<tr><td><b>View</b><br><i>extends View</i></td><td>

</td><td></td></tr>

<tr><td><b>TextView</b><br><i>extends View</i></td><td>

* `text`
*  (settings) `text`: this text is only shown when editing. <small>It's useful when a text should be empty by default, but you want to see what it will look like once filed.</small>
</td><td>

* `setText(stringId)`: set text for id. You can also use the attribute `text`, but with a string.
</td></tr>

<tr><td><b>ImageView</b><br><i>extends View</i></td><td>

* `scaleType`: use "centerCrop" to scale without distorting (9patches)
* `srcCompat`: set image
</td><td>

* `setImageResource(drawable_id)`: set image in the code. <small>Don't forget to update `contentDescription`, or any accessibility-related attributes, if needed.</small>
</td></tr>

<tr><td><b>Button</b><br><i>extends TextView</i></td><td>

</td><td></td></tr>
</tbody></table>
</details>

<details class="details-e">
<summary>Accessibility</summary>

You have some attributes to increase accessibility

* `contentDescription`: what's the purpose of this element
* `importantForAccessibility`: if this element is just decorative, you can set it to no
</details>

<hr class="sl">

## Layout Editor

<div class="row row-cols-md-2 mx-0"><div class="align-self-center">

<ol style="list-style-type: lower-alpha">
<li><b>Mode</b>: you can switch to code/layout editor here</li>
<li><b>Palette</b>: a library of views that you can drag and drop to the design view</li>
<li><b>Design view</b>: what the user will see</li>
<li><b>BluePrint view</b>: everything is shown on it, included hidden elements</li>
<li><b>Component tree</b>: list of all views of your screen</li>
<li><b>Attributes</b>: edit the properties of a view</li>

</ol>
</div><div>

![Layout Editor](_images/layout_editor.png)
</div></div>

**TIP**: you should rely on <kbd>CTRL+F</kbd> to search for attributes, or by clicking on the search icon at the top of the "Attributes" window.

<hr class="sr">

## Resources

<div class="row row-cols-md-2 mx-0"><div>

Images, texts, views, basically everything that is not a Kotlin file, is a resource. They are all stored in the  **📂res** folder

* **drawables**: images
* **layouts**: views
* **mipmap**: icons
* **values**: colors+theme, and strings
* ...

<details class="details-e">
<summary>Resources Manager</summary>

You can access the Resources Manager, which track every resource in `res`, and allow you to add new ones

* from the Left side, right under "project")
* with View > Tools Windows > Resources Manager

![Resources Manager Android Studio](_images/resources_manager_as.png)
</details>

<details class="details-e">
<summary>Add a new "drawable" (image)</summary>

* Go to Drawables tab in the Resources Manager
* Click on "+"
* Import drawables

You can drag, and drop it in the design view (or select it when creating a new imageview).
</details>

Every folder in `res` may have multiples "copies" for different devices/languages. For instance, if there is a view for large screen devices, it will be used instead of the view made of "every" device.

* [strings.xml](values/strings.md): how to properly handle texts, and localization

</div><div>

**Access resources in the code**

<details class="details-e">
<summary>Access resource's (view...) Id in the code</summary>

Each resource may have an id. The main class `R` is managing every id trough subclasses such as `drawable`. If you want a drawable with the id `ic_launcher_foreground` do:

```kotlin
val drawableId : Int = R.drawable.myDrawable
val viewId : Int = R.id.hello_world
```
</details>

<details class="details-e">
<summary>findViewById</summary>

You can then use `findViewById(some_id)` to get a view.

```kotlin
val myButton: Button = findViewById(R.id.myButton)
```
</details>

<details class="details-e">
<summary>[new] view binding (alternative to findViewById)</summary>

You first need to add `viewBinding` in build.gradle, in the bloc "Android", and reload the project. It will create an object that reference all views with an id. 

```gradle
buildFeatures {
    viewBinding = true
}
```

Then, create an attribute `binding`, and you will be able to access every view from it.

<details class="details-e">
<summary>Android MainActivity base code with Binding</summary>

```kotlin
import androidx.appcompat.app.AppCompatActivity
import android.os.Bundle
import com.samples.google.cone.databinding.ActivityMainBinding

class MainActivity : AppCompatActivity() {
    lateinit var binding: ActivityMainBinding
    
    override fun onCreate(savedInstanceState: Bundle?) {
        super.onCreate(savedInstanceState)
        binding = ActivityMainBinding.inflate(layoutInflater)
        setContentView(binding.root)
    }
}
```
</details>
</details>

</div></div>

<hr class="sl">

## Useful stuff

<div class="row row-cols-md-2 mt-4"><div>

<details class="details-e">
<summary>Toasts (sort of non-aggressive popups)</summary>

A toast is something like this, usually at the bottom of the screen:

![Android Toast](_images/toast.png)

And, the code is as simple as that

```kotlin
// create
// LENGTH_SHORT (=short duration) LENGTH_LONG (=long duration)
val toast = Toast.makeText(this, "Some message", Toast.LENGTH_SHORT)
// show
toast.show()
```
</details>
</div><div>

<details class="details-e">
<summary>Listeners</summary>

As in Java, you have listeners which are called when an event is triggered (ex: `click on a button`).

Example for "OnClickListener", a listener added on a button, that is called when a user click the button.

```kotlin
val myButton: Button = findViewById(R.id.myButton)
myButton.setOnClickListener {
    println("Clicked on myButton")
}
```
</details>
</div></div>

<hr class="sr">

## Debugging

<div class="row row-cols-md-2 mt-4"><div>

In Android project, you should use the logger instead of the standard output (ex: println). Each logging function is taking a "tag" used to "sort" logs. Later, you can search for all logs having this tag, among the great amount of logs, so it's pretty useful.

```kotlin
// proper
private const val MAIN_ACTIVITY_TAG = "MainActivity"
Log.v(MAIN_ACTIVITY_TAG, "message")
// improper
Log.v("tag", "message")
```
</div><div>

There are 5 levels of logs. You can view your logs in the tab "logat", in which you can also change the Log settings, or create filtering rules for your tags.

* `Log.v`: verbose
* `Log.d`: debug
* `Log.i`: info
* `Log.w`: warn
* `Log.e`: error
</div></div>

<hr class="sr">

## References

* [Android Basics in Kotlin](https://developer.android.com/courses/android-basics-kotlin/course)