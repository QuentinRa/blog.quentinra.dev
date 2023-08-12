# Data management

<div class="row row-cols-md-2"><div>

When using Activities or Fragments, you will usually want to store some data. For instance, the user checked some option in the previous activity, and you want to keep track of it.

It's even more needed as [many scenarios lead to an Activity being destroyed](../_general/index.md), so you may have to save data to load it back, for instance, when the user rotates the screen.
</div><div>

This usually involves a few classes:

* **ViewModel** 🏠: a class to store data in a model
* **Bundle** 🎒: a class to store data in a model
* **LiveData&lt;T&gt;** 📩: update the model when the view changes; update the view when the model changes

A model may be temporary <small>(a variable)</small>, or persistent <small>(a database, a file...)</small>. A database may be local <small>(SQLite)</small> or remote <small>(an API...)</small>.
</div></div>

<hr class="sep-both">

## ViewModel

<div class="row row-cols-md-2"><div>

We commonly use the **ViewModel** 🏠 class to handle data.

A ViewModel is created when the **application** is started, and destroyed when the **application** is destroyed <small>(`ViewModel#onCleared()`)</small>.

When loading back an activity, you can use the view model to configure the view with the data you stored in it.

```gradle
implementation 'androidx.lifecycle:lifecycle-viewmodel-ktx:2.5.1'
```

To define a basic blank model:

```kotlin
class BlankViewModel : ViewModel() {
    // implement your ViewModel here
    // e.g. methods to store data/query an API...
    // 🔥 the simplest usage, stock data in variables
    var count = 0
}
```
</div><div>
</div></div>

<hr class="sep-both">

## 👻 To-do 👻

Stuff that I found, but never read/used yet.

<div class="row row-cols-md-2"><div>

Another alternative to ViewModel is using a **Bundle** 🎒, but they are limited in size, so they're not convenient to use.
</div><div>
</div></div>