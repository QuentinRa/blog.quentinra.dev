# Android Views

<div class="row row-cols-md-2"><div>

Android Views are **XML files** stored in **app/res/layout**.

```
<?xml version="1.0" encoding="utf-8"?>
<FrameLayout xmlns:android="http://schemas.android.com/apk/res/android"
             xmlns:app="http://schemas.android.com/apk/res-auto"
             xmlns:tools="http://schemas.android.com/tools"
             android:layout_width="match_parent"
             android:layout_height="match_parent"
             tools:context=".MainActivity" >
  <!-- YOUR VIEW HERE -->
</FrameLayout>
```
</div><div>

If you copy-pasted a XML, or tried to edit it manually, you must know

* 👉 FrameLayout <small>(or the parent of every other)</small> is called the **root**.
* 👉 **xmlns:** are very important. You can't use **android:** if you didn't add the matching **xmlns:android**. They are added to the **root**.
* 👉 **tools:context** point to the associated Fragment/Activity in YOUR code, so you must give it an appropriate value.

Aside from that, almost every file is a XML file. This is a sort of HTML with tags **<MyTag></MyTag>**, or **<MyTag />**, in which you can add attributes  **<ImageView src="/path/to/my/image" />**.
</div></div>

<hr class="sep-both">

## 📦 Resources 📦

<div class="row row-cols-md-2"><div>

Resources englobes **strings** (texts), **colors**, **dimensions**, **drawables** (images), **mipmap** (icons), and many other things.

You can manage them from the **Resources Manager**

* From the Left side, right under "project"
* with View > Tools Windows > Resources Manager

![Resources Manager Android Studio](_images/resources_manager_as.png)
</div><div>

##### Add a local image

Go to drawables, and click on "+" > Import.

<br>

##### Add an icon

Go to drawables, and click on "+" > Vector Asset. Then, click on the <i class="bi bi-android"></i> <small>(android icon)</small> next to "clip art".

On Android 20, or older, you need to add this in build.gradle > Android > defaultConfig: `vectorDrawables.useSupportLibrary = true`.
</div></div>

<hr class="sep-both">

## Layout Editor

Instead of editing the XML manually, you will usually use the Design mode.

<div class="row row-cols-md-2 mx-0"><div class="align-self-center">

<ol style="list-style-type: lower-alpha">
<li><b>Mode</b>: you can switch to the XML/Layout editor here</li>
<li><b>Palette</b>: views that you can drag and drop to the design view</li>
<li><b>Design view</b>: what the user will see</li>
<li><b>BluePrint view</b>: Design View, but with hidden elements too</li>
<li><b>Component tree</b>: list of all views of your screen</li>
<li><b>Attributes</b>: edit the properties of a view</li>

</ol>
</div><div>

![Layout Editor](_images/layout_editor.png)
</div></div>

**TIP**: you should rely on <kbd>CTRL+F</kbd> to search for attributes, or by clicking on the search icon at the top of the "Attributes" window.

**TIP**: you will most likely have a time when you want to replace a view with another view. In the component tree, right-click on a view, and use "convert view". You could also manually get the job done by directly editing the `.xml`.

<hr class="sep-both">

## Views

<div class="row row-cols-md-2"><div>

In Android, every composant such as an Image is called a **View**. Every view must have at least these two attributes

* **android:layout_width**: wrap, match_parent, a fixed width
* **android:layout_height**: wrap, match_parent, a fixed height

And these attributes are available on any View

* **android:padding**: internal gap <small>(ex: 10dp)</small>
* **android:layout_margin**: external gap <small>(ex: 10dp)</small>
* **android:visibility**: View.VISIBLE / View.INVISIBLE / View.GONE

##### TextView: display a text

