# assert in Java

There is a native keyword `assert` in Java. Unfortunately, it's not enabled by default so you should not use them.

Run `java` with `-ea` or `-enableassertions`to enable assertions. You can enable them only in a package using `-da:package`.

In your code, write some assertions like this

```java
// without message
assert(condition);
// with a message
assert(condition) : "message";
```

If the assertion fails, the program will crash with a `AssertionError` with your message if you wrote one. A failure means that the condition is `false`.