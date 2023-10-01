# Null Object Design Pattern

[Go back](../index.md#behavioral-)

<div class="row row-cols-md-2"><div>

**Aliases** 📌: None

**Description** 📚: The Null Object is a mock object that is used to let programmers handle when or how they will handle something null.

For instance, if we fetch records from a database and some have null attributes, we might not want to handle it if we didn't plan to use the nullable attribute. 

</div><div>

**Advantages** ✅

* Flexibility

**Disadvantages** 🚫

* ???

**Notes** 📝

* None
</div></div>

<hr class="sep-both">

## Java Implementation

<div class="row row-cols-md-2 mt-4"><div>

```java
public interface IPerson {
    String name();
}
```

```java
record Person(String name) implements IPerson {
}
```

```java
public class NullPerson implements IPerson {
    @Override
    public String name() {
        return "John Doe";
    }
}
```
</div><div>

We can code the default behavior however we want:

* throws an exception <small>(ex: unsupported operation)</small>
* returns `false`
* returns `0`
* returns `null`
* returns `undefined`
* returns another NullObject
* ...
</div></div>