# Views

<div class="row row-cols-md-2"><div>

Each activity or fragment is associated with **one** layout. A layout is an [XML](/programming-languages/others/data/xml.md) file stored in **app/res/layout**. It defines the appearance of the user interface elements. A layout can also be used in another layout.

```
<?xml version="1.0" encoding="utf-8"?>
<XXXLayout xmlns:android="http://schemas.android.com/apk/res/android"
             xmlns:app="http://schemas.android.com/apk/res-auto"
             xmlns:tools="http://schemas.android.com/tools"
             android:layout_width="match_parent"
             android:layout_height="match_parent"
             tools:context=".MainActivity" >
  <!-- YOUR VIEW HERE -->
</FrameLayout>
```
</div><div>

XXXLayout is called the `root`. We add view components inside.

<br>

⚒️ `tools:context` point to the associated Fragment/Activity in YOUR code, so you must give it an appropriate value.

✨ `xmlns:` are very important. You can't use `android:` if you didn't add the matching `xmlns:android`. They are added to the **root**.

➡️ Layouts are usually populated using the [Layout Editor](../tools/and/index.md) as doing so manually can be complicated.
</div></div>

<hr class="sep-both">

## 👻 To-do 👻

Stuff that I found, but never read/used yet.

<div class="row row-cols-md-2"><div>

xxx
</div><div>


</div></div>