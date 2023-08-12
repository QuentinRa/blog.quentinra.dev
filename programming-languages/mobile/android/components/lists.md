# 🚃 Display a list of items 🚃

<div class="row row-cols-md-2"><div>

[RecyclerView](https://developer.android.com/develop/ui/views/layout/recyclerview) is a "new" way of displaying lists, that is more efficient, and uses less memory, as it is recycling views that disappeared, to show the new elements of the list that showed up.

```xml
<androidx.recyclerview.widget.RecyclerView
    android:id="@+id/example_recycler_view"
    android:layout_width="match_parent"
    android:layout_height="match_parent" />
```

##### Scrollbars

You may enable scrollbars <small>(vertical, horizontal, none, both with "|")</small>

```diff
<androidx.recyclerview.widget.RecyclerView
    ...
+    android:scrollbars="vertical"
     />
```

##### Layout

By default, the list is using a ListView, which is similar to a LinearLayout with an orientation set to vertical. The next element is below the previous one. You can change the layout inside the XML

```diff
<androidx.recyclerview.widget.RecyclerView
    ...
+    app:layoutManager="LinearLayoutManager"
+    android:orientation="horizontal"
     />
```

```diff
<androidx.recyclerview.widget.RecyclerView
    ...
+    app:layoutManager="GridLayoutManager"
     />
```

Or, inside the code

```kotlin
val recyclerView : RecyclerView = ...
with(recyclerView) {
    // ➡️ Horizontal LinearLayout
    layoutManager = LinearLayoutManager(context, LinearLayoutManager.HORIZONTAL, false)
    // ➡️ Two-columns GridLayout
    layoutManager = GridLayoutManager(context, 2)
}
```
</div><div>

#### Adapter

Let's say we have a list of elements of type Data

```kotlin
class Data(val message: String)
// example
val myList = listOf(Data("one"), Data("two"))
```

We need to create a View for **one item**. Create an XML Layout. It's worth noting that you should NOT use **match_parent** to both horizontal/vertical, otherwise each item will take the whole screen.

<details class="details-e">
<summary>Ex: data_item.xml | An item with only a TextView</summary>

```
<?xml version="1.0" encoding="utf-8"?>
<!-- ➡️ There is only one item, so we use a FrameLayout -->
<FrameLayout xmlns:android="http://schemas.android.com/apk/res/android"
    android:layout_width="wrap_content"
    android:layout_height="wrap_content">

    <!-- ➡️ Don't forget to give an Id to your TextView -->
    <TextView
        android:id="@+id/message"
        android:layout_width="wrap_content"
        android:layout_height="wrap_content"
        />

</FrameLayout>
```
</details>

Now, we need to write an **Adapter**. This is a class that will handle displaying an item of our list (**Data**) inside one instance of **data_item.xml**.

<details class="details-e">
<summary>DummyAdapter</summary>

```kotlin
class DummyAdapter(private val items: List<Data>) : RecyclerView.Adapter<DummyAdapter.ViewHolder>() {
    // ➡️ The function bind takes "data", and fills our Item
    class ViewHolder(view: View) : RecyclerView.ViewHolder(view) {
        private val messageView = view.findViewById<TextView>(R.id.message)

        fun bind(data: Data) {
            messageView.text = data.message
        }
    }

    // ➡️ We are linking data_item.xml here
    override fun onCreateViewHolder(parent: ViewGroup, viewType: Int): ViewHolder {
        return ViewHolder(LayoutInflater.from(parent.context).inflate(R.layout.data_item, parent, false))
    }

    override fun onBindViewHolder(holder: ViewHolder, position: Int) {
        holder.bind(items[position])
    }

    override fun getItemCount(): Int {
        return items.size
    }
}
```
</details>

Then, inside an Activity/a Fragment, we need to link the recycler view with the adapter.

```diff
val recyclerView : RecyclerView = ...
with(recyclerView) {
+    adapter = DummyAdapter(myList)
}
```

#### Additional notes

<p></p>

<details class="details-e">
<summary>Optimization: lists of fixed size</summary>

```diff
val recyclerView : RecyclerView = ...
with(recyclerView) {
+    setHasFixedSize(true)
}
```
</details>

<details class="details-e">
<summary>Style: add a separator between items</summary>

```diff
val recyclerView : RecyclerView = ...
with(recyclerView) {
+    addItemDecoration(DividerItemDecoration(context, DividerItemDecoration.HORIZONTAL))
}
```
</details>

<details class="details-e">
<summary>🤔 Dynamic lists: notify 🤔</summary>

The example is using a static unchangeable list. The easy+bad patch would be to rely on **notifyDataSetChanged** which means we are updating the whole view, for a potentially minor change.

```diff
-class DummyAdapter(private val items: List<Data>) : RecyclerView.Adapter<DummyAdapter.ViewHolder>() {
+class DummyAdapter(private var items: List<Data>) : RecyclerView.Adapter<DummyAdapter.ViewHolder>() {

+    fun updateList(newItems: List<Data>) {
+        items = newItems
+        notifyDataSetChanged()
+    }
}
```

You can improve the code above, only update one index, and use a variant of **notify** such as `notifyItemInserted(position)`. Or, you can use LiveData (inside a ViewModel) and a ListAdapter.
</details>

<details class="details-e">
<summary>⚡ Dynamic Lists: ListAdapter ⚡</summary>

We need to add a method to compute the difference between two values.

```kotlin
data class Data(val message: String) {
    companion object DataDiff : DiffUtil.ItemCallback<Data>() {
        override fun areItemsTheSame(oldItem: Data, newItem: Data): Boolean {
            /* you should something unique */
            return oldItem == newItem ||
                    oldItem.message == newItem.message
        }

        override fun areContentsTheSame(oldItem: Data, newItem: Data): Boolean {
            /* check every attribute that may have changed */
            return oldItem.message == newItem.message
        }
    }
}
```

Then, we replace our Adapter with a ListAdapter.

```diff
-class DummyAdapter(private val items: List<Data>) : RecyclerView.Adapter<DummyAdapter.ViewHolder>() {
+class DummyAdapter(private val items: LiveData<List<Data>>) : ListAdapter<Data, DummyAdapter.ViewHolder>(Data) {
        private val messageView = view.findViewById<TextView>(R.id.message)

        fun bind(data: Data) {
            messageView.text = data.message
        }
    }

    override fun onCreateViewHolder(parent: ViewGroup, viewType: Int): ViewHolder {
        return ViewHolder(LayoutInflater.from(parent.context).inflate(R.layout.data_item, parent, false))
    }

    override fun onBindViewHolder(holder: ViewHolder, position: Int) {
-        holder.bind(items[position])
+        holder.bind(items.value!![position])
    }

    override fun getItemCount(): Int {
-        return items.size
+        return items.value?.size ?: 0
    }
}
```

Then, you can use the code below to update the recycler view when the list is updated. The ListAdapter will compute changes in a **background thread**, and **only update what changed**.

```kotlin
viewModel.myList.observe(this) {
  with(binding.recyclerView.adapter as DummyAdapter) {
    submitList(it)
  }
}
```

⚠️ It's worth noting that this is only working because `items` inside our ListAdapter is a LiveData. If it was a normal list, we would have to re-assign the attribute as we did with **notify**.
</details>

See also

* [Scroll to beginning](https://stackoverflow.com/questions/53248736/listadapter-submitlist-how-to-scroll-to-beginning)
</div></div>