# Singleton

[Go back](..)

We will have a private static attribute, having the type of our class.
And we will have a method usually called ``getInstance`` returning the instance.

Constructor is usually private.

**lazy instantiation**

We are initializing our attribute in ``getInstance``, only if our attribute
is null.

**early instantiation**

We are initializing our attribute when we are declaring it.

* ➡️ : utilities classes
* ✅ : memory consumption should decrease
* 🚫 : instance is shared/global

## Example in Java

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

// ou

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