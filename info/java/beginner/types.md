# Types

[Go back](..)

Java have 8 primitives types:

* **boolean**: true/false
* **byte**: 8 bits
* **short**: 16 bits
* **char**: **16 bits**, a character such as ``'5'``
* **int**: 32bits, ``5``
* **float**: 32 bits, value such as ``5.0f``
* **double**: 32bits, ``5.0`` or ``5.0d``
* **long**: 64 bits

<hr class="sr">

## Creating a variable

```java
int i = 5;
```

<hr class="sl">

## Parsing

Each primitive class has a class having almost if not the same name,
for instance ``Integer`` for int. You would have methods such as

```java
// conversion from string to int
int i = Integer.parseInt("13");
```

Otherwise, any other type is a class such as Integer, Object,
ArrayList, ...

<hr class="sr">

## About Strings

You will create a String like this

```java
String s = "some text";

// since JDK 13
s  = """
    Hello
    World""";

// same as
s  = "Hello\nWorld";
```

Some methods you might use

```java
String s2 = s.toLowerCase();
String s1 = s.toUpperCase();
boolean empty = s.isEmpty();
boolean blank = s.isBlank(); // since jdk 11
boolean equals = s.equals(s2); // same as ==

String format = "%s: %d";
System.out.println(format.formatted("string", 0));
// Output: string: 0
// same as above
System.out.printf((format) + "%n", "string", 0);
```