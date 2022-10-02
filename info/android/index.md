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
* Views can be clickable/editable/...
* Views are arranged by `ViewGroup`.
  * **ConstraintLayout**: "arrange in a flexible way"