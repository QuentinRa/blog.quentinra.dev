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
class EmptyViewModel : ViewModel() {
    // implement your ViewModel here
    // e.g. methods to store data/query an API...
    // 🔥 the simplest usage, stock data in variables
    var count = 0
}
```

The next step is to load the view model inside an activity or a fragment. The code is different for Activities and Fragments.

#### Activity

This import is **unneeded** if you added the one below for fragments.

```gradle
implementation "androidx.activity:activity-ktx:1.6.1"
```

```kotlin
class MainActivity : AppCompatActivity() {
    private val viewModel: EmptyViewModel by viewModels()
    
    override fun onCreate(savedInstanceState: Bundle?) {
        // ...
        // ex: init the view with count
        val count = viewModel.count
    }
}
```
</div><div>

#### Fragment

This will import the function for use both in Fragments and Activities.

```gradle
implementation "androidx.fragment:fragment-ktx:1.5.5"
```

```kotlin
class BlankFragment : Fragment() {
    private val viewModel: EmptyViewModel by viewModels()
    
    override fun onViewCreated(view: View, savedInstanceState: Bundle?) {
        super.onViewCreated(view, savedInstanceState)
        // ex: init the view with count
        val count = viewModel.count
    }
}
```

<br>

#### ViewModel sharing

Any viewModel is **not** shared between activities or fragments. For instance, two activities with the code for [activities](#activity) will create two separate viewModel instances.

For fragments, it's possible to create an activity-scoped viewModel, which is shared between all fragments of an activity:

```diff
class BlankFragment : Fragment() {
-    private val viewModel: EmptyViewModel by viewModels()
+    private val viewModel: EmptyViewModel by activityViewModels()
}
```

#### Other code samples

<p></p>

<details class="details-n">
<summary>Alternative: <code>ViewModelProvider</code></summary>

```kotlin
class MainActivity : AppCompatActivity() {
    private lateinit var viewModel: BlankViewModel
    
    override fun onCreate(savedInstanceState: Bundle?) {
        // ...
        // init the view with count
        viewModel = ViewModelProvider(this)[BlankViewModel::class.java]
        val count = viewModel.count
    }   
}
```
</details>

<details class="details-n">
<summary>Pass arguments to your ViewModel</summary>

The example below is with an Integer.

```kotlin
class XXXViewModel(v: Integer) : ViewModel() {
    // ...
}
```

```kotlin
class XXXViewModelFactory(private val v: Integer) : ViewModelProvider.Factory {
    @Suppress("UNCHECKED_CAST")
    override fun <T : ViewModel> create(modelClass: Class<T>): T {
        return XXXViewModel(v) as T
    }
}
```

```diff
- private val viewModel: XXXViewModel by viewModels()
+ private val viewModel: XXXViewModel by viewModels {
+    XXXViewModelFactory(10)
+}
```
</details>
</div></div>

<hr class="sep-both">

## LiveData

<div class="row row-cols-md-2"><div>

A **LiveData** 📩 is a **life-cycle aware observable** variable.

Observable means we can execute some code when the variable's value changes. [Life-cycle](../_general/index.md#activity-life-cycle) aware means it doesn't check if the variable changed when the application is not either **Started** or **Resumed**.

```gradle
implementation 'androidx.lifecycle:lifecycle-livedata-ktx:2.5.1'
```

✅ They are used to update the view when the model changes.

A **LiveData** is wrapping a variable and add to it its logic. For instance, `LiveData<Int>` wrap a value of type `Int`.

The value can be null, so we have to use null-safe operators. <small>(`!!`, `?`, `?:`...)</small>.

```kotlin
val count : LiveData<Int> = MutableLiveData<Int>(0)
if (count.value!! == 0) {} // true
```

Each time `value` is **assigned** <small>(modifying value won't trigger observers)</small>, **observers** will be called. In an Activity:

```kotlin
viewModel.count.observe(this) { newCount -> /* ... */ }
viewModel.count.observe(this) { /* it == newCount */ }
```

⚠️ Use `viewLifecycleOwner` instead of `this` in a Fragment.

🚀 With [Data binding](../views/index.md), you can avoid using observers to update views.
</div><div>

#### LiveData and MutableLiveData

The `value` attribute of a `LiveData<T>` cannot be modified, while we can for a `MutableLiveData<T>`. We usually use `MutableLiveData<T>` internally, and only expose a `LiveData<T>` to other classes.

```kotlin
class MainViewModel : ViewModel() {
    // use a backing field
    // count is unmodifiable from the "outside"
    var _count = MutableLiveData(0)
    val count : LiveData<Int> = _count

    // only allow count to be increased
    fun increaseCount() {
        // assign value to trigger observers
        _count.value = _count.value!!.inc()
    }
}
```

#### LiveData Code Samples

<details class="details-n">
<summary>When a button is clicked, we update the ViewModel</summary>

```kotlin
val myButton = ...
myButton.setOnClickListener {
    viewModel.increaseCount()
}
```
</details>

<details class="details-n">
<summary>When the ViewModel is updated, we update the View</summary>

```kotlin
val countTextView = ...
viewModel.count.observe(viewLifecycleOwner) {
    // it is the newValue for "count"
    // here, we update a TextView
    countTextView.text = it.toString()
}
```
</details>

<details class="details-n">
<summary>📖 Transformations</summary>

Transformations will create a "fake" LiveData from another LiveData. For instance, to convert a string to a date.

```kotlin
// Ex: here we simply return "count" as a "String"
// When _count is changed, we execute the code below.
// The last line is the newValue of our LiveData<String>
val count: LiveData<String> = Transformations.map(_count) {
    it.toString()
}
```

In the code above to update the view, we would write:

```diff
- countTextView.text = it.toString()
+ countTextView.text = it
```
</details>

<details class="details-n">
<summary>📖 Mediator</summary>

A mediator is a LiveData that is bound to multiple LiveData. When one LiveData is updated, then the mediator is updated.

➡️Increasing "a" or "b" will update "count" with the sum of both.

```
private val a = MutableLiveData(0)
private val b = MutableLiveData(0)
private val mediator = MediatorLiveData<Int>()
val count: LiveData<Int> = mediator

init {
    mediator.addSource(a) { mediator.value = it + b.value!! }
    mediator.addSource(b) { mediator.value = it + a.value!! }
}

fun increaseCount() {
    if ((1..10).random() > 5){
         a.value = a.value!! + 10
    } else {
        b.value = b.value!! + 100
    }
}
```

See also [Transformations with multiple arguments](https://stackoverflow.com/questions/47572913/livedata-transformations-map-with-multiple-arguments#answer-53628300).
</details>
</div></div>

<hr class="sep-both">

## 👻 To-do 👻

Stuff that I found, but never read/used yet.

<div class="row row-cols-md-2"><div>

Another alternative to ViewModel is using a **Bundle** 🎒, but they are limited in size, so they're not convenient to use.
</div><div>
</div></div>