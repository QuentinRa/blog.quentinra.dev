# Factory Design Pattern

<div class="row row-cols-md-2"><div>

**Aliases** 📌: Virtual constructor

**Description** 📚: we can use it to control how a class instances are created, for instance, to "hide" which class we effectively created.

```java
public A someMethod() { return new XXX(); }
```

➡️ We say that the return type is `A` but the class instantiated may be a subclass or a class implementing `A`.

</div><div>

**Advantages** ✅

* More flexible, we can change the instantiated class or the constructor call easily.

**Disadvantages** 🚫

* We may create have to create a lot of classes

**Notes** 📝

* An example would be `SomeClass#iterator()` method in Java
</div></div>