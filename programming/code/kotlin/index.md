# Kotlin programming

<div class="row row-cols-md-2"><div>

Kotlin is a open-source, modern, programming language developed by JetBrains since 2011.

* 👉 More concise, simplified, version of Java
* 👉 Can be converted back to a `.java`
* 👉 Main language used for Android applications
</div><div>

...
</div></div>

<hr class="sep-both">

## Basics

<div class="row row-cols-md-2"><div>

Use **var** to declare a variable

```kotlin
var someVar1 : Int = 5
var someVar2 = 5 // inferred
var someVar3 : String? = null
```

Use **val** to declare a constant

```kotlin
val someVal1 : Int = 5
val someVal2 = 5 // inferred
```

➡️ Semicolons ( `;` ) are optional.
</div><div>

Types are implicit. There are a few changes with Java.

* `Unit` (kotlin) is `void` (Java)
* `Any` (kotlin) is `Object` (Java)
* `Int` (kotlin) is `Integer` (Java)
* `Number`, `Float`, `Double`, `String`, `Char`

By default, Kotlin variables cannot be null. To declare a nullable variable, you must add `?` after the type.

```kotlin
var someVar3 : String? = null
someVar3?.toString() // Optional chaining
someVar3!!.toString() // Assert non-null
```
</div></div>

<hr class="sep-both">

## Core

<div class="row row-cols-md-2"><div>

The main function can be put in Any file.

```kotlin
fun main(args: Array<String>) : Unit {
    println("Hello World!")
}
// or
fun main() {
    println("Hello World!")
}
```
</div><div>

...
</div></div>

<hr class="sep-both">

## Functions

<div class="row row-cols-md-2"><div>

We use the keyword `fun` to declare a function.

```kotlin
fun myFunction() {}
```

The name of a parameter is written before its type.

```kotlin
fun myFunction(param: String) {}
```

Parameters can have default values

```kotlin
fun myFunction(param: String = "Default") {}
```

A function can return something

```kotlin
fun myFunction() : Int { return 5 }
val five = myFunction()
```

</div><div>

We call a function as you would in Java.

```kotlin
myFunction()
```

Parameters can be given in any order.

```kotlin
fun myFunction(param1: String, param2: Int, param3: Any? = null) {}

myFunction("5", 5)
myFunction(param1 = "5", param2 = 5)
myFunction(param2 = 5, param1 = "5")

fun myFunction(param1: String = "s", param2: Int = 0) {}
val five = myFunction(param2 = 5)
```
</div></div>

<hr class="sl">

## Classes, and objects

<div class="row row-cols-md-2 mx-0"><div>

By default, classes members (methods, and attributes) are **public**.

```kotlin
class SomeClass {
  // public
  var attribute1 = 5
  val attribute2 = 5

  fun myMethod() {}
}
```

Instantiation is done **without** calling the new keyword

```kotlin
val anObject = SomeClass()
```
</div><div>

You can declare attributes directly inside the constructor.

```kotlin
class SomeClass(val attribute: Int, local: String) {
    init {
        // local is only available here
    }
}

val anObject = SomeClass(5)
anObject.attribute // 👌
```

You can add a visibility <small>(public, private, protected, internal...)</small>.

```kotlin
class SomeClass {
  private var attribute1 = 5
  protected val attribute2 = 5
}
```
</div></div>