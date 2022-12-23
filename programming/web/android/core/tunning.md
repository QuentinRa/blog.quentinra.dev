# Improvements

<div class="row row-cols-md-2"><div>

Most developers may not care about what's written here unless

* 👉 They are trying to make reuse/maintenable code
* 👉 The core of the application was finished, and there is a need to improve the UserExperience of the user
</div><div>
</div></div>

<hr class="sep-both">

## Model View ViewModel (MVVM)

<div class="row row-cols-md-2"><div>

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

The "main" composant is the ViewModel. This is a composant that will link the View with the model. When the model is updated, it will update the View. When the View is updated, it will update the model.

<br>

* ➕ Controllers (Activities, Fragments)

There are still controllers like in MVC. They are responsible for rendering the view, and listening to events.
</div></div>

<hr class="sep-both">

## 🔥 Accessibility 🔥

<div class="row row-cols-md-2 mt-3"><div>

If something is only here to decorate the screen, you should make it as not important for accessibility.

```
<ImageView
  android:importantForAccessibility="no" />
```
</div><div>

For images, if they are important for accessibility, you should provide a content description. ⚠️If the image is modified from the code, the content description should be updated.

```
<ImageView
  android:contentDescription="Describe this image" />
```
</div></div>

<hr class="sep-both">

## 🎨 Material Design 🎨

<div class="row row-cols-md-2"><div>

Material design is a library of pre-made components. Google recommends to use Material UI components as much as possible.

* [See Material 2 Documentation](https://m2.material.io/) <small>(currently widely used)</small>
* [See Material 3 Documentation](https://m3.material.io/) <small>(released in late 2022)</small>

Material design provide both

* 👉 Guidelines (padding, sizes...) to make nice UI
* 👉 Pre-made Composants <small>(padding, sizes...)</small>
</div><div>

Manually edit the XML and replace AndroidX classes with MaterialUI classes. Aside the name of the class, and new attributes being available, nothing much will change.

[See the list here + detailed instructions](https://github.com/material-components/material-components-android/tree/master/docs/components)

* `EditText` <math xmlns="http://www.w3.org/1998/Math/MathML"><mo accent="false" stretchy="false">&#x2192;</mo></math> `TextInputLayout+TextInputEditText`
* `SwitchCompat` <math xmlns="http://www.w3.org/1998/Math/MathML"><mo accent="false" stretchy="false">&#x2192;</mo></math> `SwitchMaterial`
* ...
</div></div>