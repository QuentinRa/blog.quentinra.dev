# Android

**[Old notes](_old.md)**

...

<hr class="sep-both">

## 👻 To-do 👻

Stuff that I found, but never read/used yet.

<div class="row row-cols-md-2"><div>

* Android ProGuard
* Datastore
* File system
* Themes
* Android bottom navigation
* Services
* [Nested navigation graphs](https://developer.android.com/guide/navigation/navigation-nested-graphs)
* Room
</div><div>

```kotlin
ViewModelProvider(this)[XXXViewModel::class.java]
recyclerView.apply {
    layoutManager = GridLayoutManager(requireContext(), 2)
}

val preferences: SharedPreferences = PreferenceManager.getDefaultSharedPreferences(this)
if (preferences.getBoolean("key", false)) {}

intent.addFlags(Intent.FLAG_ACTIVITY_CLEAR_TOP)
```
</div></div>