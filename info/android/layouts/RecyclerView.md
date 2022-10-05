# RecyclerView

[Go back](../index.md#views)

RecyclerView is a "new" way of displaying lists, that is more efficient, and use less memory, as it is recycling views that disappeared, to show the new elements of the list that showed up. The recycler view is handled by multiple actors

* item - One data item of the list to display. Represents one Affirmation object in your app.
* Adapter - Takes data and prepares it for RecyclerView to display.
* ViewHolders - A pool of views for RecyclerView to use and reuse to display affirmations.
* RecyclerView - Views on screen

> Since your layout only has a single child view, RecyclerView, you can switch to a simpler ViewGroup called FrameLayout that should be used for holding a single child view.
> * Replace `ConstraintLayout` in the .fxml with `FrameLayout`
> * Or click on `ConstraintLayout` in the layer tree > Convert view > `FrameLayout`

RecyclerView supports displaying items in different ways, such as a linear list or a grid.

* `scrollbars`: `vertical`
* `layoutManager`: `LinearLayoutManager`

**Creating the adapter**

* Need `context` to access stuff

```kotlin
class ItemViewHolder(private val view: View) : RecyclerView.ViewHolder(view) {
// stuff related to the view of one item
}

class ItemAdapter(...) : : RecyclerView.Adapter<ItemViewHolder>() {

    override fun onCreateViewHolder(parent: ViewGroup, viewType: Int): ItemViewHolder {
       return ItemViewHolder(LayoutInflater.from(parent.context)
       .inflate(R.layout.list_item, parent, false))
    }
    
    override fun getItemCount(): Int {
        TODO("Not yet implemented")
    }
    
    override fun onBindViewHolder(holder: ItemViewHolder, position: Int) {
        TODO("Not yet implemented")
    }
}

// create
recyclerView.adapter = ItemAdapter(this, myDataset)
recyclerView.setHasFixedSize(true)
```

Documentation: https://developer.android.com/develop/ui/views/layout/recyclerview

<hr>

wrap in MaterialCardView