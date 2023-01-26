# Singleton

[Go back](..)

We want only one instance of a class.

We will have a private static attribute, having the type of our class. And we will have a method usually called ``getInstance`` returning the instance. The constructor is usually private.

**Lazy instantiation**

We are initializing our attribute in ``getInstance``, only if our attribute is null.

**Early instantiation**

We are initializing our attribute when we are declaring it.

* ➡️ : utilities classes
* ✅ : memory consumption should decrease
* 🚫 : instances is shared/global

<hr class="sl">

## Example in Java

Lazy instantiation

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

Early instantiation

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