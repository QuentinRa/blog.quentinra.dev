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