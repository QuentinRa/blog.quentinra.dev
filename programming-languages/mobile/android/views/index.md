# Views

<div class="row row-cols-md-2"><div>

Each activity or fragment is associated with **one** layout file. It's an [XML](/programming-languages/others/data/xml.md) file stored in **app/res/layout**. Inside there is a [layout](#layouts) with children [views](#views) defining the appearance of the user interface.

```
<?xml version="1.0" encoding="utf-8"?>
<XXXLayout xmlns:android="http://schemas.android.com/apk/res/android"
             xmlns:app="http://schemas.android.com/apk/res-auto"
             xmlns:tools="http://schemas.android.com/tools"
             android:layout_width="match_parent"
             android:layout_height="match_parent"
             tools:context=".MainActivity" >
  <!-- NESTED TAGS -->
</XXXLayout>
```
</div><div>

`XXXLayout` is called the `root`. `<XXXLayout>...</XXXLayout>` is called a tag. They can have attributes such as `<XXX attribute='value'>` and may contain nested tags, which could be [views](#views) or [layouts](#layouts).

<p class="text-center">A few things to know</p>

⚒️ `tools:context` point to the associated Fragment/Activity in YOUR code, so you must give it an appropriate value.

✨ `xmlns:` are very important. You can't use `android:` if you didn't add the matching `xmlns:android`. They are added to the **root**.

🚀 Layouts are usually populated using the [Layout Editor](../tools/and/index.md) as doing so manually can be complicated.
</div></div>

<hr class="sep-both">

## Layouts

<div class="row row-cols-md-2"><div>

...
</div><div>

...
</div></div>

<hr class="sep-both">

## Views

<div class="row row-cols-md-2"><div>

In Android, every component such as an Image is called a **View**. Every view must have at least these two attributes

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

## 👻 To-do 👻

Stuff that I found, but never read/used yet.

<div class="row row-cols-md-2"><div>

xxx
</div><div>


</div></div>