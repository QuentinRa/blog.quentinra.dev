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

**TIP**: you should rely on CTRL+F to search for attributes, or by clicking on the search icon at the top of the "Attributes" window.

<details class="details-e">
<summary>Notables attributes</summary><br>

<table class="table table-bordered table-striped border-dark">
<thead>
<tr><th>View</th><th>Useful attributes</th></tr>
</thead>
<tbody>

<tr><td><b>View</b><br><i>extends View</i></td><td>

</td></tr>

<tr><td><b>TextView</b><br><i>extends View</i></td><td>

* `text`
*  (settings) `text`: this text is only shown when editing. <small>It's useful when a text should be empty by default, but you want to see what it will look like once filed.</small>
</td></tr>

<tr><td><b>ImageView</b><br><i>extends View</i></td><td>

* `scaleType`: use "centerCrop" to scale without distorting (9patches)
* `srcCompat`: set image
</td></tr>

<tr><td><b>Button</b><br><i>extends TextView</i></td><td>

</td></tr>
</tbody></table>
</details>

<hr class="sl">

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