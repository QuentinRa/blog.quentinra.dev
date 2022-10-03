# Kotlin

Kotlin's syntax is a sort of mix between Java, R, and Typescript, while the language itself is an improved version of Java, with more safety checks, and more flexibility, while being less verbose. Kotlin code can be converted in Java, through the generated code is somewhat unreadable.

<hr class="sl">

## Variables, and types

<div class="row row-cols-md-2 mt-4"><div>

| Type                       | Note              |
|----------------------------|-------------------|
| Unit                       | `void` in Java.   |
| Any                        | `Object` in Java. |
| Int, Number, Float, Double |                   |
| String, Char               |                   |

* If a type accept the value null, then you must add a `?` after the type.
* Types are usually inferred, no need to explicitly write them

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