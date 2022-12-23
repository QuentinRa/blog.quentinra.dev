# Android development

**[Updated notes](index.md)**

* [**RecyclerView**](layouts/RecyclerView.md): not a ViewGroup, but an efficient way of displaying a flexible list of elements.

<hr class="sl">

## Resources

<div class="row row-cols-md-2 mx-0"><div>

Every folder in `res` may have multiples "copies" for different devices/languages. For instance, if there is a view for large screen devices, it will be used instead of the view made of "every" device.

* [arrays.xml](values/arrays.md): handle arrays of strings/integers

</div><div>

<details class="details-e">
<summary>Access resource's (view...) Id in the code</summary>

Each resource may have an id. The main class `R` is managing every id trough subclasses such as `drawable`. If you want a drawable with the id `ic_launcher_foreground` do:

```kotlin
val drawableId : Int = R.drawable.myDrawable
val viewId : Int = R.id.hello_world
```
</details>

If you write in your code a method taking an id, then you can check if this id has the "right" type using annotation, as every id is an int. Add `@StringRes`, `@DrawableRes`, or `@LayoutRes` before a variable, a parameter, or an attribute.

```kotlin
fun loadIcon(@DrawableRes drawableId: Int) {
    val drawable = AppCompatResources.getDrawable(this, drawableId)
}
```
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

## Fragments, and navigation component

*[Navigation component (guide)](https://developer.android.com/guide/navigation/navigation-getting-started)*

<div class="row row-cols-md-2 mt-4"><div>

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