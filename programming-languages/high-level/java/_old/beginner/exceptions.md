# Exceptions

[Go back](../index.md#beginner)

In Java, we got the

* **verified exceptions**: you can't patch them, you must deal with them
* **runtime exceptions**: you made a mistake, you can patch it

For example, opening a file is a **verified exceptions** since you can't patch the fact that a file can't be opened/created/...

A **runtime exceptions** would be a NullPointerException meaning that you tried to use a variable having `null` for value. That's something you can patch!

When dealing with exceptions, you can either

* say that the one called will be the one dealing with it (default)
* or capture the exception and deal with it

**In case of verified exceptions**, you need to explicitly write in your code if that's up to the caller to deal with it.

If no one dealt with an exception, meaning that each one throw it to the caller, until the main that's you've called, then the program will crash and will show you an exception.

<hr class="sr">

## Syntax

```java
try {
    // here write your code that can fails
    // and the rest of your code
} catch(TypeException e){
    // if you got an exception, then the code
    // here will be executed.
}
```

Here some "TypeException"

* ``Exception``: any kind of exception
* ``NumberFormatException``: tried to convert a string to int and that failed, ...
* ``IllegalArgumentException``: call with the wrong argument
* ``IllegalStateException``: call with wrong preconditions (logout before login)
* ``ArrayIndexOutOfBoundsException``: invalid index
* ``NullPointerException``: tried to use a null variable
* ``IOException``: related to input/output...
* ... check the documentation ...

You can fire an exception by yourself!

```java
throw new IllegalStateException(message);
```

You can explicitly write that the caller will have to deal with this exception

```java
public void error() throws IllegalArgumentException {
    // code
}
```

Example

```java
try {
    // try to convert to int some invalid string
    Integer.parseInt("NotANumber");
} catch(NumberFormatException e) {
    // here some methods that can be used

    // print the stack trace
    e.printStackStace();

    // print error message
    System.err.println(e.getMessage());
}
```

<hr class="sl">

## Multiples try-catch

You can capture multiples exceptions in one or more catch.

```java
try {
    // ...
} catch(TypeException1 type1){
    // ...
} catch(TypeException2 type2){
    // ...
}
```

or if the code is the same

```java
try {
    // ...
} catch(TypeException1|TypeException2 type1){
    // ...
}
```

<hr class="sr">

## finally

You can use a try-finally or a try-catch-finally. Whatever happens, the code inside finally will be executed, meaning that even if some exception is fired, then this code will be executed before sending the exception to the caller (if not catch).

```java
try {
    // ...
} catch(Exception e) {
    // ...
} finally {
    // ...
}
```

<hr class="sl">

## resources

If you got a class, like a stream for a file, that's closable then you can use a try with resources that will automatically close the stream at the end of the code.

```java
try (Closable c = ...) {
    // ...
}
```

Since Java9, you can write

```java
try (c) {
    // ...
}
```