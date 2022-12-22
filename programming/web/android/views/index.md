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

In Android, every composant such as an Image is called a **View**.
</div><div>

...
</div></div>

<hr class="sep-both">

## Layouts

<div class="row row-cols-md-2"><div>

There composants called **ViewGroup** to group views and apply changes/... on the group.

Layouts are ViewGroups with predefined settings. For instance, a **GridLayout** will put nested views in a grid-like format.

* [LinearLayout](https://developer.android.com/develop/ui/views/layout/linear): Horizontal/Vertical

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
</div><div>

* [FrameLayout](https://developer.android.com/reference/android/widget/FrameLayout): a layout with only one child.

```
<FrameLayout ...>
  <!-- usually a recycler view, or a fragment container -->
</FrameLayout>
```

* [ConstraintLayout](https://developer.android.com/develop/ui/views/layout/constraint-layout): a painful way to design views.

```
implementation 'androidx.constraintlayout:constraintlayout:2.1.4'
```

A constraint layout is rendering element relatively to another component <small>(which could be the screen)</small>. You will set margins which are the gap with the other component.

On a screen of 226px, if you define that the component should have a margin left of 140, and a margin right of 26. The composant will be centered within the 60 remaining px called **free space**.

To change the behavior of how the free space is handled, simply edit the layout width/height OR you can use a shortcut by clicking on arrows such as ">>" right where you added margins.

![Constraint Layout Margins Kind](_images/cl_margins_kind.png)
</div></div>

<hr class="sep-both">

## ✨ View Binding ✨

...

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

...
</div><div>


</div></div>