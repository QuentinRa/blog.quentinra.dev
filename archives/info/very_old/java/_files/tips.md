# Tips

These are tips that I received to improve my code.

<hr class="sl">

## Close streams

When you are reading a file (or any kind of stream), it's normal to close it, right? But was I was forgetting was that since I was using 1 try-catch for everything, the stream wasn't closed if we got a reading exception. Either use 3 (or more) try-catch or use a try-with-resources (closed automatically)

```java
// try-with-resources
try (FileReader reader = new FileReader(file)) {
    // ...
}
```

<hr class="sr">

## Static attributes change

It wasn't recommended updating a static field without using a synchronized static method so you must replace

```java
Class.attribute = value;
// by
Class.setAttribute(value);
// and
public synchronized static void setAttribute( /* ... */ ) { /* ... */ }
```

<hr class="sl">

## Static method call with inheritance

Let's says you got a method declared in a class A, and a class B inheriting A. Then for static methods, do not call ``B.method()`` if the method is declared in A.

The reason that was given to my is that It may confuse others and create an illusion that two static members are existing.