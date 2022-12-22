# Android development

**[Updated notes](index.md)**

<hr class="sr">

## Application Architecture

<div class="row row-cols-md-2"><div>

**MVVM**: Model-View-ViewModel, is an architecture by opposition to the MVC architecture, in which the ViewModel is updating the view, when the Model changed. In Android,

The Controller is responsible for rendering the UI, and listening to events. Using the full application of MVVM

* A LiveData is a variable storing a value, and calling an observer when this value changed
* A repository is a class that is fetching data from an API, or a local database (see Room)
* A ViewModel is a class providing access to the LiveData to other classes. It will use the repository to update the value stored in a LiveData

Then, using **Data binding**, you can directly use your LiveData in your XML, the file in which you create your view, and if the LiveData value is updated, so will your view.
</div><div>

...
</div></div>

<hr class="sr">

## Views

<div class="row row-cols-md-2 mx-0"><div>

**Accessibility (attributes)**

* `contentDescription`: what's the purpose of this element
* `importantForAccessibility`: if this element is just decorative, you can set it to no
* <small>Don't forget to update `contentDescription`, or any accessibility-related attributes, if needed.</small>, if updating an image from the code/dynamically
</div><div>

* [**RecyclerView**](layouts/RecyclerView.md): not a ViewGroup, but an efficient way of displaying a flexible list of elements.

<details class="details-e">
<summary>Display a button with <code>Button</code></summary>

