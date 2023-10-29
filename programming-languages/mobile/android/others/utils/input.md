# 🪁 InputManager 🪁

<div class="row row-cols-lg-2"><div>

**Hide keyboard**

```kotlin
val inputMethodManager = getSystemService(Context.INPUT_METHOD_SERVICE) as InputMethodManager
// ➡️ Activity
inputMethodManager.hideSoftInputFromWindow(currentFocus!!.windowToken, 0)
// ➡️ Fragment
inputMethodManager.hideSoftInputFromWindow(view.windowToken, 0)
```
</div><div>
</div></div>