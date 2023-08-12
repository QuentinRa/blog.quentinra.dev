# Android ViewModel

<div class="row row-cols-md-2"><div>

A ViewModel is linking the model of your application <small>(=room database, files, APIs)</small> with your [Views](../views/index.md).

* 👉 If the view changed, you may want to change the model <small>(process the user input...)</small>
* 👉 If the model changed, you may want to update the view <small>(serve the updated data to the user)</small>
</div><div>
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