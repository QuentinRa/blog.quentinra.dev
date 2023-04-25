# Types

[Go back](../index.md#beginner)

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

// print using a format
String format = "%s: %d";
System.out.println(format.formatted("string", 0));
// Output: string: 0
// same as above
System.out.printf((format) + "%n", "string", 0);
```