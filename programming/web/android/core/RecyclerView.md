# RecyclerView

RecyclerView is a "new" way of displaying lists, that is more efficient, and use less memory, as it is recycling views that disappeared, to show the new elements of the list that showed up. The recycler view is made of three main parts

* an **Item**
  * a view
  * a model
* a **RecyclerView**, in which all items are displayed
* an **Adapter**+**ViewHolder**, which is filling the RecyclerView with the Items, and handling the recycling of the views
  * TIP: Use **ListAdapter** for Lists

<hr class="sr">

## Your item

<div class="row row-cols-md-2"><div>

Create a layout for ONE item. Let's call it `xxx_item`, with `xxx` the kind of item that this view is representing.

* Set the "layout_height" to wrap content, or something else that "match_parent", as this would mean each item is taking the whole screen.

</div><div>

We will consider for this "example", that you are using hardcoded data, that is a list of anything. 

```kotlin
val myDataset : List<Any> = listOf(...)
```

You will obviously have to fix that later.

</div></div>

<hr class="sr">

## Activity.kt

<div class="row row-cols-md-2 mt-3"><div>

* **Set the adapter**

```kotlin
// create
recyclerView.adapter = DummyAdapter(myDataset)
```

* (optional) if the size of your dataset/collection of items is fixed, you can improve your performances

```kotlin
recyclerView.setHasFixedSize(true)
```
</div><div>

* (optional) change the layout manager in the code

```kotlin
recyclerView.layoutManager = LinearLayoutManager(this)
```

* (optional) add a divider between entries

```kotlin
recyclerView.addItemDecoration(
    DividerItemDecoration(this, DividerItemDecoration.VERTICAL)
)
```
</div></div>

<hr class="sl">

## ListAdapter

<div class="row row-cols-md-2"><div>

If you are using a List, then the recycler view won't be updated when you update the list. The previous example will only display the initial list.

This subclass of RecyclerView.Adapter will allow you to change the list, while firing the RIGHT event. For instance, if you modified the 5th element, there is no need to update the other ones. The process of computing diffs between Lists is done on a background thread by ListAdapter.

```gradle
implementation 'androidx.leanback:leanback:1.0.0'
```

This example is using ViewModel+LiveData. Please use them too, as this is a good practice. **ListAdapter** is taking the type of one Item, the ViewHolder, and in parameter, something called DiffCallback from the package leanback that we imported.

```kotlin
class DummyAdapter(private val items: LiveData<List<Any>>) : ListAdapter<Any, MatchItemAdapter.ViewHolder>(DiffCallback) {}
```

</div><div>

Replace the usages of `items` with `items.value!!`

```kotlin
override fun onBindViewHolder(holder: ViewHolder, position: Int) {
  // todo: your binding
  holder.myButton.text = items.value!![position].toString()
}

override fun getItemCount(): Int {
  return items.value!!.size
}
```

Then in your controller

```kotlin
viewModel.yourLiveDataVariable.observe(this) { p ->
  with(binding.recyclerView.adapter as DummyAdapter) {
    submitList(p)
  }
}
```

> **Note**: If you are not using LiveData, then the only important consideration is that your attribute `items` in `DummyAdapter` should change when the list changed, otherwise even if you call `submitList(p)` which will compute diff, as the internal list is the same, then the rendered elements will be the same.
</div></div>

<hr class="sr">

## MaterialCardView

You can wrap your view in a MaterialCardView. See [MaterialCardView](https://developer.android.com/reference/com/google/android/material/card/MaterialCardView)

<hr class="sl">

## References

* [Create dynamic lists with RecyclerView](https://developer.android.com/develop/ui/views/layout/recyclerview)