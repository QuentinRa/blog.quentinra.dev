# Android ViewModel

<div class="row row-cols-md-2"><div>

A ViewModel is linking the model of your application <small>(=room database, files, apis)</small> with your [Views](../views/index.md).

* 👉 If the view changed, you may want to change the model <small>(process the user input...)</small>
* 👉 If the model changed, you may want to update the view <small>(serve the updated data to the user)</small>

```gradle
implementation 'androidx.lifecycle:lifecycle-viewmodel-ktx:2.5.1'
```

A ViewModel is created when the **application** is started, and destroyed when the **application** is destroyed <small>(`ViewModel#onCleared()`)</small>.
</div><div>

When an Activity is destroyed, the ViewModel isn't, so we can use it to fill again our View <small>(ex: rotating the screen clear input fields)</small>.

Another alternative to ViewModel is using a Bundle, but they are limited in size, so they're not convenient to use.

```kotlin
class BlankViewModel : ViewModel() {
    // implement your ViewModel here
    // ❌ the simplest usage, stock variables
    var count = 0
    // ✅ see LiveData for proper usages
}
```
</div></div>

<hr class="sep-both">

## Instantiate your ViewModel

You can't do it by calling the constructor, otherwise it won't be a singleton <small>(unique instance)</small>.

<div class="row row-cols-md-2"><div>

#### Activity

This import is **unneeded** if you added the one for fragments.

```gradle
implementation "androidx.activity:activity-ktx:1.6.1"
```

```kotlin
class MainActivity : AppCompatActivity() {
    private val viewModel: BlankViewModel by viewModels()
    
    override fun onCreate(savedInstanceState: Bundle?) {
        // ...
        // ex: init the view with count
        val count = viewModel.count
    }
}
```

<br>

#### Other alternatives

You may use these instead of `by` <small>(delegated creation)</small>.

<details class="details-e">
<summary>Use <code>ViewModelProvider</code></summary>

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
</div><div>

#### Fragment

This will import the function for use both in Fragments and Activities.

```gradle
implementation "androidx.fragment:fragment-ktx:1.5.5"
```

```kotlin
class BlankFragment : Fragment() {
    private val viewModel: BlankViewModel by viewModels()
    
    override fun onViewCreated(view: View, savedInstanceState: Bundle?) {
        super.onViewCreated(view, savedInstanceState)
        // ex: init the view with count
        val count = viewModel.count
    }
}
```

⚠️ The viewModel above **won't be shared** between other fragments or the activity. If a fragment A change a value inside the ViewModel, the fragment B will still have the old value. ⚠️

To fix this, use a ViewModel owned by the Activity.


```diff
class BlankFragment : Fragment() {
-    private val viewModel: BlankViewModel by viewModels()
+    private val viewModel: BlankViewModel by activityViewModels()
}
```
</div></div>

<hr class="sep-both">

## 👻 To-do 👻

Stuff that I found, but never read/used yet.

<div class="row row-cols-md-2"><div>

* **Instead of `viewModels()`** which is not shared between fragments of one activity, you can use `activityViewModels()`.
</div><div>


</div></div>