[TextView extends View](https://developer.android.com/reference/android/widget/TextView).

```xml
<TextView
    android:text="Shown in the app"
    tools:text="Shown in the DesignView"
    />
```

##### Button: a button

[Button extends TextView](https://developer.android.com/reference/android/widget/Button).
</div><div>

##### ImageView: display an image

[ImageView extends View](https://developer.android.com/reference/android/widget/ImageView)

```
<!-- scaleType="centerCrop" is used for 9patches scaling -->
<ImageView 
    tools:srcCompat="YOUR_IMAGE"
    android:scaleType="centerCrop"
    />
```

##### EditText: an input field

[EditText extends TextView](https://developer.android.com/reference/android/widget/EditText). See also [InputType](https://developer.android.com/develop/ui/views/touch-and-input/keyboard-input/style) and [Autofill](https://developer.android.com/guide/topics/text/autofill-optimize).

```
<EditText
    android:inputType="text"
    android:autofillHints="username"
    android:hint="Placeholder in the app"
    tools:hint="Placeholder in the DesignView"
    />
```

##### Switch: check or uncheck

[Switch extends Button](https://developer.android.com/reference/android/widget/Switch) <small>(indirectly)</small> and [SwitchCompat](https://developer.android.com/reference/androidx/appcompat/widget/SwitchCompat).

```
<Switch android:checked="true" />
<!-- ✅ better -->
<androidx.appcompat.widget.SwitchCompat
    android:checked="true" />
```
</div></div>

<hr class="sep-both">

## Layouts

<div class="row row-cols-md-2"><div>

There composants called **ViewGroup** to group views and apply changes/... on the group.

Layouts are ViewGroups with predefined settings. For instance, a **GridLayout** will put nested views in a grid-like format.

#### LinearLayout: Horizontal/Vertical

[Documentation](https://developer.android.com/develop/ui/views/layout/linear)

```
<LinearLayout
    ...
    android:orientation="vertical"
    android:orientation="horizontal"
    >
      <!-- optional weight (responsive width/height) -->
      <XXXView
           android:layout_weight="1"
           />
</LinearLayout>
```

#### FrameLayout: a layout with only one child.

[Documentation](https://developer.android.com/reference/android/widget/FrameLayout)

```
<FrameLayout ...>
  <!-- usually a recycler view, or a fragment container -->
</FrameLayout>
```
</div><div>

#### ConstraintLayout: a flexible way to design views

[Documentation](https://developer.android.com/develop/ui/views/layout/constraint-layout)
```
implementation 'androidx.constraintlayout:constraintlayout:2.1.4'
```

A constraint layout is rendering element relatively to another component <small>(which could be the screen)</small>. You will set margins which are the gap with the other component.

![Constraint Layout Margins Relative](_images/cl_margins_relative.png)

On a screen of 226px, if you define that the component should have a margin left of 140, and a margin right of 26. The composant will be centered within the 60 remaining px called **free space**.

To change the behavior of how the free space is handled, simply edit the layout width/height OR you can use a shortcut by clicking on arrows such as ">>" right where you added margins.

![Constraint Layout Margins Kind](_images/cl_margins_kind.png)
</div></div>

<hr class="sep-both">

## 🔗 Get access to a view from the code 🖇️

<div class="row row-cols-md-2"><div>

You can then use `findViewById(some_id)` to get a view.

```diff
<SomeViewHere
+        android:id="@+id/someUniqIdHere"
```

```kotlin
// ➡️ In Activity#onCreate
// ➡️ In Fragment#onViewCreated
val x = findViewById<SomeViewHere>(R.id.someUniqIdHere)
```

#### TextView

```kotlin
var t = findViewById<TextView>(...)
t.text = "Some text"
t.setText(R.string.some_string)
```

#### Button

```kotlin
val b = findViewById<Button>(...)
b.setOnClickListener {
    println("Clicked on myButton")
}
```
</div><div>

#### ImageView

```kotlin
var i = findViewById<ImageView>(...)
// set image from the code
i.setImageResource(R.drawable.some_drawable_here)
```

#### EditText

```kotlin
val e = findViewById<EditText>(...)
// handle key events
e.setOnKeyListener { v, keyCode, keyEvent ->
    if (keyCode == KeyEvent.KEYCODE_A) {
        return@setOnKeyListener true
    }
    return@setOnKeyListener false
}
```

#### Switch/SwitchCompact

```kotlin
var s = findViewById<SwitchCompact>(...)
if(s.isChecked) {}
```
</div></div>


<hr class="sep-both">

## ✨ View Binding ✨

<div class="row row-cols-md-2"><div>

ViewBinding is a new alternative to `findViewById`.

Ids declared in **activity_main.xml** will be available via a generated class called **ActivityMainBinding** <small>(matching the XML filename)</small>.

First, add the viewBinding build feature.

```diff
android {
    ...

+    buildFeatures {
+        viewBinding = true
+    }
}
```

</div><div>

Assume that we have a XML with file with

```xml
<SomeViewHere
    android:id="@+id/someUniqIdHere"
    ...
/>
```

This is how you could adapt your previous code with `findViewById`.

<details class="details-e">
<summary>Ex: activity_main.xml in an Activity</summary>

```diff
class MainActivity : AppCompatActivity() {
+    private lateinit var binding: ActivityMainBinding

    override fun onCreate(savedInstanceState: Bundle?) {
        super.onCreate(savedInstanceState)
+        binding = ActivityMainBinding.inflate(layoutInflater)

-        setContentView(R.layout.activity_main)
+        setContentView(binding.root)

-        val x = findViewById<SomeViewHere>(R.id.someUniqIdHere)
+        val x = binding.someUniqIdHere
    }
}
```
</details>

<details class="details-e">
<summary>Ex: fragment_blank.xml in a Fragment</summary>

```diff
class BlankFragment : Fragment() {
+    private lateinit var binding: FragmentBlankBinding

    override fun onCreateView(...): View? {
-        return inflater.inflate(R.layout.fragment_blank, container, false)
+        binding = FragmentBlankBinding.inflate(layoutInflater, container, false)
+        return binding.root
    }

    override fun onViewCreated(view: View, savedInstanceState: Bundle?) {
        super.onViewCreated(view, savedInstanceState)
+        val x = binding.someUniqIdHere
    }
}
```
</details>
</div></div>

<hr class="sep-both">

## ⚡ Data Binding ⚡

...

<hr class="sep-both">

## 🧭 Navigation Component 🧭 

...

<hr class="sep-both">

## 👻 To-do 👻

Stuff that I found, but never read/used yet.

<div class="row row-cols-md-2"><div>

* [RadioButton](https://developer.android.com/reference/android/widget/RadioButton), and [RadioGroup](https://developer.android.com/reference/android/widget/RadioGroup)
  * RadioGroup#`checkedButton`
  * RadioGroup#`setOnCheckedChangeListener`: parameters are radio group, and the Id of the checked button.
</div><div>


</div></div>