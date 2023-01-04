# Kotlin programming

<div class="row row-cols-md-2"><div>

Kotlin is a open-source, modern, programming language developed by JetBrains since 2011.

* 👉 More concise, simplified, version of Java
* 👉 Can be converted back to a `.java`
* 👉 Main language used for Android applications
</div><div>

**Where to learn?**

* [Documentation](https://kotlinlang.org/docs/home.html) 🌍
* [Playground](https://play.kotlinlang.org/) 🎮
</div></div>

<hr class="sep-both">

## Basics

<div class="row row-cols-md-2"><div>

Use **var** to declare a variable

```kotlin
var someVar1 : Int = 5
var someVar2 = 5 // inferred
```

Use **val** to declare a constant

```kotlin
val someVal1 : Int = 5
val someVal2 = 5 // inferred
```

➡️ Semicolons ( `;` ) are optional.

By default, Kotlin variables cannot be `null`. To declare a nullable variable, you must add `?` after the type.

```kotlin
var someVar3 : String? = null
someVar3?.toString() // Optional chaining
someVar3?.toString() ?: "null" // default value
someVar3!!.toString() // Assert non null
```
</div><div>

Types are implicit. There are a few changes with Java.

* `Unit` (kotlin) is `void` (Java)
* `Any` (kotlin) is `Object` (Java)
* `Int` (kotlin) is `Integer` (Java)
* `Number`, `Float`, `Double`, `String`, `Char`

You can convert an XXX to an YYY with `.toYYY()`

```kotlin
val d = "5".toDouble()
val d = "5".toDoubleOrNull() // instead of using exceptions
```

You can use `$var`/`${code}` to use a variable/some code in a string.

```kotlin
val str = "The value of d is $d"
val str = "The square of d is ${d * d}"
```

There are also functions for null-safe operations

```kotlin
i?.plus(2) // i+=2 (if not null)
i?.inc() // i++ (if not null)
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

You can use `TODO` to create a to-do. If a function with a to-do is called, it will raise an exception.

```kotlin
TODO("Not yet implemented")
```
</div><div>

#### Lambdas

In kotlin, there are many functions taking another function (lambda).

```
fun xxx(yyy: (Int) -> String) { /* ... */ }
// possible usage
xxx( fun (x: Int) : String = x.toString() )
```

We usually use the **trailing lambda syntax**. The parameter is available in a variable called `it`.

```
xxx { it.toString() }
```

We can explicitely add the return type and/or the argument name.

```
xxx { v: Int ->
    return@xxx v.toString()
}
```
</div></div>

<hr class="sep-both">

## Control-flow

<div class="row row-cols-md-2"><div>

There are a few major changes compared to Java.

* ➡️ `instanceof` was replaced by `is`.

```diff
- if (xxx instanceof SomeClass yyy) {}
+ if (xxx is SomeClass) {
+    xxx.zzz() // ➡️ no cast in yyy needed!
+}
```

* ➡️ The ternary operator was removed (😵)

```diff
-int x = true ? 1 : 0
+val x = if (true) 1 else 0
```

* ➡️ `switch` was replaced by `when`

```kotlin
// do something
when (xxx) {
    yyy -> println("xxx=yyy")
    zzz -> println("xxx=zzz")
    else -> {}
}
// return a value
val x = when(xxx) {
    yyy -> true
    else -> false
}
```

The major change with this new syntax, is that we can do other things in a `when` that simply comparing with `==`.

```kotlin
when (xxx) {
    is A -> println("xxx is an instance of A")
    is B -> println("xxx is an instance of B")
    else -> println("???")
}
```

➡️ There is a new bloc `repeat` to repeat the code inside X times.

```kotlin
repeat(5) { /* job */ }
```

➡️ There is a new operator to cast a variable: `as`.

```kotlin
val yyy = xxx as YYY
val yyy = xxx as? YYY
```
</div><div>

➡️ Every `for` was replaced with a `for in`.

```kotlin
// for "each"
for (e in listOf<Int>(5, 3)){}
// for "i=min; i < max; i++"
// ex: min=0, max=10, from "0" to "9"
for (i in min until max)
// for "i=min; i <= max; i++"
// ex: min=0, max=10, from "0" to "10"
for (i in min .. max)
// for "i=max; i > min; i--"
// ex: max=10, min=0, from "10" to "0"
for (i in max downTo min)
```

You can add a step

```kotlin
// i+=2 giving us 3, 5
for (i in 3 .. 6 step 2){}
```

#### Scope functions

[Documentation](https://kotlinlang.org/docs/scope-functions.html)

➡️ Use `apply` to factorize successive calls on the same object. The returned value is `xxx` (the caller).

```kotlin
xxx.apply { /* xxx == this in this bloc */ }
```

➡️ Use `with` to factorize successive calls on the same object. The returned value is the last expression of the block.

```kotlin
with(xxx) { /* xxx == this in this bloc */ }
```

➡️ Use `also` to group successive calls using the same object. The returned value is `xxx` (the caller).

```kotlin
xxx.also { /* xxx is available in a variable "it" */ }
```

➡️ Use `let` to group successive calls using the same object. The returned value is `xxx` (the caller).

```kotlin
// if "xxx" could be null, then using "?.let"
xxx?.let { /* "it" is not null here */ }
// you can name the argument
xxx?.let { xxxNonNull -> {} }
```

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

Functions with a "simple" body can be inlined

```kotlin
fun sum(x: Int, y: Int) : Int = x + y
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

You can write variadic functions with `vararg` instead of `...`.

```
fun x(vararg x: Int) {
    // x is an Array<Int>
}
```
</div></div>

<hr class="sl">

## Classes, and objects

<div class="row row-cols-md-2 mx-0"><div>

#### Basics

```kotlin
class SomeClass {
  var attribute1 = 5
  val attribute2 = 5

  fun myMethod() {}
}
```

Instantiation is done **without** calling the new keyword

```kotlin
val anObject = SomeClass()
```

#### Constructors

Each class can have **one primary constructor**, in which you can declare attributes, and execute code inside `init {}`. You can add additional constructors if needed.

```kotlin
class SomeClass(val x1: Int, // public attribute
                private val x2: Int, // private attribute
                local: String) { // local variable
    init {
        // local is only available here
    }

    constructor(x1: Int) : this(x1, 0, "") {

    }
}
```

```kotlin
val anObject = SomeClass(5, 0, "")
anObject.x1 // ✅ (public, 5)
anObject.x2 // ❌ (private)
anObject.local // ❌ (not an attribute)
val another = SomeClass(3)
```

#### Getters/Setters

You may use backing fields. A private attribute which is either `var`/`val`, along a public attribute which may have a more restrictive type. In the example below, others can't add elements in the list.

```kotlin
class XXX {
    private val _list = mutableListOf<Int>()
    val list : List<Int> = _list
}
```

The syntax below is a shortcut to declare the getter.

```kotlin
val list : List<Int>
    get() {
        return _list
    }
```

You can also add a setter the same way

```
var xxx : Int
    get() { /* ... */ }
    set(value) {
        // ...
    }
```

#### Static

Each class can have one companion object in which variable/functions declared inside are `static`.

```kotlin
class SomeClass(val x1: Int) {
    companion object {
        // attribute
        val xxx: String = "10"
        // const
        const val YYY: String = "10"
        // function
        fun zzz() {}
    }
    // named companion object
    // companion object XXX {}
    // companion object XXX : YYY {}
}
```

```kotlin
SomeClass.xxx
SomeClass.YYY
SomeClass.zzz()
```

➡️  If the companion object extends `YYY`, you can pass either the Class (`SomeClass`) or the companion object (`SomeClass.XXX`).
</div><div>

#### Visibility

By default, classes members (methods, and attributes) are **public**. You can change the visibility to `private`, `protected`, or `internal`.

```kotlin
class SomeClass {
  private var attribute1 = 5
  protected val attribute2 = 5
  protected fun myMethod() {}
}
```

#### Inheritance

<p></p>

```
// ➡️  with an interface
class SomeClass : Comparable<SomeClass> {
    override fun compareTo(other: SomeClass): Int {
        TODO("Not yet implemented")
    }
}
// ➡️  with a class
// Classes are final by default.
// Use 👉 "open" to allow inheritance.
open class SomeClass {}
class AnotherClass : SomeClass() {}
```

Multiple inheritance is possible, but you must handle conflicts.

```
interface A { fun a() {} }
interface B { fun a() {} }
class AnotherClass : A, B {
    override fun a() {
        super<A>.a()
    }
}
```

Attributes can be abstract now

```kotlin
abstract class AClass(){
    abstract val xxx: String
    abstract fun aName(): XXX
}

class AnotherClass : AClass() {
    override val xxx: String = "10"
    override fun aName(): Int { return 0 }
}
```

#### Extension function

It's possible to add a function to a class "dynamically".

```kotlin
// ➡️ Declaration: Class.newMethodName
fun Int.square(): Int {
    return this * this
}
// ➡️ Can be called from any instance
5.square()
```

#### Object

An `object` is the same as a Singleton.

```
object XXX {
    const val YYY = 1
    fun zzz() {}
}

// ...
XXX.YYY
XXX.zzz()
```

#### Data class

A dataclass is a class to store data.

```kotlin
data class XXX(private val yyy: Int)
```

#### Enum class

The syntax for enums is similar to Java aside from the `class` after `enum`. The syntax for enums with parameters is a bit different.

```kotlin
enum class AAA(val ddd: Int) {
    BBB(0),
    CCC(1),
}
```

</div></div>

<hr class="sep-both">

## Collections

<div class="row row-cols-md-2"><div>

* Create a list

```kotlin
val list = listOf<Int>()
val list = mutableListOf<Int>()
val list = emptyList<Int>()

println("List: $list")
println("List: ${list.size}")
println("List: ${list[0]}")
println("List: ${list.first()}")
println("List: ${list.last()}")
// and there are usual functions:
// add, remove, clear, addAll,
// isEmpty, contains...
```

➡️ You can convert a map/an array/a set to a list with `.toList()`.

* Create an array

```kotlin
val array = arrayOf<Int>()
// ...
```

</div><div>

* Usual functions on lists/arrays

```kotlin
l.forEach { /* ... */ }
l.map { /* apply a transformation on each element */ }
l.filter { /* keep values passing the filter */ }
l.shuffled() // shuffle
l.take(n) // take "n" elements
// sort
l.sorted()
l.sortedWith {}
l.joinToString(", ")
```

* Create a set

```kotlin
val set = setOf<Int>()
// ...
```

* Create a map

```kotlin
val map = mutableMapOf<String, String>(
    "key" to "value",
    // ...
)
map["key"] = "value"
val value : String? = map["key"]
```
</div></div>

<hr class="sep-both">

## Random

<div class="row row-cols-md-2"><div>

#### Thread

```kotlin
val thread = Thread {
    // Thread.sleep(50)
    // Thread.currentThread()
    // ...
    println("Thread started")
}
thread.start()
```
</div><div>

...
</div></div>

<hr class="sep-both">

## 👻 To-do 👻

Stuff that I found, but never read/used yet.

<div class="row row-cols-md-2"><div>

* Interaction types (`T extends XXX<YYY, ZZZ>  & TTT &  UUU`)
* top-level function (not in a class)
* top-level variables (not in a class)
* delegation (`private val xxx: YYY by yyy()`)
* `lateinit`

```
@JvmStatic
@Throws(FileNotFoundException::class)
```
</div><div>

* [dokka](https://github.com/Kotlin/dokka) (documentation)
* [koin](https://insert-koin.io/) (documentation)
* [Quick-reference](https://kotlin-quick-reference.com/)

</div></div>