# Packages and import

[Go back](../index.md#beginner)

When using java, you will use some classes defined by the JDK like `Math`, `Exception` or `Integer`, ... You don't have to import class like `Exception` or `Integer`  (since they are imported by default, being in the package `java.lang`) but sometimes you will have to import some classes. For that, you should know what's a **package**.

<hr class="sr">

## Package

At first, we can say that a **package** is a folder. For instance, you can put your code in a folder `src` and say "Hey! My code is in the package src".

But there are some rules

* you must replace **path separators** (/, \\) with `.` (dot)
* usually, the root package is a TLD (com, org, fr, net, ...)
* you must **only use lowercase characters**, no _ or A-Z, ...

So a package name usually looks like this `package com.lgs.memorize;`. That's mean that we will have a folder `com`, and a folder `lgs` inside, and a folder `memorize`. 

You will have to add such a line at the top of each of your files **if you are using packages**. Yeah! If you put all of your files in the same folder, they are "imported" by default, so you will only have to use packages **if you are using folders**.

```java
package com.lgs.memorize;

public class Test {}
```

<hr class="sl">

## Import

When you need classes from another package, such as `File` class, you need to import the package having the class `File`. Check the documentation, and once you found that the package is `java.io;` so you can write

```java
// import File class only
import java.io.File;

// all classes in the package
import java.io.*;
```

**Note**: you should not use `*` (import all) unless you have a lot of classes imported from this package since you are importing all classes and the package may have a lot of classes. Sub packages aren't imported.

You can also import a static member, but you usually use the import like above then write `File.createTempFile` (that's an example).

```java
// in the code, you won't need to write
// File.createTempFile(...) and can directly write createTempFile(...)
import static java.io.File.createTempFile;
```

<hr class="sr">

## package.info

Usually, you write a ``package.info`` in each one of your packages.

```java
/**
* some Javadoc here, see the Javadoc section
*/
package com.lgs.memorize;
```