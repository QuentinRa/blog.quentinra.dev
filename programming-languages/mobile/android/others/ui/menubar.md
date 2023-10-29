# ☕ Customize the menu bar ☕

<div class="row row-cols-lg-2"><div>

#### ➡️ Generate an XML

* Open the "Resources Manager"
* Click on "..."
* Select Menu
* Click on "+"
* Enter a Filename, such as "main_menu"
* Press OK

<details class="details-e">
<summary>Empty Menu File in app/res/menu</summary>

```xml
<?xml version="1.0" encoding="utf-8"?>
<menu xmlns:app="http://schemas.android.com/apk/res-auto"
    xmlns:android="http://schemas.android.com/apk/res/android"
    xmlns:tools="http://schemas.android.com/tools">
</menu>
```
</details>

<br>

#### ➡️ Adapt the XML

The process is the same as with Layouts, but with a smaller library. It's important to **give an Id to every MenuItem**.

```xml
<item
    android:id="@+id/example_menu_item"
    android:title="Shown in App"
    tools:title="Shown in DesignView"
    ...
     />
```

Note that by default, MenuItems are shown in "...". You can change this behavior by using "showAsAction". If an icon is present, it will be shown, otherwise, the title will be shown instead.

```
<item
    android:icon="@drawable/ic_launcher_foreground"
    app:showAsAction="always" />
```
</div><div>

#### Reusable menus with a MenuProvider

The recommended way to add a menu is by using a **MenuProvider**.

```kotlin
class XXXMenuProvider : MenuProvider {
    // menu/main_menu.xml
    override fun onCreateMenu(menu: Menu, menuInflater: MenuInflater) {
        menuInflater.inflate(R.menu.main_menu, menu)
    }

    override fun onMenuItemSelected(menuItem: MenuItem): Boolean {
        return when (menuItem.itemId) {
            R.id.example_menu_item -> {
                // ... code if the user clicks on this menu item ...
                true
            }
            else -> false
        }
    }
}
```

⚠️ Note that if you add it to a fragment <small>(resp. activity)</small>, it will be removed when moving to another fragment <small>(resp. activity)</small>.

```kotlin
// ➡️ Activity
addMenuProvider(XXXMenuProvider(), this, Lifecycle.State.RESUMED)
// ➡️ Fragment
activity?.addMenuProvider(XXXMenuProvider(), viewLifecycleOwner, Lifecycle.State.RESUMED)
```

<br>

#### Additional notes

<p></p>

<details class="details-e">
<summary>Menus for an Activity without a MenuProvider</summary>

```kotlin
class MainActivity : AppCompatActivity() {
    // ...

    // menu/main_menu.xml
    override fun onCreateOptionsMenu(menu: Menu?): Boolean {
        menuInflater.inflate(R.menu.main_menu, menu)
        // you may use
        // menu?.findItem(R.id.example_menu_item)
        // to set up your menu items
        return true
    }

    override fun onOptionsItemSelected(item: MenuItem): Boolean {
        return when (item.itemId) {
            R.id.example_menu_item -> {
                // ... code if the user clicks on this menu item ...
                true
            }
            else -> super.onOptionsItemSelected(item)
        }
    }
}
```
</details>
</div></div>