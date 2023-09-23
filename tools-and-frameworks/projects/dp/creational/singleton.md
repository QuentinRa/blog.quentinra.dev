# Singleton Design Pattern

[Go back](../index.md#creational-)

<div class="row row-cols-md-2"><div>

**Aliases** 📌: None

**Description** 📚: the singleton is used to only have one instance of a class. It's a sort of global variable that we usually access by calling a method `#getInstance()` from the singleton class.

* **Lazy instantiation**: initialization of the global variable when requesting the instance

* **Early instantiation**: initialization of the global variable when declaring it

</div><div>

**Advantages** ✅

* Lower memory usage and consumption
* Centralizing a global point of access to a variable

**Disadvantages** 🚫

* Instances are shared/global so it increase complexity 

**Notes** 📝

* Commonly used for Utility Classes
</div></div>

<hr class="sep-both">

## Java implementation

<div class="row row-cols-md-2"><div>

#### Lazy instantiation

<p></p>

```java
public class RpgMaker {
    private static RpgMaker instance = null;

    // get instance, lazy instantiation
    public static RpgMaker getInstance() {
        // creates
        if(instance == null) instance = new RpgMaker();
        return instance;
    }

    // private !!!
    private RpgMaker(){}
}
```
</div><div>

#### Early instantiation

<p></p>

```java
public class RpgMaker {
    // creates, early instantiation
    private static RpgMaker instance = new RpgMaker();

    // get instance
    public static RpgMaker getInstance() {
        return instance;
    }

    // private !!!
    private RpgMaker(){}
}
```
</div></div>