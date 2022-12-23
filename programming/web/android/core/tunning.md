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