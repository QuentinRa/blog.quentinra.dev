# Multiton

[Go back](..)

This is the same as for Singleton, but we have also another attribute to limit the number of instances created.

* ➡️ : when you want a bit more than a singleton
* ✅ : memory consumption should decrease
* 🚫 : instances are shared/global

<hr class="sl">

## Example in java

lazy instantiation

```java
public class RpgMaker {
    private static final int MAX_INSTANCE = 5;
    private static ArrayList<RpgMaker> instance = null;

    // get instance, lazy instantiation
    public static RpgMaker getInstance(int i) {
        // creates
        if(i > MAX_INSTANCE || i < 0) throw new IllegalArgumentException("not a valid key");
        if(instance == null){ // creates
            instance = new ArrayList<>();
            for (int j = 0; j < MAX_INSTANCE; j++) {
                instance.add(new RpgMaker());
            }
        }
        return instance.get(i);
    }

    // private !!!
    private RpgMaker(){}

}

```

early instantiation

```java

public class RpgMaker {
    private static final int MAX_INSTANCE = 5;
    // creates, early instantiation
    private static final ArrayList<RpgMaker> instance = new ArrayList<>();

    static { // static constructor
        // fill
        for (int j = 0; j < MAX_INSTANCE; j++) {
            instance.add(new RpgMaker());
        }
    }

    // get instance
    public static RpgMaker getInstance(int i) {
        // creates
        if(i > MAX_INSTANCE || i < 0) throw new IllegalArgumentException("not a valid key");
        return instance.get(i);
    }

    // private !!!
    private RpgMaker(){}

}
```