# Android development

**[Updated notes](index.md)**

<hr class="sr">

## Fragments, and navigation component

<div class="row row-cols-md-2 mt-4"><div>

or instance, for a bottom navigation, you would want to click on icons, and move from one screen to another. In such case, the navigation component would handle for you stuff like highlighting the current menu.

```gradle
// At the top of your build.gradle
buildscript {
    dependencies {
        classpath "androidx.navigation:navigation-safe-args-gradle-plugin:2.5.2"
    }
}

// after plugin { ... }
apply plugin: 'androidx.navigation.safeargs.kotlin'

findNavController().popBackStack()
```

define what **action** make the user move to another fragment, and what parameters are added... Each fragment/screen is called **destination**.
</div><div>


<details class="details-e">
<summary>Navigation graph: navigation between fragments</summary>

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