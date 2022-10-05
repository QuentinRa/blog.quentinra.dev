# RecyclerView

[Go back](../index.md#views)

RecyclerView is a "new" way of displaying lists, that is more efficient, and use less memory, as it is recycling views that disappeared, to show the new elements of the list that showed up. The recycler view is made of three main parts

* an **Item**
  * a view
  * a model
* a **RecyclerView**, in which all items are displayed
* an **Adapter**+**ViewHolder**, which is filling the RecyclerView with the Items, and handling the recycling of the views

<hr class="sl">

## RecyclerView

<div class="row row-cols-md-2 mx-0"><div>

* Place a RecyclerView
* (Optional) if the RecyclerView is the only child, you should use a `FrameLayout` instead of a `ConstraintLayout`
</div><div>

RecyclerView support different modes of displaying items: Linear, Grid... Set the attribute `layoutManager` to the value you want (ex: `LinearLayoutManager`).

You shouldn't forget to enable scrollbars. Search for the attribute `scrollbars`, and enable the ones you want.
</div></div>

<hr class="sr">

## Adapter, and RecyclerView

<div class="row row-cols-md-2 mx-0"><div>

1. You usually provide a **collection of items** to your Adapter

```kotlin
class DummyAdapter(private val items: List<Any>)
```

2. You will also create a **layout for one element**

Some fxml with the id `R.layout.xxx` here. Let's say there is a button inside, with the id "myButton".

3. You will create a "**ViewHolder**", which is a class **helping** you **access the views inside the layout** for one element

```kotlin
class ViewHolder(view: View) : RecyclerView.ViewHolder(view) {
  val myButton: Button = view.findViewById(R.id.myButton)
}
```

4. Then, you will have to define how to fill the layout with one element, using the **collection of items**, and the **ViewHolder**

```kotlin
// something stupid
holder.myButton.text = items[position].toString()
```

</div><div>

```kotlin
class DummyAdapter(private val items: List<Any>) : RecyclerView.Adapter<DummyAdapter.ViewHolder>() {

    class ViewHolder(view: View) : RecyclerView.ViewHolder(view) {
        val myButton: Button = view.findViewById(R.id.myButton)
    }

    override fun onCreateViewHolder(parent: ViewGroup, viewType: Int): ViewHolder {
        return ViewHolder(LayoutInflater.from(parent.context)
            .inflate(R.layout.xxx, parent, false))
    }

    override fun onBindViewHolder(holder: ViewHolder, position: Int) {
        // for instance
        holder.myButton.text = items[position].toString()
    }

    override fun getItemCount(): Int {
        return items.size
    }
}
```
</div></div>

<hr class="sl">

## Activity.kt

```kotlin
// create
recyclerView.adapter = ItemAdapter(this, myDataset)
```

* If the size of your dataset/collection of items is fixed

```kotlin
recyclerView.setHasFixedSize(true)
```

<hr class="sr">

## MaterialCardView

You can wrap your view in a MaterialCardView. See [MaterialCardView](https://developer.android.com/reference/com/google/android/material/card/MaterialCardView)

<hr class="sl">

## References

* [Create dynamic lists with RecyclerView](https://developer.android.com/develop/ui/views/layout/recyclerview)