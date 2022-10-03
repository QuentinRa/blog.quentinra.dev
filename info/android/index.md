# Android development

### DISLAIMER: DIS IS NOT A COURSE.

* Android Studio
* Kotlin

<hr class="sr">

## Kotlin

* there is some "alias" for functions. For instance "System.out.println" as an alias "println" (in Console.kt / kotlin.io).

Classes.

```kotlin
class X {
  // public
  var attribute1 = 5
  val attribute2 = 5
}

// attribute public but const
class X(val _attribute: Int) {
}
```

Instantiation

```kotlin
var x = X()
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
    * scaleType:centerCrop scale without distorting (9patches)
  * Display a button: `Button`
* Views can be clickable/editable/...
* Views are arranged by `ViewGroup`.
  * **ConstraintLayout**: "arrange in a flexible way"

Layout are edited using the layout editor. `res > layout > activity_main.xml`. Using the top-right buttons, you can switch between Code/Split/Design.

* Left: Design view, this is basically what you will see.
* Right: BluePrint view, everything is show on it, included hidden elements.
* Palette: list of Views
* Component tree: structure of the screen ("lists all the views of your screen")
  * The higher ones are rendered below the lower ones
* Attributes: edit some Views' properties

Returning on the view

* To place an element in a **ConstraintLayout**, you need to add constraints to it.
* If you give layout_width+height "0dp", android studio will match the constraint. If they are "0", then it basically means "fill".

> You can attach a component to another in a constraint layout. click on one of the four circles on something, and link it ot the circle of another view. By doing so, constraint will be relative to the other view. And, moving the "parent" will move the child.

> * You got options to do things faster using right-click.
> * There is a search bar (ex: for attributes)

<hr class="sr">

## Resources

On the left side, or in View > Tools Windows, you got the "Resources Manager". You can use it.

**Import image**

* Go to Drawables
* Click on "+"
* Import drawables
* The new file should be in the list
* You can drag, and drop it in the design view (or select it when creating a new imageview)

<hr class="sr">

## Localization

There is a folder `values` in resources. You can add your own folder for a specific case (ex: support another language). In strings.xml, you can add 

* a key
* a "default" translation for this key

If you create another folder "values" (ex: `values-fr+ca/strings.xml`), you will keep the key, and change the translation. In the code, you will only reference the "key".

If you created something with a "text" not localized. You can click on the "warning", then expand "Hardcoded text", and click on fix.

<hr class="sl">

## Accessibility

* `contentDescription`: what's the purpose of this element
* `importantForAccessibility`: if this element is just decorative, you can set it to no

<hr class="sr">

## Resources

* [developer.android.com](https://developer.android.com/guide)
* [Android Basics in Kotlin](https://developer.android.com/courses/android-basics-kotlin/course)