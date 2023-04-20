# Modules

[Go back](../../index.md#expert)

Nowadays, Java projects are encapsulated in what we call `modules`. You will create a module-info file and require other modules that may be used for your project. It's a higher encapsulation level than before.

You may only have one `module-info.java`. Usually a module name is like `com.a.module.name` or `org` instead of `com` but that's up to you!

```java
module name {
    // java.awt, javax.swing
    requires java.desktop;
    requires /* ... */;
    
    // our main module
    exports com.our.module;

    opens com.our.module.a.package;
}
```

As for the keyword

* `require`

This module is dependant on another module. You will write that if you are importing classes of another modules like this line `requires java.desktop;` allow you to import swing and awt.

* `export`

If you want other modules to use a class or classes inside a package, then simply exports it.

Subpackages are not imported, this is not recursive and ONLY the package explicitly written is exported (no ancestors, no descendants).

* `open`

Allow a full access to classes in a package, allows introspecting private members.