* **Inheritance**: Button extends TextView
* **Documentation**: [Button](https://developer.android.com/reference/android/widget/Button)

**Useful attributes**

* ...

**useful methods**

* `setOnClickListener`
</details>

<details class="details-e">
<summary>Display a RadioButton  with <code>RadioButton+RadioGroup</code></summary>

* **Inheritance**: RadioButton extends Button <small>(CompoundButton to be fair)</small>, RadioGroup extends LinearLayout
* **Documentation**: [RadioButton](https://developer.android.com/reference/android/widget/RadioButton), and [RadioGroup](https://developer.android.com/reference/android/widget/RadioGroup)

RadioGroup is a ViewGroup used to ensure that only one RadioButton can be selected at a time.

**Useful attributes**

* RadioGroup#`checkedButton`

**useful methods**

* RadioGroup#`setOnCheckedChangeListener`: parameters are radio group, and the Id of the checked button.
</details>

<details class="details-e">
<summary>Display a switch  with <code>Switch</code></summary>

* **Inheritance**: Switch extends Button <small>(CompoundButton to be fair)</small>
* **Documentation**: [Switch](https://developer.android.com/reference/android/widget/Switch)

**Useful attributes**

* `checked`

**useful methods**

* `isChecked`
</details>

<details class="details-e">
<summary>Display a text field  with <code>EditText</code></summary>

* **Inheritance**: EditText extends TextView
* **Documentation**: [EditText](https://developer.android.com/reference/android/widget/EditText)

**Useful attributes**

* `inputType`: determine the [keyboard](https://developer.android.com/develop/ui/views/touch-and-input/keyboard-input/style). Can use multiple types.
* `hint`: placeholder

**useful methods**

* ...
</details>
</div></div>

<hr class="sr">

## Material Design

Material design is a library of pre-made components. Google recommends to use Material UI components as much as possible.
The list [of Material components for Android can be found here](https://material.io/components?platform=android).

* Text field: `TextInputLayout` (see [text field](https://material.io/components/text-fields/android#using-text-fields))
* Switch: `SwitchMaterial` (create a switch, change the type in the .xml)
* EditText: `TextInputLayout`. There is a builtin feature to display errors (see `error`, and `isErrorEnabled`)

<hr class="sl">

## Resources

<div class="row row-cols-md-2 mx-0"><div>

Images, texts, views, basically everything that is not a Kotlin file, is a resource. They are all stored in the  **📂res** folder

* **drawables**: images
* **layouts**: views
* **mipmap**: icons
* **values**: colors+theme, and strings
* ...

<details class="details-e">
<summary>Resources Manager</summary>

You can access the Resources Manager, which track every resource in `res`, and allow you to add new ones

* from the Left side, right under "project")
* with View > Tools Windows > Resources Manager

![Resources Manager Android Studio](_images/resources_manager_as.png)
</details>

<details class="details-e">
<summary>Add a new "drawable" (image)</summary>

* Go to Drawables tab in the Resources Manager
* Click on "+"
* Import drawables

You can drag, and drop it in the design view (or select it when creating a new imageview).
</details>

<details class="details-e">
<summary>Icons</summary>

* Open the resources manager
* "+" > new vector asset
* click on the android icon for "clip art"
* select an icon

For Android 20, or older versions, you need to add `vectorDrawables.useSupportLibrary = true` in build.gradle > Android > defaultConfig.

</details>

Every folder in `res` may have multiples "copies" for different devices/languages. For instance, if there is a view for large screen devices, it will be used instead of the view made of "every" device.

* [strings.xml](values/strings.md): how to properly handle texts, and localization
* [arrays.xml](values/arrays.md): handle arrays of strings/integers

</div><div>

**Access resources in the code**

<details class="details-e">
<summary>Access resource's (view...) Id in the code</summary>

Each resource may have an id. The main class `R` is managing every id trough subclasses such as `drawable`. If you want a drawable with the id `ic_launcher_foreground` do:

```kotlin
val drawableId : Int = R.drawable.myDrawable
val viewId : Int = R.id.hello_world
```
</details>

<details class="details-e">
<summary>findViewById</summary>

You can then use `findViewById(some_id)` to get a view.

```kotlin
val myButton: Button = findViewById(R.id.myButton)
```
</details>

<details class="details-e">
<summary>[new] view A (alternative to findViewById)</summary>

You first need to add `viewBinding` in build.gradle, in the bloc "Android", and reload the project. It will create an object that reference all views with an id. 

```gradle
buildFeatures {
    viewBinding = true
}
```

Then, create an attribute `binding`, and you will be able to access every view from it.

<details class="details-e">
<summary>Android MainActivity base code with Binding</summary>

```kotlin
import androidx.appcompat.app.AppCompatActivity
import android.os.Bundle
import com.samples.google.cone.databinding.ActivityMainBinding

class MainActivity : AppCompatActivity() {
    lateinit var binding: ActivityMainBinding
    
    override fun onCreate(savedInstanceState: Bundle?) {
        super.onCreate(savedInstanceState)
        binding = ActivityMainBinding.inflate(layoutInflater)
        setContentView(binding.root)
    }
}
```
</details>
</details>

If you write in your code a method taking an id, then you can check if this id has the "right" type using annotation, as every id is an int. Add `@StringRes`, `@DrawableRes`, or `@LayoutRes` before a variable, a parameter, or an attribute.

```kotlin
fun loadIcon(@DrawableRes drawableId: Int) {
    val drawable = AppCompatResources.getDrawable(this, drawableId)
}
```
</div></div>

<hr class="sr">

## Useful stuff

<div class="row row-cols-md-2 mt-4"><div>

<details class="details-e">
<summary>Keyboard</summary>

You can get an `` which is handling the input of the application with

```kotlin
val inputMethodManager = getSystemService(Context.INPUT_METHOD_SERVICE) as InputMethodManager
```

**Hide keyboard** (given a view)

```kotlin
inputMethodManager.hideSoftInputFromWindow(view.windowToken, 0)
```

</details>

<details class="details-e">
<summary>Dialogs (Popups)</summary>

Dialogs are made of a title (optional), a message, and some buttons (accept/close). Clicking on any button will close the popup.

```kotlin
 MaterialAlertDialogBuilder(this)
    .setTitle("XXX")
    .setMessage("YYY")
    // by default, pressing "back" closes the popup
    .setCancelable(false)
    .setNegativeButton("Button1") { _, _ ->
    }
    .setPositiveButton("Button2") { _, _ ->
    }
    .show()
```

</details>

<details class="details-e">
<summary>Menus</summary>

> * `menus`: you must use a menu provider in fragments.

* Resources manager | Menus
* Create a new one

It will generate a new layout, in which you can add menu items. You should give each an `id`, a `title`, and maybe an `icon`. Finally, you might have noticed that your menus are shown in "...". You can modify this behavior with `showAsAction` such as `always` which means that the menu will never be in the "..." (overflow).

In your Activity

```kotlin
override fun onCreateOptionsMenu(menu: Menu?): Boolean {
    menuInflater.inflate(R.menu.refresh_menu, menu)
    // you may use
    // menu?.findItem(R.id.some_menu_item)
    // to setup your menu items
    return true
}

override fun onOptionsItemSelected(item: MenuItem): Boolean {
    return when (item.itemId) {
        R.id.xxx -> {
            // ... code if the user click on this menu item ...
            true
        }
        else -> super.onOptionsItemSelected(item)
    }
}
```
</details>
<details class="details-e">
<summary>Menu Provider : reusable menus</summary>

This is an extension to menus allowing us to reuse the same menu in multiple activities, or fragments. You will simply move the code you coded for menus inside a MenuProvider.

```kotlin
class XXXMenuProvider : MenuProvider {
    override fun onCreateMenu(menu: Menu, menuInflater: MenuInflater) {
        menuInflater.inflate(R.menu.xxx, menu)
    }

    override fun onMenuItemSelected(menuItem: MenuItem): Boolean {
        return when (menuItem.itemId) {
            R.id.xxx -> {
                // ... code if the user click on this menu item ...
                true
            }
            else -> false
        }
    }
}
```

Then, in any fragment, or activity using this menu 

```kotlin
// FOR A FRAGMENT
activity?.addMenuProvider(RefreshMenuProvider(), viewLifecycleOwner, Lifecycle.State.RESUMED)
// FOR AN ACTIVITY
addMenuProvider(RefreshMenuProvider(), this, Lifecycle.State.RESUMED)
```
</details>
</div><div>

As in Java, you have listeners which are called when an event is triggered (ex: `click on a button`).

<details class="details-e">
<summary>OnClickListener (click on a button)</summary>

Example for "OnClickListener", a listener added on a button, that is called when a user click on it.

```kotlin
val myButton: Button = findViewById(R.id.myButton)
myButton.setOnClickListener {
    println("Clicked on myButton")
}
```
</details>

<details class="details-e">
<summary>OnKeyListener (click on a key)</summary>

Example for "OnKeyListener", a listener added on a input field, that is called when a user press a key. The function takes a view, a keycode, and a keyEvent, and returns true if the event was handled.

```kotlin
val myEditText: EditText = findViewById(R.id.myEditText)
myEditText.setOnKeyListener { v, keyCode, keyEvent ->
    // if A pressed
    if (keyCode == KeyEvent.KEYCODE_A) {
        // ...
        return@setOnKeyListener true
    }
    return@setOnKeyListener false
}
```
</details>
</div></div>

<hr class="sr">

## Multitasking

<div class="row row-cols-md-2"><div>

Most android applications runs on one "main" thread usually called "UI Thread", which is the one handling rendering the view, processing events, and so on.

To run long operations, you can't use this thread, and have to use background threads, as you can't render the view/respond to events, if the main thread is busy.

While you can use threads to run background tasks, you should use [**coroutines**](https://developer.android.com/kotlin/coroutines) which are a modern, and more efficient way of doing that. A coroutine is doing a job, that can be halted/resumed. They are created from a **CoroutineScope**, while the **Dispatcher** is the one telling on which thread a coroutine will execute.

Dispatchers are **Main** (main thread), Default, IO, or Unconfined.

Scopes are

* **GlobalScope**: executed as long as the app is running.
* **viewModelScope**: only inside a viewModel, canceled if the view model is cleared.
</div><div>

On each scope, you can call

* `launch {}`: the most used one, simply lunch a coroutine with some code
* `runBlocking {}`: block the running thread to execute some code
* `async {}` which generate a Deferred (=Promise) that can be "await".

Some code may be paused/resumed. If you use such a function, marked `suspend`, then you must make your own function `suspend`.

```kotlin
viewModelScope.launch {
    // lunch is suspend, we can call a suspend function
    waitFiveSeconds()
}

private suspend fun waitFiveSeconds() {
    // delay is a suspend function
    // we can call it, waitFiveSeconds is suspend too
    delay(5000)
}
```

</div></div>

<hr class="sr">

## Data binding

<div class="row row-cols-md-2"><div>

**Data binding** can be used to get rid of observers, and directly connect the model with the view, inside the .xml.

```kotlin
buildFeatures {
    dataBinding = true
}
```

Then, you must manually edit the `.xml` using data binding, by wrapping its content in a `layout`. You will also add a section `data` with `variables`. Variables are set from the code, are instances of a class, and can be used in the rest of the `.xml`.

<details class="details-e">
<summary>See the XML</summary>

```xml
<?xml version="1.0" encoding="utf-8"?>
<layout>
    <data>
        <variable name="viewModel" type="xxx" />
    </data>

    <!-- then, you can use it in your tags, -->
    <!-- and you can even write some code -->
    <tag
        android:text="@{viewModel.xxx}"
        android:text="@{@string/xxx(yyy)}"
        android:text='@{viewModel.boolean ? "x" : "y" }'
        android:text='@{viewModel.boolean ? @string/toto : "" }'
        android:checked="@{viewModel.xxx.equals(yyy)}"
        android:onClick="@{() -> viewModel.xxx()}"
    />
</layout>
```
</details>

</div><div>

In the code, get the binding, and set variables

<details class="details-e">
<summary>Load Data Bound XML</summary>

If you are using it on an `activity_main.xml`

```kotlin
private lateinit var binding: XXXBinding

binding = DataBindingUtil.setContentView(this, R.layout.activity_main)
// optional, mandatory if using LiveData
binding.lifecycleOwner = this
```

If you are using it on an `fragment.xml`

```kotlin
private lateinit var binding: XXXBinding

binding = DataBindingUtil.inflate(inflater, R.layout.fragment, container, false)
// optional, mandatory if using LiveData
// in "onViewCreated"
binding.lifecycleOwner = viewLifecycleOwner
```
</details>

If you added variables, you need to set them. If you are in a Fragment, then DON'T forget that you must do this on `onViewCreated()`.

```kotlin
// set variables
binding.viewModel = ...
```

<details class="details-e">
<summary>Data binding for attributes needing formatting</summary>

You may have to pass an attribute that need to be formatted before being shown to the view. If you can't do it like in the examples shown in the XML above, such as a ternary operator (`condition ? "token" : "another token"`) which isn't available in data binding braces, then you can try a little workaround

```gradle
plugins {
    // add kapt
    id 'kotlin-kapt'
}
```

You could add this code wherever you want, such as in the associated Fragment. `xxx` is the name of the new attribute we will create. `TextView` is the one we will give the attribute `xxx`. `value` is the value we will pass, coming from a Data Binding, and `Type` is the type of the value we will pass. The code of this method can be everything you want, so you can do your formatting here.

```kotlin
companion object {
    @BindingAdapter("app:xxx") @JvmStatic
    fun bindXXXText(textView: TextView, value: Type) {
        textView.text = ...
    }

    @BindingAdapter("app:data")
    fun bindRecyclerView(recyclerView: RecyclerView, data: List<XXX>?) {
        val adapter = recyclerView.adapter as XXXAdapter
        adapter.submitList(data)
    }

    // optional, usually not needed
    @InverseBindingAdapter(attribute = "app:xxx", event = "android:textAttrChanged")
    @JvmStatic
    fun getText(textView: TextView) = textView.text.toString()
}
```

In your XML, you will use this newly created attribute, that is taking your value that you could "display as if", execute the code you wrote, which should display the value you couldn't before.

```xml
<TextView
    app:xxx="@{viewModel.aNotDisplayableValue}"
    />
```
</details>
</div></div>

<hr class="sr">

## Fragments, and navigation component

*[Navigation component (guide)](https://developer.android.com/guide/navigation/navigation-getting-started)*

<div class="row row-cols-md-2 mt-4"><div>

<details class="details-e">
<summary>Fragment + ViewBinding</summary>

```kotlin
class XXXFragment : Fragment() {
    private lateinit var binding: FragmentXXXBinding

    override fun onCreateView(
        inflater: LayoutInflater, container: ViewGroup?,
        savedInstanceState: Bundle?
    ): View {
        binding = FragmentXXXBinding.inflate(layoutInflater, container, false)
        return binding.root
    }

    override fun onViewCreated(view: View, savedInstanceState: Bundle?) {
        val xxx = binding.xxx
        // ...
    }
}
```
</details>

The **navigation component** is a collection of libs simplifying android navigation. For instance, for a bottom navigation, you would want to click on icons, and move from one screen to another. In such case, the navigation component would handle for you stuff like highlighting the current menu.

```gradle
// At the top of your build.gradle
buildscript {
    dependencies {
        classpath "androidx.navigation:navigation-safe-args-gradle-plugin:2.5.2"
    }
}

// after plugin { ... }
apply plugin: 'androidx.navigation.safeargs.kotlin'

// then as usual
implementation "androidx.navigation:navigation-fragment-ktx:2.5.2"
implementation "androidx.navigation:navigation-ui-ktx:2.5.2":2.5.2"
```
</div><div>

<details class="details-e">
<summary>NavHost: view where fragments are displayed</summary>

The **NavHost** is a container that you will put in your activity.xml, that will be filled with the current fragment being displayed.

It will be linked to a **Navigation graph**, which will handle filling the container with the right fragment. If you are familiar with Java, this is the same as a CardLayout.

Open your `activity.xml`

* Add a **NavHostFragment**
* Create a **Navigation Graph** (ex: nav_graph)
* You are done, move to the Navigation Graph section

> **defaultNavHost** is an attribute when true, which is the default value, allows the host to interact with the navigation hierarchy, meaning that for instance, when "back" is pressed, then the Navigation Graph will go back to the previous screen.
</details>

<details class="details-e">
<summary>Navigation graph: navigation between fragments</summary>

This is a file, with an editor, allowing to link fragments, and define what **action** make the user move to another fragment, and what parameters are added... Each fragment/screen is called **destination**.

* Resource manager | Navigation | New
* Click on the phone with a +
* Add your fragments
* Use arrows to link your screens
* Click on a screen to define arguments that are passed
* Select the initial screen, and click on the "Home button" (Assign start destination). You can also right-click on a screen, as use "set as start destination".

> **Note**: if you want the name shown in the navbar to match the current fragment, edit the property `label` of each fragment with something else than `@string/app_name`.
</details>

<details class="details-e">
<summary>NavController: ...</summary>

```kotlin
private lateinit var navController: NavController

override fun onCreate(savedInstanceState: Bundle?) {
    // ... code ...
    val navHostFragment = supportFragmentManager
        .findFragmentById(R.id.fragmentContainerView) as NavHostFragment
    navController = navHostFragment.navController
    // show menus
    setupActionBarWithNavController(navController)
}

// handle "up" button, to go back if pressed
override fun onSupportNavigateUp(): Boolean {
    return navController.navigateUp() || super.onSupportNavigateUp()
}
```
</details>

<details class="details-e">
<summary>Navigate to another fragment</summary>

Use the function `navigate` on the nav controller

```kotlin
// in a Fragment
findNavController().navigate(action)
// or, if your action do not take any parameters
findNavController().navigate(action_id)
```

You need to provide an action. If you are inside `XXX`, then the action will be available as a static method of `XXXDirections`. You may have to build the project, as these classes are created for you by the SafeArgs plugin, when you connected two fragments.

```kotlin
// the name of the action is the one of your link
// between the two fragments.
// hint: use autocompletion with CTRL+SPACE
val action = XXXDirections.actionSomeName()
// if you defined parameters to your action
val action = XXXDirections.actionSomeName(param = value)
```

In the other fragment, let's say, `YYY`, you will have a class `YYYArgs` that will be generated. Then, you can do this to get "`arg`"

```kotlin
val args by navArgs<XXXArgs>()
val arg = args.arg
```
</details>

<details class="details-e">
<summary>Navigation UI</summary>

A set of UI components to do "Options Menus, bottom nav, nav view, nav drawer, action bar, toolbars, and collapsed toolbars". For instance, for a bottom navigation menu, 

* Create a BottomNavigationView,
* Process as you do for menus
* And, in the code,

```kotlin
val bottomNavigationView = binding.bottomNavigationView
bottomNavigationView?.setupWithNavController(findNavController())
```
</details>

<details class="details-e">
<summary>Navigation back-stack</summary>

As much as an Application has a "back" stack with Activity, each Activity has a "back" stack for every fragment. As for activities, the top fragment is the one shown, and pressing back will pop up this fragment, and load the new top fragment. If this was the last, then the activity will be pop-up instead.

Within the Navigation Graph, there are attributes "popUpTo", and "popUpToInclusive". They are used to manually pop up fragments when moving to another fragment. It could be useful if you are going back to your starting fragment, and you want to pop up every fragment on the way, so that the user can't press "back", and cancel its action of moving to the starting fragment.

* Imagine a stack of fragments `ABCDE`, with `E` on top
* `E` navigate to `A` would be that we will have `ABCDEA`
* Pressing "back", the user will be back on `E`
* Instead, you may want to pop up every fragment, until "A": **popUpTo: A**
* Now, `E` navigate to `A` would be that we will have `AA`
* The job was done, but since `A` isn't included in the "pop up" operation, there is two '`A`'. You could fix that with `popUpToInclusive=true`
* Now, `E` navigate to `A` would be that we will only have `A`
</details>
</div></div>