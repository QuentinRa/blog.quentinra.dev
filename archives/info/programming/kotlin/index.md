# Kotlin programming

Kotlin is a open-source, modern, programming language developed by JetBrains, which is also the main language used for Android applications. Kotlin's syntax is a sort of mix between Java, R, and Typescript, while the language itself is an improved version of Java, with more safety checks, and more flexibility, while being less verbose/more compact.

> Kotlin code can be converted in Java, through the generated code is somewhat unreadable.

<hr class="sr">

## Basics

<div class="row row-cols-md-2 mx-0"><div>

As you would in Java, everything is starting from the main function.

* "args" is optional if not used
* Unit is implicit, so it's optional too
* There is no need for "main" to be in a class/static
* There is no need for `;` (semicolon)
* There is some "aliases" for functions such as "System.out.println" which has an alias "println".
</div><div>

```kotlin
fun main(args: Array<String>) : Unit {
    println("Hello World!")
}
fun main() {
    println("Hello World!")
}
```
</div></div>


<hr class="sl">

## Variables, and types

<div class="row row-cols-md-2 mt-4"><div>

| Type                       | Note                                          |
|----------------------------|-----------------------------------------------|
| Unit                       | `void` in Java.                               |
| Any                        | `Object` in Java.                             |
| Int, Number, Float, Double |                                               |
| String, Char               |                                               |
| IntRange                   | ex: `1..6`. You can call `.random()` on it... |

* If a type accept the value null, then you must add a `?` after the type.
* Types are usually inferred, no need to explicitly write them
* You do not need to concatenate strings, you can use `$` to inject code, such as `"Random number: ${5+2}"`

</div><div>

Use **var** to declare a variable

```kotlin
var someVar1 : Int = 5
var someVar2 = 5
var someVar3 : String? = null
```

Use **val** to declare a constant

```kotlin
val someVal1 : Int = 5
val someVal2 = 5
```
</div></div>

<hr class="sr">

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
}
```

Instantiation is done like in Java, but without the new keyword <small><s>(so, more like in C++)</s></small>.

```kotlin
val anObject = SomeClass()
```
</div><div>

You can add a constructor, and methods, like for records in Java

```kotlin
class SomeClass(val attribute: Int) {
    fun myMethod() {}
}

val anObject = SomeClass(5)
anObject.myMethod()
```

You can add a visibility <small>(explicit public, private, protected, internal...)</small> before an attribute/method.

```kotlin
class SomeClass {
  private var attribute1 = 5
  protected val attribute2 = 5
}
```

</div></div>

<hr class="sr">

## References

* [Android Basics Kotlin Vocab](https://developer.android.com/courses/android-basics-kotlin/android-basics-kotlin-vocab)
* [developer.android.com](https://developer.android.com/guide)
* [Android Basics in Kotlin](https://developer.android.com/courses/android-basics-kotlin/course)