# UTF-8

[Go back](../../index.md#advanced)

As a side note, you may see weird characters in Strings when persons are not using UTF-8 (like à or é in French) so you should use the [unicode](https://unicode-table.com/en/) character code with a `\u` for unicode.

```java
System.out.println("\u00E9"); // print é
```

You may also change the encoding used when compiling with `java -Dfile.encoding=UTF-8`.