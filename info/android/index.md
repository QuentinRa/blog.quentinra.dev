# Android development

### DISLAIMER: DIS IS NOT A COURSE.

* Android Studio
* Kotlin

<hr class="sr">

## Kotlin

* Use "fun" to declare a function
* If the return type is "void" which is `Unit` in Kotlin, then it can be omitted
* If an argument is not used, it can be removed
* params: 
  * `name: Type`
  * can have default values
  * Types are String, Any, Int...
  * If we add a "?" it means that something can be null

```kotlin
fun main(args: Array<String>) : Unit {
    println("Hello World!")
}
fun main() {
    println("Hello World!")
}
```

* there is some "alias" for functions. For instance "System.out.println" as an alias "println" (in Console.kt / kotlin.io).
* **no need for `;`**

```kotlin
fun main() {
    println("Hello World!")
}
```

There is no type object in Kotlin, use any.

```kotlin
fun noTO() : Any {}
```

```kotlin
fun noTO() : Any {}
```

**useful methods?**

* Class Arrays (Kotlins): `joinToString`

**random links**

* https://developer.android.com/courses/android-basics-kotlin/android-basics-kotlin-vocab

<hr class="sr">

## Android studio

* Pick android version
* Device emulator
* Tests

<hr class="sl">

## UI

* What you see on the screen (text, buttons...)
* Everything is a `View`
  * Display a text: `TextView`
  * Display an image: `ImageView`
* Views can be clickable/editable/...
* Views are arranged by `ViewGroup`.
  * **ConstraintLayout**: "arrange in a flexible way"

Layout are edited using the layout editor. `res > layout > activity_main.xml`. Using the top-right buttons, you can switch between Code/Split/Design.

* Left: Design view, this is basically what you will see.
* Right: BluePrint view, everything is show on it, included hidden elements.
* Palette: list of Views
* Component tree: structure of the screen ("lists all the views of your screen")
* Attributes: edit some Views' properties

Returning on the view

* To place an element in a **ConstraintLayout**, you need to add constraints to it.