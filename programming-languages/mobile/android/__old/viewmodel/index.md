# Android ViewModel

<div class="row row-cols-md-2"><div>

A ViewModel is linking the model of your application <small>(=room database, files, APIs)</small> with your [Views](../views/index.md).

* 👉 If the view changed, you may want to change the model <small>(process the user input...)</small>
* 👉 If the model changed, you may want to update the view <small>(serve the updated data to the user)</small>
</div><div>
</div></div>

<hr class="sep-both">

## 🌀 LiveData 🌀

<div class="row row-cols-md-2"><div>

A **LiveData** is an observable variable. It means a component can execute some code when the variable changes.

They are usually used to update the View when a variable in the model changed.

```gradle
implementation 'androidx.lifecycle:lifecycle-livedata-ktx:2.5.1'
```

It's worth noting that LiveDatas are **life-cycle aware**, so observers are only called when the app is either **Started** or **Resumed**.

A **LiveData** is wrapping a type inside **value**. For instance, **LiveData<Int>** will have a **value** of type **Int**.

```kotlin
val count : LiveData<Int> = MutableLiveData<Int>(0)
if (count.value!! == 0) {} // true
```

LiveData variables are stored inside a ViewModel.
</div><div>

As **value may be null**, we need to use null-safe operators <small>(`!!`, `?`, `?:`...)</small>. The difference between a LiveData and a MutableLiveData is that in the latter, you can change `value`.

```kotlin
// count.value will be null
val count : MutableLiveData<Int> = MutableLiveData<Int>()
// count.value is now '10'
count.value = 10
```

Each time **value is assigned** <small>(modifying value won't trigger observers)</small>, observers will be called. In an Activity/Fragment

```kotlin
// ➡️ In a fragment, use viewLifecycleOwner instead of this
viewModel.count.observe(this) { newCount ->
    // ... 
}
// same, but with "it" instead of "newCount"
viewModel.count.observe(this) {
    // ...
}
```

</div></div>

<hr class="sep-both">

## ☕ Example ☕

*Listeners, and everything related to Views are explained in [Views](../views/index.md).*

<div class="row row-cols-md-2"><div>

First, we are defining a ViewModel.

```kotlin
class MainViewModel : ViewModel() {
    // use a backing field
    // count is unmodifiable from the "outside"
    var _count = MutableLiveData(0)
    val count : LiveData<Int> = _count

    // only allow count to be increased
    fun increaseCount() {
        _count.value = _count.value!!.inc()
    }
}
```

It's important to note that you can't simply call `_count.value!!.inc()`. A LiveData is only calling `observe` when the property `value` is assigned to a new value, not when the property is modified.

</div><div>

An Activity/a fragment will link the ViewModel and the View.

* ➡️ Ex: When a button is clicked, we update the ViewModel

```kotlin
val myButton = ...
myButton.setOnClickListener {
    viewModel.increaseCount()
}
```

* ➡️Ex: When the ViewModel is updated, we update the View

```kotlin
val countTextView = ...
viewModel.count.observe(viewLifecycleOwner) {
    // it is the newValue for "count"
    // here, we update a TextView
    countTextView.text = it.toString()
}
```

**Note**: using [Data binding](../views/index.md), you can avoid using observers.
</div></div>

<hr class="sep-both">

## ⚡ Advanced LiveData ⚡

<div class="row row-cols-md-2"><div>

#### Transformations

Transformations allow us to create a "fake" LiveData from another LiveData.

➡️In the example, we are always converting "count" to a String. Why don't we serve a `LiveData<String>` instead?

```kotlin
// When _count is changed, we execute the code below.
// The last line is the newValue of our LiveData<String>
val count: LiveData<String> = Transformations.map(_count) {
    it.toString()
}
```

```diff
- countTextView.text = it.toString()
+ countTextView.text = it
```
</div><div>

#### Mediator

A mediator is a LiveData that is linked to multiple LiveData. When one LiveData is updated, then the mediator is updated.

➡️Increasing "a" or "b" will edit "count" with the sum of both.

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
</div></div>

<hr class="sep-both">

## 🗃️ State of a request using LiveData 🗃️

<div class="row row-cols-md-2 mt-4"><div>

You can use an additional LiveData to handle

* Loading time
* Errors

You should use a LiveData of an enum, such as

```
private val _state = MutableLiveData<LoadingState>()
val state : LiveData<LoadingState>  = _state

enum class LoadingState {
    LOADING, SUCCESS, FAILED
}
```
</div><div>

The views will observe this state, and show an appropriate message to the user such as a Toast for errors.

Inside the ViewModel, when doing API requests, you will update the state

```kotlin
...
_state.value = LoadingState.LOADING
// An API request
...
// modify the state
_state.value =
    if (...) LoadingState.SUCCESS
    else LoadingState.FAILED
```
</div></div>